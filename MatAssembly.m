function sysmat = MatAssembly(Geom,method)
%
%	Assembles the Matrix. Gets the geometry as input and uses piecewise constant functions.
%

if(method == 'c')

	n = length(Geom)-1; 
	sysmat = zeros(n);

	for i = 1:n
		for j = 1:n
			if(i == j)
				% Uses the analytical solution
				sysmat(i,j) = analytSolCol(Geom(i,:),Geom(j+1,:));
            else
                % Uses the adaptive quadrature of matlab, which can deal with singularities at the endpoints of the intervals
				sysmat(i,j) = quadratureCol(Geom(j,:),Geom(j+1,:),.5*(Geom(i,:)+Geom(i+1,:)));
			end
		end
	end
else
	n = length(Geom)-1; 
	sysmat = zeros(n);

	for i = 1:n
		for j = 1:i
			if(i == j)
				% Uses the analytical solution
				sysmat(i,j) = analytSolGal(Geom(i,:),Geom(j+1,:));
            else
                % Uses the adaptive quadrature of matlab, which can deal with singularities at the endpoints of the intervals
				sysmat(i,j) = quadratureGal(Geom(i,:),Geom(i+1,:),Geom(j,:),Geom(j+1,:));
				sysmat(j,i) = sysmat(i,j);
			end
		end
	end
end

end


% Analytical solution for the collocation singular case
function val = analytSolCol(p1,p2)
    l = norm(p2-p1);
	val = -(1./(2*pi))*l*(log(l/2)-1);
end

% Quadrature of the kernel wrt the collocation point colloc
function val = quadratureCol(p1,p2,colloc)
    l =   norm(p1-p2); % length of the element
    fun = @(x) fundamentalsol(x*p1+(1-x)*p2,colloc);
    val = l*quad(fun,0,1); % for octave, evaluation of the single layer integral
    % val = l*integral(fun,0,1,'ArrayValued',1); % for matlab, evaluation of the single layer integral
end


% Analytical solution for the Galerkin singular case
function val = analytSolGal(p1,p2)
	nrm = norm(p1-p2);
	val = -(1./(2*pi))*0.5*nrm*nrm*(-3+2*log(nrm));
end

% Quadrature of the kernel for Galerkin Scheme
function val = quadratureGal(p1,p1p,p2,p2p)
	lx = norm(p1-p1p,2); % 
	ly = norm(p2-p2p,2); % 
	fun = @(x,y) -(1./(2*pi))*(log(sqrt(((1-x)*p1(1)+(x)*p1p(1) - ((1-y)*p2(1)+(y)*p2p(1))).^2 +((1-x)*p1(2)+(x)*p1p(2) - ((1-y)*p2(2)+(y)*p2p(2))).^2)));
	val = (lx*ly)*dblquad(fun,0,1,0,1); % For octave
  % val = (lx*ly)*integral2(fun,0,1,0,1); % for matlab
end