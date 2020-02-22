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

Tci = 293;
Tco = 353;

Thi = 373;

mt0 = mc*Tci + mh*Thi;