function SSE = compute_sse(params, N0, t_exp, N_exp)

    lambda = params(1);
    theta = params(2);
    alpha = params(3);

    bacterial_growth =@(t, N, lambda, theta, alpha) lambda * N .* (1 - (N / theta).^alpha);

    % Solve ODE at experimental time points
    %[~, N_sim] = ode45(@(t, N) bacterial_growth(t, N, 1, 1, 1), [0,11], 1);
    [~, N_sim] = ode45(@(t, N) bacterial_growth(t, N, lambda, theta, alpha), t_exp, N0);
    
    % Compute SSE
    SSE = sum((N_sim - N_exp).^2);
end