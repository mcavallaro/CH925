function [A B] = LinearFit(X, Y)
%% Performs least-square linear regression
%Input  - X: 1xn abscisa vector
%       - Y: 1xn ordinate vector
%Output - A: the coefficient of x in Ax + B
%       - B: the intercept in Ax + B
x_mean = mean(X);
y_mean = mean(Y);
sum_x2 = (X - x_mean) * (X - x_mean)';
sum_xy = (Y - y_mean) * (X - x_mean)';
A = sum_xy  / sum_x2;
B = y_mean - A * x_mean;

