% f =@(x,y) a*x + b*y; 
% g =@(x,y) c*x + d*y;
% parameters
a = -1;
b = 1;
c = -1;
d = 1;

% An attractive steady state where solutions spiral inwards
% -10 5 -10 1

% An attractive steady state where solutions do not spiral in
% -10 -5 -10 -5

% A repulsive steady state where solutions spiral outwards
% 10 -5 10 -1

% A repulsive steady state where solutions do not spiral out
% all values are 1

% A pure oscillation
% 1 -1 10 -1

% One more category not contained in the list (there are at least two!)
% -1, 1, -1, 1 - stays at the same place, neutrally stable
% saddle - some directions goes up, some directions that it goes down


% Bonus: Suppose again that these represent the concentration of RNA and
% protein. What are the biological meanings of each of these behaviors? 1
% model equations

f =@(x,y) a*x + b*y; 
g =@(x,y) c*x + d*y;

[T, X] = ode45(@(t,x)[f(x(1),x(2));g(x(1),x(2))], [0,1000], [1,0.5] );

figure; hold on;
set(gca, 'xlim', [-1, 1], 'ylim', [-1, 1])
ylabel('x');
xlabel('y')

xArray = linspace(-1,1,16);
yArray = linspace(-1,1,16);

[xMesh,yMesh] = meshgrid(xArray, yArray);

% the Matlab plot command for a field of arrows is:
quiver(xMesh, yMesh, f(xMesh, yMesh), g(xMesh,yMesh))

plot(X(:,1),X(:,2),'-r')
plot(X(end,1),X(end,2), 'or')