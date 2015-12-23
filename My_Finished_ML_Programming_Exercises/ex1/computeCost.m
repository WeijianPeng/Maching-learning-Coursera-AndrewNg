function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression(Attention)

%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples, also m =size(X,1);

% You need to return the following variables correctly 
J = 0;


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

m=size(X,1);                 % number of training examples m row X n colm
predictions=X*theta;         % predictions of hypothesis on all m examples
sqrErrors=(predictions-y).^2;% squared errors

J=1/(2*m)*sum(sqrErrors);    % cost function

% =========================================================================

end
