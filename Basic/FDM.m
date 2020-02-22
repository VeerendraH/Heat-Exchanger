rhoc = 1060; %kg/m3
rhoh = 1000; %kg/m3

Cpc = 805; %J /Kg-K
Cph = 4187;%J /Kg-K

kc = 0.38;  %W/m-K
kh = 0.6408;%W/m-K

vc = 1; % m/s
vh = 2; % m/s

D0 = 0.01;
Di = 0.008;
Dhyd = D0 - Di;

Vdotc = pi*(Di^2)*0.25*vc;
Vdoth =  pi*(D0^2 - Di^2)*0.25*vh;

hc = 4.36*kc/Di;
hh = 4.36*kh/Dhyd;


Uheat = 1/((1/hc)+(1/hh));

mc = rhoc*Vdotc*Cpc; %W/K
mh = rhoh*Vdoth*Cph; %W/K

eta = 1 + (mc/mh);
Uc = Uheat*pi*Di*eta; %W/m-K

M = mc;
U = Uc;
L = 20;
Num = 20;
l = L/Num ;
Tci = 293;
Tco = 353;

Thi = 373;

mt0 = mc*Tci + mh*Thi;

a = (M/(l^2)) + (U/(2*l));
b = (M/(l^2)) - (U/(2*l));
c = 2*M/(l^2) ;
T = zeros(Num+1,1);
T(1,1) = Tci;
T(end,1) = Tco;
T(2:end-1,1) = 0.5*(Tci + Tco);
N = 500 % Number of Iterations
for i = 1 : N
    for j = 2:(Num)
        T(j,1) = (a/c)*T(j+1,1) + (b/c)*T(j-1,1);
    end
    
end
%fprintf('Temperature after iterating \n ')

Tc = T

X = linspace(0,L,Num+1);
plot(X,Tc,'c')
hold on;


Th = (mc*Tci + mh*Thi - mc*Tc)/mh

Tho = Th(end)
%Th = Tci + Thi -Tc;

plot(X,Th,'r');
hold on;
legend('Tc (FDM)','Th (FDM)')

title('Temperature versus Length')

Q = Uheat*pi*Di*L*(1/Num)*(sum(Th(2:end-1)-Tc(2:end-1))+ (Thi-Tco+Tho-Tci)*0.5)

delQ = mh*(Thi-Tho)
delQc = mc*(Tco - Tci)


LMTD = ((Thi-Tci) - (Tho - Tco))/log((Thi-Tci)/(Tho - Tco))
Qanal = Uheat*pi*Di*L*LMTD

Th_FDM = Th;
Tc_FDM = Tc;

