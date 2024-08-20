
clc
clear 

n = input('Number of data points given: ');
if n < 9
    error('At least 9 data points are required.');
end
y = zeros(1, n);

for i = 1:n
    y(i) = input('Give all data: ');
end
y1 = sum(y(1:3));
y2 = sum(y(4:6));
y3 = sum(y(7:9));

meany1 = y1 / 3;
meany2 = y2 / 3;
meany3 = y3 / 3;

b = ((meany3 - meany2) / (meany2 - meany1))^(1/3);
a = (3 * (meany2 - meany1)) / ((b^3 + b^4 + b^5) - (b^0 + b^1 + b^2));
k = meany1 - (a * (b^0 + b^1 + b^2)) / 3;

m = input('Which year do you want to forecast? ');
forecast_demand = k + a * (b^m);

disp(['Forecasted demand for year ', num2str(m), ' is: ', num2str(forecast_demand)]);
