function [theta, J_history,T1_history,T2_history] = gradientDescent(X, y, theta, alpha, num_iters)
fprintf('=============  Batch Gradient Descent Estimation ============= \n');
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
fprintf('Initials [%d, %d] ; Learning rate %d, \n',theta(1),theta(2),alpha);
for iter = 1:num_iters

    T1_history(iter) = theta(1);
    T2_history(iter) = theta(2);
    
    h = (X*theta-y)';
    %simulateuos update of theta
    theta(1) = theta(1) - alpha * (1/m) * h * X(:,1);
    theta(2) = theta(2) - alpha * (1/m) * h * X(:,2);




    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    
    if  iter > 1 
        delta = J_history(iter-1) - J_history(iter);
        if  delta < 0.000001
            fprintf("convergence point: %d\n", iter);
            break
        end
    end
    

end

%hold on;
%plot(X(:,2), X*theta, '-')
%for iter = 1:m
%    xx = [X(iter,2),X(iter,2)];
%    yy = [y(iter),X(iter,:)*theta];
%    %line1  = line(xx,yy);
%    plot(xx,yy)
%end
%hold off;


figure;
%plot(Y1,'Marker','.');
plot(J_history,'Marker','.');
end
