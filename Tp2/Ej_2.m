Y=load('C:\Users\marth\Documents\ITBA\Se�ales aleatorias\Tp 2\Archivo_2.mat');


samples=Y.x;


%%estimador no polarizado de los primeros 128 elementos de la
%%autocorrelacion

R_xx_p=0;

N=max(size(samples));
Sn=128;
R_xx_np=0;
for k = 0:Sn-1
    X_i=samples(1:N-k);
    X_k=samples(k+1:N);
    mult=X_i .* X_k;
    mult=sum(mult)*(1/(N-k));
    R_xx_np=[R_xx_np,mult];
   
end

R_xx_np=R_xx_np(2:end);
r_xx_np=R_xx_np./R_xx_np(1);

%%estimador polarizado de los primeros 128 elementos de la autocorrelacion
R_xx_p=0;
for k = 0:Sn-1
    X_i=samples(1:N-k);
    X_k=samples(k+1:N);
    mult=X_i .* X_k;
    mult=sum(mult)*(1/N);
    R_xx_p=[R_xx_p,mult];
   
end

R_xx_p=R_xx_p(2:end);
r_xx_p=R_xx_p./R_xx_p(1);

%%ahora paso a calcular los coeficientes de correlacion parciales
plot([0:Sn-1],r_xx_np,'b-',[0:Sn-1],r_xx_p,'r');
%hold on 
%plot(r_xx_p,'r');
title('Estimador de la autocorrelacion');
xlabel('Muestras');
ylabel('Amplitud');
legend('Estimador no polarizado','Estimador polarizado');
grid on;
phikk=r_xx_np(2);

for p=2:Sn-1
    %con esto se crea la matriz de Yule-Walker para encontrar los
    %coeficientes
    YWmat=toeplitz([r_xx_np(1:p)]);
    aux=r_xx_np(2:p+1);
    phifound=linsolve(YWmat,aux.');
    phikk=[phikk,phifound(end)];
end
figure
plot(phikk)
title('Coeficentes parciales');
xlabel('Muestras');
ylabel('Amplitud');
grid on;


%analizando los graficos anteriores se ve que por lo menos corresponde a un
%ARMA(3)

%%busco los phi_p,i
YuleWalker=toeplitz([r_xx_np(1:3)]);
phi_p_i=linsolve(YuleWalker,r_xx_np(2:4).'); %%estos son los del punto 3

%%calculo los coeficientes reales

r_xx_calc=[1,r_xx_np(2:4)];





