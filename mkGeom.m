function geom = mkGeom( n , c)
% Makes a geometry consisting of n linear pieces. Remember diam < 1!


% Will construct a sphere geometry
if ( c == 's')
	geom = zeros(n,2);

	for(i = 1:n+1)
	    geom(i,1) = .01*sin((i-1)*(2*pi)/(n));
	    geom(i,2) = .01*cos((i-1)*(2*pi)/(n));
	end
% Will construct an l-shape domain
elseif( c == 'l')
	n = ceil(n/8);
	lng = .2;
	sml = .1;
	sd = sml/n;
% Starting in the bottom left corner, line segments are appended one after the other
	geom = [linspace(0,lng-sd,2*n)',zeros(2*n,1);
					lng*ones(n,1),linspace(0,sml-sd,n)';
					linspace(lng,sml+sd,n)',sml*ones(n,1);
					sml*ones(n,1),linspace(sml,lng-sd,n)';
					linspace(sml,0+sd,n)',lng*ones(n,1);
					zeros(2*n+1,1),linspace(lng,0,2*n+1)'];
% construction of yet another geometry
elseif( c == 'c')
    geom = zeros(n,2);
    v = [0,0]';
	for i = 1:n+1
        v(1) = .2*sin((i-1)*(2*pi)/(n));
	    v(2) = .2*cos((i-1)*(2*pi)/(n));
        v = v/norm(v,1);
        geom(i,1) = v(1);
        geom(i,2) = v(2);
	end
% end
end

