clc
clear all
d_error = 0.01;
max_iter = 5;
x1 = zeros(1, max_iter + 1 );
x2 = zeros(1, max_iter + 1 );
x3 = zeros(1, max_iter + 1 );

x1(1) = 0;
x2(1) = 0;
x3(1) = 0;

for i = 1:max_iter
    x1(i+1) = (11 - 8*x2(i) + x3(i))/2;
    x2(i+1) = (10 + x1(i+1) - x3(i))/5;
    x3(i+1) = (3 + x1(i+1) - x2(i+1))/4;

    if max(abs([x1(i+1) - x1(i), x2(i+1)- x2(i), x3(i+1)])) < d_error
        disp(['Displaying error at specified iteration: ', num2str(i)]);
        break;
    end
end
disp('x1=');
disp(x1(i+1));
disp('x2=');
disp(x2(i+1));
disp('x3=');
disp(x3(i+1));
