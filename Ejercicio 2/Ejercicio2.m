%Generamos la matriz A
mu1= 1;
mu2= 2;
sigma1 = 0.5;
sigma2 = 1;
rho = 0.8;
a11 = 0;
a12 = sigma1;
a21 = sigma2*sqrt(1-rho);
a22 = rho*sigma2;

n = 10000; %Repeticiones del experimento
%Genero 2 Variables aleatorias Gaussianas independientes e identicamente
%distribuidas

%X1 = mvnrnd(0,1,n);
%X2 = mvnrnd(0,1,n);

U1 = rand(10000,1);
U2 = rand(10000,1);
R = sqrt(2.*log(1./(1.-U1)));
X1 = R .* cos(U2 * 2 *pi);
X2 = R .* sin(U2 * 2 * pi);



Y1 = a11*X1 + a12*X2 + mu1;
Y2 = a21*X1 + a22*X2 + mu2;

plot(Y1,Y2,'.');
xlabel("Variable Aleatoria 1");
ylabel("Variable Aleatoria 2");
title("Ejericico 2b");
grid on;

