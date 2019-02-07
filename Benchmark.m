function [t,y,yODE45] = Benchmark(K,r,y0,h,a,b)
%This function uses both the Euler method and Matlab's inbuilt ODE45 to
%numerically solve the initial value problem
% dy/dt = ry(1-y/k)
% for some specified parameter values, r, k and initial condition y0
% and for time (a<=t<=b)
% you will usually be given either the desired step size h, and the time
% interval, or the number of mesh points and the time interval.

%To RUN this function, paste the following into the command line...
%[t,y,yODE45] = Benchmark(2,0.05,0.5,1,0,200);
%(Do NOT just click run, as input values are required!!!)
%---------------------------------------------------------%

%ODE FUNCTION-----------------------------------%
%-----------------------------------------------%
%Use either:
%(i) anonymous function
f = @(t,y)  r*(1-y/K)*y;

%or
%(ii) nested function
% function dy=f(t,y)
%          dy=r*(1-y/K)*y;
% end

%(make sure your use of ODE45 function agrees with the form you have
%chosen)
%-----------------------------------------------%

%discretization
t=[a:h:b]; %lower time limit = a, upper time limit = b, stepsize = h

%variable
y=zeros(length(t),1); 

%initial conditions
y(1)=y0;

%EULER METHOD------------------------------------%
for i= 1:length(t)-1
    y(i+1) = y(i) + h*f(t,y(i));
end

%ODE45-------------------------------------------%
%Use with either 
%(i) anonymous function f
[t,yODE45] = ode45(f,t,y(1)); 

%or
%(ii) nested function f
%[t,yODE45] = ode45(@f,t,y(1));

%PLOTTING----------------------------------------%
figure (1)
plot(t,y);
hold on
plot(t,yODE45,'g');
xlabel('time');
ylabel('y');
legend('Euler method','ODE45')

end

