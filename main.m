%set initial values
theta=-.5*ones(150,1);
P_sum=1;
fun = @(theta)(maxentr(theta));
%optimization
options = optimoptions('fminunc','Algorithm','quasi-newton','MaxFunEvals',1000);
options.Display = 'iter';
[x, fval, exitflag, output] = fminunc(fun,theta,options);


%Display new grid
for i=1:15
    for j=1:10
    G(i,j)=x((i-1)*10+j);
    end
end
imagesc(G)
