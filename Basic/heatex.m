% The Governing eqution of this process has been derived and is 
% m*Txx + U*Tx = 0

% Initialisation of Values

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

mc = rhoc*Vdotc*Cpc %W/K
mh = rhoh*Vdoth*Cph %W/K

eta = 1 + (mc/mh);
Uc = Uheat*pi*Di*eta; %W/m-K

m = mc;
U = Uc;
L = 20;
Num = 20;
Tci = 293;
Tco = 353;

Thi = 373;

mt0 = mc*Tci + mh*Thi;

K = zeros(Num+1,Num+1);
R = zeros(Num+1,1);

for i = 1:Num
    k = m*(Num/L)*[1 -1 ; -1 1] - 0.5*U*[-1 1;-1 1];
    K([i,i+1],[i,i+1]) = K([i,i+1],[i,i+1]) + k;
end


Tebc = [Tci;Tco];
Allnode = transpose(linspace(1,Num+1,Num+1));
NodeEBC = [1 ; Num+1];
NodeunEBC = setdiff(Allnode,NodeEBC);

T = zeros(Num+1 , 1);

Tunknown = inv(K(NodeunEBC,NodeunEBC))* (R(NodeunEBC)-K(NodeunEBC,NodeEBC)*Tebc);

T(NodeEBC,1) = Tebc;
T(NodeunEBC,1) = Tunknown;

content = fprintf( 'The temperature distribution in the system is as given \n');

disp(T);

X = linspace(0,L,Num+1);
plot(X,T,'b')
hold on;




% Analytical
L1 = 0;
L2 = L;

T0 = Tebc(1);
TL = Tebc(2);

%Tanal = transpose(exp(-(m*X)/U)*(T0 - TL)/(exp(-(L1*m)/U) - exp(-(L2*m)/U)) - (T0*exp(-(L2*m)/U) - TL*exp(-(L1*m)/U))/(exp(-(L1*m)/U) - exp(-(L2*m)/U)));
%Tanal = T0 + (X/L)*(TL-T0);
%plot(X,Tanal,'g');
%fprintf( 'The temperature distribution (analytical) in the system is as given \n');
%disp(Tanal);



Tc = T;
Th = (mc*Tci + mh*Thi - mc*Tc)/mh;

Tho = Th(end)
%Th = Tci + Thi -Tc;
plot(X,Th,'m');

legend('Tc (FEM)','Th (FEM)')

Q = Uheat*pi*Di*L*(1/Num)*(sum(Th(2:end-1)-Tc(2:end-1))+ (Thi-Tco+Tho-Tci)*0.5)

delQ = mh*(Thi-Tho)
delQc = mc*(Tco - Tci)


LMTD = ((Thi-Tci) - (Tho - Tco))/log((Thi-Tci)/(Tho - Tco))
Qanal = Uheat*pi*Di*L*LMTD

Th_FEM = Th;
Tc_FEM = Tc;

%ones(1,Num+1)*(Th-Tc)