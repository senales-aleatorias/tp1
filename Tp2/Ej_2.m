Y=load('C:\Users\marth\Documents\ITBA\Señales aleatorias\Tp 2\Archivo_2.mat');


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
plot(r_xx_np);
phikk=r_xx_np(2);
title('estimador de la autocorrelacion');

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
title('coeficentes parciales');
