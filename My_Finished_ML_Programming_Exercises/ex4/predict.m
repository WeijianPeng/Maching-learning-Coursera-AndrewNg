function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');  %m X L1+1 X L1+1 X L2
h2 = sigmoid([ones(m, 1) h1] * Theta2'); %m X L2+1 X L2+1 X K
[dummy, p] = max(h2, [], 2);%从行的维度来求最大值，即行维度的最大值位置(判定为该类)

% =========================================================================


end
