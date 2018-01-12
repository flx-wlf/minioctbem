function val = poteval(ptX,ptY,Geom,X)

[nx,ny] = size(ptX);
n = max(size(Geom))-1;
val = zeros(nx,ny);

% Evaluate the repform for each potential point
for i = 1:nx
    for j = 1:ny
        % sum over all elements
        for k = 1:n
        	% Parametrizes the element wrt. x in [0,1], then calculates the fundamental solution
            f = @(x) fundamentalsol((x)*Geom(k,:)+(1-x)*Geom(k+1,:),[ptX(i,j),ptY(i,j)]);
            val(i,j) = val(i,j) +X(k)*quad(f,0,1)*norm(Geom(k,:)-Geom(k+1,:),2); % For octave, Adds the value to the sum
            % val(i,j) = val(i,j) +X(k)*integral(f,0,1,'ArrayValued',1)*norm(Geom(k,:)-Geom(k+1,:),2); % For matlab, Adds the value to the sum
        end
    end
end

end

