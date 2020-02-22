Numd = 20;

a = (M/(l^2)) + (U/(2*l));
b = (M/(l^2)) - (U/(2*l));
c = 2*M/(l^2) ;
T = zeros(Numd+1,1);
T(1,1) = Tci;
T(end,1) = Tco;
T(2:end-1,1) = 0.5*(Tci + Tco);
N = 500 % Number of Iterations
for i = 1 : N
    for j = 2:(Numd)
        T(j,1) = (a/c)*T(j+1,1) + (b/c)*T(j-1,1);
    end
    
end
%fprintf('Temperature after iterating \n ')

Tc = T

