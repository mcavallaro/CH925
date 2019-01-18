function f = Lorenz(t,a,sigma,beta,rho)
% 
f = zeros(3,1);
f(1) = -sigma*a(1) + sigma*a(2);
f(2) = rho*a(1) - a(2) - a(1)*a(3);
f(3) = -beta*a(3) + a(1)*a(2);
