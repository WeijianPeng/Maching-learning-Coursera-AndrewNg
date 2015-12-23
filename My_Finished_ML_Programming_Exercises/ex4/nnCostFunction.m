function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Compute cost function

% Theta1 has size 25 x 401
% Theta2 has size 10 x 26

X = [ones(m, 1) X];
%y_vect=zeros(num_labels,1);%10x1

for i=1:m
	y_vect=zeros(num_labels,1);
    x=X(i,:);  %1x401
	y_vect(y(i))=1;
	Z2 = x*Theta1';%1 x 25
	A2= sigmoid(Z2); %1 x 25

	A2 = [ones(size(A2,1),1) A2];% 1 x 26
	Z3 = A2*Theta2'; % 1x10
	predict1 = sigmoid(Z3);  %% 1x10,判决分类 [vlue,p] = max(pred, [], 2);

	
	%predictions1 = sigmoid(X（i）*Theta1);         % m x 1 predictions of hypothesis on all m examples
	cost = (y_vect'*(log(predict1))'+(1-y_vect)'*(log(1-predict1))');
	%+ 1/(2*m)*lambda*(theta'*theta-(theta(1,1))^2); ;    % cost function
    J=J+(-1/m)*cost;
end

%%regularization
Theta11=Theta1(:,2:end);
Theta22=Theta2(:,2:end);
J=J+ 1/(2*m)*lambda* ( sum(Theta11(:).^2)+sum(Theta22(:).^2) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Backpropagation algorithm

Delta1=0;
Delta2=0;

for i = 1:m
%%%% step 1
	y_vect=zeros(num_labels,1);
	y_vect(y(i))=1;
    x=X(i,:);  % 1x401
	A1=x';
	
	Z2 = Theta1*x'; % 25 x 1
	A2= sigmoid(Z2); % 25 x 1

	A2 = [1; A2];% 26 x 1
	Z3 = Theta2*A2; % 10x1
	A3 = sigmoid(Z3);  % 10x1,判决分类 [vlue,p] = max(pred, [], 2);
	predict=A3;
%%%% step 2
   delta_3=A3-y_vect;% 10 x 1

%%%% step 3
	
   %delta_3=delta_3(2:end);delta_2=delta_2(2:end);
   delta_2=(Theta2(:,2:end))' *delta_3.*sigmoidGradient(Z2);
   
%% step 4
   
   Delta1=Delta1+delta_2*A1';
   Delta2=Delta2+delta_3*A2';
end 

%%add regularization to the gradient
Theta1_grad=1/m*Delta1;
Theta2_grad=1/m*Delta2;
Theta1_grad(:,2:end) = Theta1_grad(:,2:end)+ 1/m *lambda*Theta1(:,2:end);
Theta2_grad(:,2:end) = Theta2_grad(:,2:end)+ 1/m *lambda*Theta2(:,2:end);

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end
