data = readtable("BacterialCulture_Glucose.xlsx");
data = table2array(data);
expTime = data(:,1);
expData = data(:,2);

lambda = 0.013;

params = fminsearch(@(x) minfunc(x(1), expData, expTime), [lambda]);

lambda = params(1);

dxdt = @(x) lambda*x;
[T, X] = ode45(@(T,X) dxdt(X), expTime, expData(1));

display(sum(minus(expData,X).^2));
display(lambda)
display(theta)

figure; hold on;
plot(expTime, expData, 'k-');
plot(T, X, 'r-');
xlabel('Time');
ylabel('Bacterial Population');
title('Bacterial Growth')