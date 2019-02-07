function [T Y] = Euler(f, a, b, ya, M)
% Approximate the solution of the ODE y'=f(y,t) with
% intial conditions y(a) = ya over t \in [a,b].
% Input  - f is the function a s strig
%        - a and b are the time interval extrema.
%        - ya is the initial condition y(a)
% Output - T is the vector of abscissas
%        - Y is the vector of ordinates
h = (b - a) / M;
%allocates memory for the vectors T and Y
T = zeros(1, M + 1);  
Y = zeros(1, M + 1);
T = a:h:b;
Y(1)=ya;
for j=1:M
    Y(j+1) = Y(j) + h * feval(f, T(j), Y(j));
end
T = T';
Y = Y';
