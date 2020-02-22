syms x y c1 c2 t L1 L2 T0 TL m u s
%m = 1;
%u = 1;
L = 20;
Num = 20;
y0 = 293;
yL = 353;

y(x) = c1*((m/u)*exp(-(m/u)*x)) + c2;

eqn1 = y(L1) == T0;
eqn2 = y(L2) == TL;

so = solve([eqn1 eqn2] , [c1 c2]);

ysolv(x) = subs(y(x),[c1 c2],[so.c1 so.c2]);

X = linspace(0,L,Num+1);
Y = ysolv(X)

%ysolv(t)

%(353*exp(-L1) - 293*exp(-L2))/(exp(-L1) - exp(-L2)) - (60*exp(-t))/(exp(-L1) - exp(-L2))
%plot(X,Y)

N = 0.5*[(1-s) ; (1+s)];
Ns  = diff(N,s,1);

int(Ns*Ns',s,[-1 1])
int(N*Ns',s,[-1 1])
