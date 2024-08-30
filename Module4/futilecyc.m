ptot = 1;
i_init = 1;

kaon = 10;
kaoff = 10;
kion = 10;
kioff = 10;
kicat = 10;
kacat = 100;

nparam = 100;
apSS = zeros(nparam);
ktots = linspace(1e-3,1e2, nparam);

for iter=1:nparam 
ktot = ktots(iter);

dadt = @(a,ap,i,ik)   kaoff*ap + kacat*ik - kaon*a*(ptot - ap);
dapdt = @(a,ap,i,ik) -kaoff*ap - kicat*ap + kaon*a*(ptot - ap);
didt = @(a,ap,i,ik)   kioff*ik - kion*i*(ktot - ik) + kicat*ap;
dikdt = @(a,ap,i,ik) -kioff*ik + kion*i*(ktot - ik) - kacat*ik;

% x = a, ap, i, ik
dxdt =@(t,x) [ dadt(x(1),x(2),x(3),x(4)); dapdt(x(1),x(2),x(3),x(4)); didt(x(1),x(2),x(3),x(4)); dikdt(x(1),x(2),x(3),x(4))];
  
[T, X] = ode45(dxdt, [0,1], [0,0,i_init,0]);

apSS(iter) = X(end,1);

end

figure(1); hold on;
plot(ktots, apSS);
%set(gca,'xscale', 'log')
xlabel('Ktot Parameters');
ylabel('A Steady States')