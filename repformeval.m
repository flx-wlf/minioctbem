function [ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err] = repformeval(err,c,Geom,X)
	
		ptX = [];
		ptY = [];
		val = [];
		ptX1 = [];
		ptY1 = [];
		ptX2 = [];
		ptY2 = [];
		val1 = [];
		val2 = [];

	if(c == 's')
		% Make a grid for potential evaluation
		[ptX,ptY] = meshgrid(linspace(-.0022,.0022,13),linspace(-.0022,.0022,14));
		% Evaluate the potential through indirect rep-form
		val = poteval(ptX,ptY,Geom,X);
		% Measure the error
		err = [err,max(max(abs(data(ptX,ptY,'s')-val)))];
	elseif (c == 'l')
        % Make a grid for potential evaluation
		[ptX1,ptY1] = meshgrid(linspace(.01,.18,16),linspace(.01,.09,8));
		[ptX2,ptY2] = meshgrid(linspace(.01,.08933,8),linspace(.09,.18,8));
        % Evaluate the potential through indirect rep-form
		val1 = poteval(ptX1,ptY1,Geom,X);
		val2 = poteval(ptX2,ptY2,Geom,X);
		% Measure the error
		err = [err,max(max(max(abs(data(ptX1,ptY1,c)-val1))),max(max(abs(data(ptX2,ptY2,c)-val2))))];
    end
end