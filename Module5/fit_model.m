% Load experimental data
% Replace 'data.txt' with your actual data file name
data = load('bacterial_growth_data.csv');
t_exp = data(:, 1);  % Assuming first column is time
N_exp = data(:, 2);  % Assuming second column is bacterial population

% Plot experimental data
figure;
plot(t_exp, N_exp, 'o');
xlabel('Time');
ylabel('Bacterial Population');
title('Experimental Bacterial Growth Data');

%% ----------------------------- %%


% Initial guess for parameters
initial_guess = [1, 1000, 2];
N0 = N_exp(1);  % Use first experimental point as initial condition

% Define objective function
obj_fun = @(params) compute_sse(params, N0, t_exp, N_exp);

% Find best-fit parameters
best_params = fminsearch(obj_fun, initial_guess);

% Extract best-fit parameters
lambda_fit = best_params(1);
theta_fit = best_params(2);
alpha_fit = best_params(3);

% Simulate with best-fit parameters
[t_sim, N_sim] = ode45(@(t, N) bacterial_growth(t, N, lambda_fit, theta_fit, alpha_fit), t_exp, N0);

% Plot results
figure;
plot(t_exp, N_exp, 'o', 'DisplayName', 'Experimental Data');
hold on;
plot(t_sim, N_sim, '-', 'DisplayName', 'Best-Fit Model');
xlabel('Time');
ylabel('Bacterial Population');
title('Bacterial Growth: Experimental vs Best-Fit Model');
legend('show');
hold off;

% Display best-fit parameters
fprintf('Best-fit parameters:\n');
fprintf('lambda = %.4f\n', lambda_fit);
fprintf('theta = %.4f\n', theta_fit);
fprintf('alpha = %.4f\n', alpha_fit);