% This implements a simple, indirect boundary element method for the case of circle and L-Shape.
% This code was written for OCTAVE. 
% To run in MATLAB you mast replace the lines involving integration in MatAssembly.m and Poteval.m
%
% PLEASE, DO NOT REDISTRIBUTE THIS CODE. 
% I CANNOT PROVIDE SUPPORT FOR THIS CODE. 
% I CANNOT GUARANTEE THAT THIS CODE WORKS.
%
% Written by Felix Wolf


clear all;
close all;

% The approximate amount of elements to start with. The real number 
% will be determined by mkGeom.
num = 4;
lmax = 5;
% Choose Method: 'c' for collocation, 'g' for Galerkin
method = 'g'
% Choose Geometry and corresponding rhs. 'l' for LShape, 's' for circle
geometry = 'l';

% Initialize arrays for error and number of elements
err = [];
nums = [];




% Loop for mesh refinement
for l = 1 : lmax 

	% Makes the geometry
	Geom = mkGeom(num,geometry);
    % Update the number for the next iteration
    num = num*2;
    
    % Store the number of elements
    nums = [nums,max(size(Geom))-1];
  
	% Assemble the matrix
	A = MatAssembly(Geom,method);
    
	% Assemble the RHS
	U = mkRHS(Geom,geometry,method);
    
	% Direct solver (CG wont work for collocation)
	X = A\U';

	% Evaluates the representation Formula and finds maximal potential error
	[ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err] = repformeval(err,geometry,Geom,X);
	
	err
end

visualize(Geom,nums,geometry,ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err);

