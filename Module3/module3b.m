% define ODE and parameters
a_0 = 500; % molecules per hour
a_1 = 0.5; % molecules per hour, per existing molecule of A
b = 4; % 1/hrs

dPdt =@(P) (a_0 + a_1*P) - b*P;

[T, P] = ode45( @(t,x)dPdt(x), [0,4.], 0); % Matlab's built-in ODE solver, ode45

display(P(end))

plot(T,P)
ylabel('Molecules of protein A');
xlabel('Time (hours)');