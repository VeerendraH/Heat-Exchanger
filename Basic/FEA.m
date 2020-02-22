Nume = 20;
l = L/Nume ;

K = zeros(Nume +1,Nume+1);
R = zeros(Nume+1,1);

for i = 1:Nume
    k = M*(Nume/L)*[1 -1 ; -1 1] - 0.5*U*[-1 1;-1 1];
    K([i,i+1],[i,i+1]) = K([i,i+1],[i,i+1]) + k;
end


Tebc = [Tci;Tco];
Allnode = transpose(linspace(1,Nume+1,Nume+1));
NodeEBC = [1 ; Nume+1];
NodeunEBC = setdiff(Allnode,NodeEBC);

T = zeros(Nume+1 , 1);

Tunknown = inv(K(NodeunEBC,NodeunEBC))* (R(NodeunEBC)-K(NodeunEBC,NodeEBC)*Tebc);

T(NodeEBC,1) = Tebc;
T(NodeunEBC,1) = Tunknown;

content = fprintf( 'The temperature distribution in the system is as given \n');

disp(T);
