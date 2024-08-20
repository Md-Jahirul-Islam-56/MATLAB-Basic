clc
clear all
f=inline('x^3');
x0=input('Enter the initial limit X0:');
xn=input('Enter the final limit Xn:');
N=input('Enter the number of steps N:');
h=(xn-x0)/N;
integral=0;
for i=x0:h:(xn-h)
integral=integral+(h/2)*(f(i)+f(i+h));
end
disp('The result of integration is:');
integral