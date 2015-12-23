function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha
% 好像和单变量的一样
% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

%%%%%%%%%%%%%%%%%%%%%%%%
n= size(X,2);

%theta=zeros(n,1);
delta= zeros(n);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %


predictions=X*theta;         % predictions of hypothesis on all m examples
errors=(predictions-y);      %  errors
sums=X'*errors;              %
delta=1/m *sums;

theta=theta-alpha*delta;     %iteration







    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end