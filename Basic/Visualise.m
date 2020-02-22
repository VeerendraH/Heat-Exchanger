Xe = linspace(0,L,Nume+1);
plot(Xe,T,'r')
hold on;

Tc = T;
Th = (mc*Tci + mh*Thi - mc*Tc)/mh;

Tho = Th(end)
%Th = Tci + Thi -Tc;
plot(Xe,Th,'c');

Q = Uheat*pi*Di*L*(1/Num)*(sum(Th(2:end-1)-Tc(2:end-1))+ (Thi-Tco+Tho-Tci)*0.5)

delQ = mh*(Thi-Tho)
delQc = mc*(Tco - Tci)


LMTD = ((Thi-Tci) - (Tho - Tco))/log((Thi-Tci)/(Tho - Tco))
Qanal = Uheat*pi*Di*L*LMTD


Xd = linspace(0,L,Numd+1);
plot(Xd,Tc,'c')
hold on;


Th = (mc*Tci + mh*Thi - mc*Tc)/mh

Tho = Th(end)
%Th = Tci + Thi -Tc;

plot(Xd,Th,'r');
hold on;
legend('Tc (FEM)','Th (FEM)','Tc (FDM)','Th (FDM)')

title('Temperature versus Length')

Q = Uheat*pi*Di*L*(1/Numd)*(sum(Th(2:end-1)-Tc(2:end-1))+ (Thi-Tco+Tho-Tci)*0.5)

delQ = mh*(Thi-Tho)
delQc = mc*(Tco - Tci)


LMTD = ((Thi-Tci) - (Tho - Tco))/log((Thi-Tci)/(Tho - Tco))
Qanal = Uheat*pi*Di*L*LMTD

Th_FDM = Th;
Tc_FDM = Tc;