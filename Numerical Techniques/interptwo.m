clc
clear all
x = 0:10;
y = sin(x);
x_interpolated = 0:0.25:10;
y_interpolated = interp1(x, y, x_interpolated, 'linear');
plot(x, y, 'o', 'MarkerSize', 8, 'DisplayName', 'Original Data');
plot(x_interpolated, y_interpolated, '-', 'DisplayName', 'Interpolated Data');
xlabel('x');
ylabel('y = sin(x)');
title('Interpolation of y = sin(x)');
legend('show');
grid on;