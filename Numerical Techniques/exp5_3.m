clc
clear all
desired_error = 0.01; 
max_iterations = 5; 

x1 = zeros(1, max_iterations+1);
x2 = zeros(1, max_iterations+1);
x3 = zeros(1, max_iterations+1);

x1(1) = 0;
x2(1) = 0;
x3(1) = 0;

for i = 1:max_iterations
    x1(i+1) = (10 + x2(i) - x3(i))/5;
    x2(i+1) = (11 - 2*x1(i+1) + x3(i))/8;
    x3(i+1) = (3 + x1(i+1) - x2(i+1))/4;
    
  
end


disp('x1 =');
disp(x1(i+1));
disp('x2 =');
disp(x2(i+1));
disp('x3 =');
disp(x3(i+1));