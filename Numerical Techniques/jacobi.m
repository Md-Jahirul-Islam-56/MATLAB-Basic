clc
clear

x1(1) = 0;
x2(1) = 0;
x3(1) = 0;

for i = 2:3
    x1(i) = (7 - (2*x2(i-1) + 3*x3(i-1))) / 9;
    x2(i) = (2 - (1*x1(i) + 9*x3(i-1))) / 12;
    x3(i) = (1 - (4*x1(i) + 6*x2(i))) / 14;
end

disp('x1:');
disp(x1);
disp('x2:');
disp(x2);
disp('x3:');
disp(x3);

