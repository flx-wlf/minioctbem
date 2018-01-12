function out = data(ptX,ptY,c)
	% This function is used to generate the right hand side via 
    % the function f, also used to check the convergence.
    % One can define different f for different geometries

    out = ptX;    
    % if (c == 's')
    % 	f = @(x,y) -x.*y + 3  -2*y;
    % else
    % 	f = @(x,y) x.*y + 3*x -2*y;
    % end
    % out = f(ptX,ptY);
end