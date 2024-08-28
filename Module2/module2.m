r = 2.5;
K = 0.6;
nsteps = 100;
x = zeros(1,nsteps);
x(1) = 0.2;

for n=2:nsteps
    x(n) = x(n-1) + r*(1-(x(n-1)/K))*x(n-1);
end

figure(1);
plot(x,'-ob'); 
ylabel('Population')
xlabel('Time')


nval = 50;
nparam = 40;
xns = zeros(1,nparam);
r = linspace(0,3.,nparam);
xvals = zeros(nparam*nval);

for i=1:nparam
    x = zeros(1,nsteps);
    x(1) = 0.2;

    for n=2:nsteps
        x(n) = x(n-1) + r(i)*(1-(x(n-1)/K))*x(n-1);
    end
    xns(i) = x(nsteps);
   
    for j=1:nval
        xvals(j + (i-1)*nparam) = x(nsteps -(nval-j));
    end
end

rvals = zeros(nparam*nval);

for i=1:nparam
    for j=1:nval
        rvals(j + (i-1)*nparam) = r(i);
    end
end

figure(2);
plot(xns,r,'-ob'); 
ylabel('Population')
xlabel('Time')

figure(3);
plot(rvals,xvals,'.k'); 
ylabel('Population')
xlabel('Time')