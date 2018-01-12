function rhs = mkRHS( Geom ,c,method)
	
if(method == 'c')

	% Takes the Geometry and intializes a right hand side given from data()
	n = length(Geom)-1;
	rhs = zeros(1,n);

	for i = 1:n
	% (x,y) is the midpoint of the geometry segment, i.e. the collocation point.  
	   x = .5*(Geom(i,1)+Geom(i+1,1));
	   y = .5*(Geom(i,2)+Geom(i+1,2));
	   rhs(i) = data(x,y,c);
	end
elseif(method == 'g')

	% Takes the Geometry and intializes a right hand side given from data()
	n = length(Geom)-1;
	rhs = zeros(1,n);

	for i = 1:n
	% parametrizes the element  
	   f = @(x) data(x*Geom(i,1)+(1-x)*Geom(i+1,1),x*Geom(i,2)+(1-x)*Geom(i+1,2),c);
	   rhs(i) = norm(Geom(i,:)-Geom(i+1,:))*quad(f,0,1);
	end

end

end

