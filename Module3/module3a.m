% ------------------------------------------------------
A     = 1.1; % fluorescence intensity units
omega = 2.6; % rad/s
A_0   = 0.01;

u=@(t) A*sin(omega*t)+A_0;

tArray = linspace(0,1.6,200); % adding more time points might decrease error
uArray = u(tArray); % an array of samples of u
% ------------------------------------------------------

% analytical solutions (in real life, we might not know these)
dudtExact      =  A*omega*cos(omega*tArray(1:end-1));
du2dt2Exact    = -A*omega^2*sin(omega*tArray(1:end-2));
du3dt3Exact    = -A*omega^3*cos(omega*tArray(1:end-3));

plotDiffs = zeros(1000);

for noise=linspace(0,1,1000)
    % Take the sample and add a bit of noise
    uObserved = u(tArray) + noise*randn(size(tArray));
    % create finite-difference 
    % derivatives for first derivative, second derivative and third derivative
    dudt   = diff(uObserved)./diff(tArray); 
    du2dt2 = diff(dudt)./diff(tArray(1:end-1));
    du3dt3 = diff(du2dt2)./diff(tArray(1:end-2));

    diff1 = max(abs(dudt - dudtExact)) < 0.1; % changing metrics might change the error value
    diff2 = max(abs(du2dt2 - du2dt2Exact)) < 0.1;
    diff3 = max(abs(du3dt3 - du3dt3Exact)) < 0.1;
    
    totDiff = diff1 & diff2 & diff3;

    if totDiff % this will never happen as without the noise the system is already  beyond 0.1
        % this could possibly be due to the 
        display(noise)
    end
end