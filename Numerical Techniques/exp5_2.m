clc 
clear all
N = 5;

x1 = zeros(1, N+1);
x2 = zeros(1, N+1);

x1(1) = 0;
x2(1) = 0;

for i = 1:N
    x1(i+1) = (15 + 1*x2(i))/4;
    x2(i+1) = (9 + x1(i+1))/5;
end

disp('x1=');
disp(x1(N+1));
disp('x2=');
disp(x2(N+1));

