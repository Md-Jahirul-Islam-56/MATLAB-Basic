clc
clear all

f = @(x) (x./((x.^2)+4)); 
x1 = input('Initial limit: ');
x2 = input('Final limit: '); 
N = input('Steps: ');
h = (x2 - x1) / N; 
integral = 0; 
for i = x1:h:(x2 - h)
    integral = integral + (h / 2) * (f(i) + f(i + h));
end

disp('The integration is:');
disp(integral);