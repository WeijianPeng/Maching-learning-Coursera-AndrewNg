function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

%%%%%%%%%%%%%%%%%
n=length(X(1,:)); % number of features(include X0)
%initialize  vals to a matrix of 0's
%theta=zeros(size(X(1,:)'));
delta=zeros(n,1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
 
predictions=X*theta;         % predictions of hypothesis on all m examples
errors=(predictions-y);      %  errors
sums=X'*errors;              %
delta=1/m *sums;

theta=theta-alpha*delta;     %iteration

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
