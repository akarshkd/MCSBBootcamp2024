%{
% Questions 1 and 2
% model parameters
eps = 0.08;
a = 1.0;
b = 0.2;

% model definition
f = @(v,w) v - 1/3*v.^3 - w;
g = @(v,w) eps*(v + a -b*w);

%% single cell
dxdt =@ (t,x) [f(x(1),x(2)); g(x(1),x(2));];

% solve!
[T,X] = ode45(dxdt,[0,100], [-0,-0.5]); % Steady State : -0.5, -0.5
%[T,X] = ode45(dxdt,[0,100], [-1.5,-0.5]); % Steady State : -0.5, -0.5089

display(X(1,end))
display(X(2,end))

figure(1); clf; hold on;
set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')

uArray = linspace(-2.5, 2.5,32);
wArray = linspace(-2.5, 2.52,32);

[uMesh,wMesh] = meshgrid(uArray, wArray);

% the Matlab plot command for a field of arrows is:
quiver(uMesh, wMesh, f(uMesh, wMesh), g(uMesh,wMesh), 0.5)

plot(X(:,1),X(:,2),'-r')
plot(X(end,1),X(end,2), 'or')

figure(2); clf; hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('t');
xlabel('conc.')

plot(T, X(:,1),'-r')
plot(T, X(:,2),'-b')
%}

%{
% Question 3
% model parameters
eps = 0.08;
a = 1.0;
b = 0.2;
I0 = 1.0;
tStart = 40;
tStop = 47;

% model definition
I = @(t) I0*(t>tStart).*(t<tStop);
f = @(v,w) v - 1/3*v.^3 - w;
g = @(v,w) eps*(v + a -b*w);

%% single cell
dxdt =@ (t,x) [f(x(1),x(2)) + I(t); g(x(1),x(2));];

% solve!
%[T,X] = ode45(dxdt,[0,100], [-0,-0.5]); % Steady State : -0.5, -0.5089
%[T,X] = ode45(dxdt,[0,100], [-1.5,-0.5]); % Steady State : 0, 5e-5
[T,X] = ode45(dxdt,[0,100], [-0.5,-0]);

display(X(1,end))
display(X(2,end))

figure(405); clf; hold on;
set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')

uArray = linspace(-2.5, 2.5,32);
wArray = linspace(-2.5, 2.52,32);

[uMesh,wMesh] = meshgrid(uArray, wArray);

% the Matlab plot command for a field of arrows is:
quiver(uMesh, wMesh, f(uMesh, wMesh), g(uMesh,wMesh), 0.5)

plot(X(:,1),X(:,2),'-r')
plot(X(end,1),X(end,2), 'or')

figure(2); clf; hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('t');
xlabel('conc.')

plot(T, X(:,1),'-r')
plot(T, X(:,2),'-b')
%}

% Question 4
% model parameters
eps = 0.08;
a = 1.0;
b = 0.2;
I0 = 1.0;
tStart = 40;
tStop = 47;
D = 0.9;

% model definition
I = @(t) I0*(t>tStart).*(t<tStop);
f = @(v,w) v - 1/3*v.^3 - w;
g = @(v,w) eps*v + a - b*w;

%% single cell
dxdt =@ (t,x) [
    f(x(1),x(2))];

% solve!
[T,X] = ode45(dxdt,[0,100], [(-0;-0),(-0.5;-0.5)] ); % Steady State : -0.5, -0.5089
%[T,X] = ode45(dxdt,[0,100], [-1.5,-0.5]); % Steady State : 0, 5e-5

figure(1); clf; hold on;
set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('w');
xlabel('v')

uArray = linspace(-2.5, 2.5,32);
wArray = linspace(-2.5, 2.52,32);

[uMesh,wMesh] = meshgrid(uArray, wArray);

% the Matlab plot command for a field of arrows is:
quiver(uMesh, wMesh, f(uMesh, wMesh), g(uMesh,wMesh), 0.5)

plot(X(:,1),X(:,2),'-r')
plot(X(end,1),X(end,2), 'or')

