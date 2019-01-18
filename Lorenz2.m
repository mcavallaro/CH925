function pos = Lorenz2(x,tspan)
% Ruturns the Lorenz model trajectory in the time range tspan
% The argument x contains both the variable sigma, beta, and rho
% and the initial conditions.
sigma = x(1);
beta = x(2);
rho = x(3);
xt0 = x(4:6);
f = @(t,y)Lorenz(t,y,sigma,beta,rho);
[~,pos] = ode45(f, tspan, xt0);
