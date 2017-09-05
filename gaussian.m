function centers = gaussian
% Gaussian
% ガウス関数の中心行列

grid1   = [-1.2 -0.35 0.5];
grid2   = [-1.5  -0.5 0.5 1.5];
% Actions = [-0.2     0 0.2];
centers = zeros(length(grid1)*length(grid2),2);
itr = 1;
%for k=1:length(Actions)
    for i=1:length(grid1)
        for j=1:length(grid2)
            centers(itr,1) = grid1(i);
            centers(itr,2) = grid2(j);
            itr = itr+1;
        end
    end
%end
end
