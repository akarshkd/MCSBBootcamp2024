function sse = minfunc(lambda, expData, expTime)

dxdt = @(x) lambda*x;%*(1-(x/theta));
[~, X] = ode45(@(T,X) dxdt(X), expTime, expData(1));

%display(length(X))
%display(length(expData))

sse = sum(minus(expData,X).^2);

end