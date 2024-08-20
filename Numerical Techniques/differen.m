clc
clear all
h=input('Put the value of h=');
x=input('Give the function value x=');
Dn = sin(cos(1/x))

while true
    % Compute Dn+1 using central difference
    Dn_plus_1 = (-sin(cos(1/(x+(2*h))))+(8*sin(cos(1/(x+h))))-(8*sin(cos(1/x-h)))+sin(cos(1/(x-(2*h)))))/(12*h);

    % Check if |Dn_plus_1 - Dn| < tolerance
    if abs(Dn_plus_1 - Dn) < tolerance
        break; % Converged
    end

    % Update for the next iteration
    Dn = Dn_plus_1;
    h = h / 10;
    n = n + 1;
end

