function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

h = X * theta;

cost = h - y;
J_init = sum (cost .* cost)/(2*m);


square_theta = theta(2:size(theta)) .* theta(2:size(theta));
J_reg = (sum(square_theta) * lambda) / (2 * m);

J = J_init + J_reg;

grad = (1 / m) * (cost' * X)';
grad(2:size(grad)) = grad(2:size(grad)) + (lambda / m) * theta(2:size(theta));




% =========================================================================

grad = grad(:);

end
