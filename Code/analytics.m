function [theta1,theta2] = analytics(X,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%theta1 = (((X(:,2))'*y)-(sum(X(:,2))*sum(y)));
%theta1 = theta1/((sum(X(:,2)^2)-sum(x)^2));
%theta2 = (sum(y)-theta1*sum(X(:,2)))/length(y);
%% Another method
meanX = mean(X);
meanY =mean(y);
numerator = 0;
denominator = 0;
for iter = 1:length(y)
    numerator = numerator + (X(iter)-meanX)*(y(iter)-meanY);
    denominator = denominator + (X(iter)-meanX)^2;
end
theta2 = numerator/denominator;
theta1 = meanY - theta2*meanX;

theta = [theta1, theta2];
X = [ones(length(y), 1), X];

hold on;
plot(X(:,2), X*theta', '-')
for iter = 1:length(y)
    xx = [X(iter,2),X(iter,2)];
    yy = [y(iter),X(iter,:)*theta'];
    %line1  = line(xx,yy);
    plot(xx,yy)
end
hold off;


end

