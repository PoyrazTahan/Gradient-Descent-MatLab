




%% Initialization
clear ; close all; clc
%% ======================= Part 1: Data Reading =======================
data = load('dataHW5.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

%% ======================= Part 1.1: Plotting =======================
% Plot Data
% Note: You have to complete the code in plotData.m
plotData(X, y);
%% ======================= Part 2: Analytical Solution =======================
[Atheta, Btheta] = analytics(X,y);
fprintf('=============  Analytical Solution Estimation ============= \n')
fprintf('[w_1] = %s \n', Atheta)
fprintf('[w_2] = %s \n', Btheta)

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
fprintf('Cost = %s \n', computeCost(X,y,[Atheta,Btheta]'))
%% =================== Part 3: Cost and Gradient descent ===================


theta = [-2,4]'; % initialize fitting parameters

% Some gradient descent settings
iterations = 15000;
alpha = 0.001; %learning rate

% run gradient descent
[theta, J_hist,T1_hist,T2_hist] = gradientDescent(X, y, theta, alpha, iterations);


fprintf('[w_1] = %s \n', theta(1))
fprintf('[w_2] = %s \n', theta(2))
fprintf('Cost = %s \n', computeCost(X,y,theta))
%% ============= Part 4: Visualizing J(theta_0, theta_1) =============

theta0_vals = linspace(-9, 12, 100);
theta1_vals = linspace(-10, 10, 100);

J_vals = zeros(length(theta0_vals), length(theta1_vals));

for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end

J_vals = J_vals';


% Contour plot
figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(5, 3.5, 15))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 5);
plot(T1_hist,T2_hist);