clc
clear all
n = input('Enter the number of buses: ');
z = zeros(n);
for i = 1:n
    for j = i+1:n
        fprintf('Enter the impedance value between bus %d and bus %d: ', i, j);
        z(i,j) = input('');
        z(j,i) = z(i,j);
    end
end

disp('Impedance matrix:');
disp(z);
y = zeros(n);
for i = 1:n
    for j = i+1:n
        if z(i,j) ~= 0
            y(i,j) = -1/z(i,j);
            y(j,i) = y(i,j); 
        end
    end
end
for i = 1:n
    for j = 1:n
        if i ~= j
            y(i,i) = y(i,i) - y(i,j);
        end
    end
end

disp('Admittance matrix:');
disp(y);

