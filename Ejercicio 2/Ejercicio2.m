%Determinamos los valores dependiendo del ejercicio
mu1= 1;
mu2= 2;
sigma1 = 0.5;
sigma2 = 1;
rho = 0.8;
n = 100000; %Repeticiones del experimento

%Generamos la matriz A para realizar la transformación lineal.

a11 = 0;
a12 = sigma1;
a21 = sigma2*sqrt(1-rho);
a22 = rho*sigma2;

%Genero 2 Variables aleatorias Gaussianas independientes e identicamente
%distribuidas X1 y X2 a partir del metodo de montecarlo con 2 Uniformes
% U1 y U2, genero con U1 una VA de Rayleigh R, y con R y U2 genero X1 y X2


U1 = rand(n,1);
U2 = rand(n,1);
R = sqrt(2.*log(1./(1.-U1)));
X1 = R .* cos(U2 * 2 *pi);
X2 = R .* sin(U2 * 2 * pi);

%A partir de X1 y X2, genero un vector X y lo multiplico por la matriz A
%Esto me devuelve un vector Y que contiene las VA Y1 y Y2 que son
%gaussianas y correlacionadas.



Y1 = a11*X1 + a12*X2 + mu1;
Y2 = a21*X1 + a22*X2 + mu2;

%Ploteo

plot(Y1,Y2,'.');
xlabel("Y1");
ylabel("Y2");
title("Ejericico 2b"); %NO OLVIDAR DE CAMBIAR EL TITULO
grid on;

