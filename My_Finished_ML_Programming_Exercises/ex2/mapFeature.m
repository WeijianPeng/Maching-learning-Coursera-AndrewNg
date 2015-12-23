function out = mapFeature(X1, X2)
% MAPFEATURE Feature mapping function to polynomial features
%
%   MAPFEATURE(X1, X2) maps the two input features
%   to quadratic features used in the regularization exercise.
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
%
%  X-2 columns transform to 28 columns. m rows are unchanged.

degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree   %1-6
    for j = 0:i    %0-6
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
		%printf('%d %d\n',i-j,j);  
		%x1,i-j ---0-6 ; x2,j ---0-6         
		% end 代表最后一列， 从第二列开始，所以第一列是1；
    end
end

end
%%%x1,x2的次数。
%%%%i=1
% 1 0
% 0 1
%%%%%i=2
% 2 0
% 1 1
% 0 2

% 3 0
% 2 1
% 1 2
% 0 3

% 4 0
% 3 1
% 2 2
% 1 3
% 0 4

% 5 0
% 4 1
% 3 2
% 2 3
% 1 4
% 0 5

% 6 0
% 5 1
% 4 2
% 3 3
% 2 4
% 1 5
% 0 6