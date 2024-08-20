clc 
clear all

% line_data (Bus number, From bus, To bus, Line Admittance)
line_data = [
    1 1 2 0.05+0.15i;
    2 1 3 0.10+0.30i;
    3 1 4 0.05+0.15i;
    4 2 4 0.10+0.30i;
    5 3 4 0.15+0.45i;
];

%bus_data(Bus Num, Bus Type, P_D, Q_D, P_G, Q_G, Voltage Magnitude, Voltage Angle)
%Bus Type: 1 for PQ bus, 2 for PV bus, 3 for Slack bus
bus_data = [
    1 3 0    0    32  80  1.04 0;    
    2 2 11   75   20  40  1.02 0;    
    3 2 61   85   40  40  1.01 0;   
    4 1 0    0    0   0   1.00 0;
];

num_buses = max(max(line_data(:, 2:3)));% num_buses is to find total number of buses

Ybus = zeros(num_buses, num_buses);

for k = 1:size(line_data, 1)
    from_bus = line_data(k, 2);
    to_bus = line_data(k, 3);
    admittance = 1 / line_data(k, 4);

    Ybus(from_bus, from_bus) = Ybus(from_bus, from_bus) + admittance;
    Ybus(to_bus, to_bus) = Ybus(to_bus, to_bus) + admittance;
    Ybus(from_bus, to_bus) = Ybus(from_bus, to_bus) - admittance;
    Ybus(to_bus, from_bus) = Ybus(to_bus, from_bus) - admittance;
end

disp('Bus Admittance Matrix, Ybus(Rectangular Form):');
disp(Ybus);

% Convert Ybus to from rectangular to polar form
Ybus_magnitude = abs(Ybus);
Ybus_angle = angle(Ybus) * 180/pi;

fprintf('Ybus (Polar Form):\n');
for i = 1:num_buses
    for j = 1:num_buses
        fprintf('%.3f ∠ %.2f°   ', Ybus_magnitude(i, j), Ybus_angle(i, j));
    end
    fprintf('\n');
end




Sbase = 100;  % Base MVA

% Converting power values to per unit
P = bus_data(:, 3) / Sbase;
Q = bus_data(:, 4) / Sbase;
Pg = bus_data(:, 5) / Sbase;
Qg = bus_data(:, 6) / Sbase;

V = bus_data(:, 7);%Bus voltages
delta = bus_data(:, 8) * pi/180; % Converting angles to radians

max_iter = 100; 
tolerance = 1e-6;

for iter = 1:max_iter
    V_prev = V;

    for i = 1:num_buses
        if bus_data(i, 2) == 3 % Slack bus
            continue;
        elseif bus_data(i, 2) == 2 % PV bus
            sumYV = 0;
            for j = 1:num_buses
                sumYV = sumYV + Ybus(i, j) * V(j);
            end
            Q(i) = -imag(conj(V(i)) * (Ybus(i, i) * V(i) + sumYV));%Reactive Power
        elseif bus_data(i, 2) == 1 % PQ bus
            sumYV = 0;
            for j = 1:num_buses
                sumYV = sumYV + Ybus(i, j) * V(j);
            end
            V(i) = (1 / Ybus(i, i)) * ((P(i) - 1i * Q(i)) / conj(V(i)) - sumYV);
        end
    end
 
    if max(abs(V - V_prev)) < tolerance
        break;
    end
end

bus_sol = [bus_data(:, 1), V, delta * 180/pi];

fprintf('Bus Solution (Voltage Magnitude and Angle):\n');
for i = 1:num_buses
    fprintf('Bus %d: V = %.3f ∠ %.3f°\n', bus_sol(i, 1), bus_sol(i, 2), bus_sol(i, 3));
end

line_flow = zeros(size(line_data, 1), 1);
for k = 1:size(line_data, 1)
    from = line_data(k, 2);
    to = line_data(k, 3);
    line_flow(k) = abs(V(from)) * abs(V(to)) * abs(Ybus(from, to)) * cos(angle(V(from)) - angle(V(to)) - angle(Ybus(from, to)));
end

fprintf('\nLine Flows (MW):\n');
for k = 1:size(line_data, 1)
    fprintf('Line %d-%d: %.3f MW\n', line_data(k, 2), line_data(k, 3), real(line_flow(k)));
end

%Calculating power loss
total_power_loss = 0;
for k = 1:size(line_data, 1)
    from = line_data(k, 2);
    to = line_data(k, 3);
    Yline = 1 / line_data(k, 4);  % Admittance of the line
    
    V_from = V(from);
    V_to = V(to);
    delta_from = angle(V(from));
    delta_to = angle(V(to));
    
    power_loss = abs(V_from)^2 * real(Yline) + abs(V_to)^2 * real(Yline) - 2 * abs(V_from) * abs(V_to) * real(Yline) * cos(delta_from - delta_to);
    total_power_loss = total_power_loss + power_loss;
end

fprintf('\nTotal Power Loss (MW): %.3f\n', total_power_loss);
