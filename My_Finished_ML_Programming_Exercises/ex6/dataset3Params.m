function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% Selected values of lambda (you should not change this)
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
penaltyC_vec = [0.01 0.03 0.1 0.3 1 3 10 30]';
m = size(X, 1);

error_val = zeros(8, 8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




for i = 1:length(penaltyC_vec)
	for j = 1:length(sigma_vec)
		model = svmTrain(X, y, penaltyC_vec(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vec(j))); 
		predictions = svmPredict(model, Xval);         %cross validation set：predictions of hypothesis on all i examples
		
		error_val(i,j) = mean(double(predictions ~= yval));    % ~= 不等于
	end	
end

[C_opt,I] = min(error_val(:));  %C为返回的最小值，I为对应列向量的索引
[m,n] = find(error_val==C_opt);
C = penaltyC_vec(m);      %1
sigma = sigma_vec(n);     %0.1
% =========================================================================

end




