% Define parameters
lambda = 1;
theta = 10^3;
alpha = 2;
N0 = 200;

% Define ODE function
bacterial_growth =@(t, N, lambda, theta, alpha) lambda * N * (1 - (N / theta)^alpha);

% Set up time span
tspan = [0 10];  % Adjust as needed

% Solve ODE
[t, N] = ode45(@(t, N) bacterial_growth(t, N, lambda, theta, alpha), tspan, N0);

% Plot results
figure;
plot(t, N);
xlabel('Time');
ylabel('Bacterial Population');
title('Simulated Bacterial Growth');

% Save results
writematrix([t, N], 'bacterial_growth_data.csv');