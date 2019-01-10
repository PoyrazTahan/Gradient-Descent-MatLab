

function J = computeCost(X, y, theta)
% Initialize some useful values
m = length(y); % number of training examples 
J = 0;


% J = sum((X*theta-y).^2)/(2*m);
 J = sum((y-X*theta).^2);
end
