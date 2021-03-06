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
%plot([0:Sn-1],r_xx_np,'b-',[0:Sn-1],r_xx_p,'r');
%hold on 
%plot(r_xx_p,'r');
%title('Estimador de la autocorrelacion');
%xlabel('Muestras');
%ylabel('Amplitud');
%legend('Estimador no polarizado','Estimador polarizado');
%grid on;

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
%plot(phikk)
%title('Coeficentes parciales');
%xlabel('Muestras');
%ylabel('Amplitud');
%grid on;


%analizando los graficos anteriores se ve que por lo menos corresponde a un
%ARMA(3)
%%busco los phi_p,i
YuleWalker=toeplitz([r_xx_np(1:3)]);
phi_p_i=linsolve(YuleWalker,r_xx_np(2:4).'); %%estos son los del punto 3

%%calculo los coeficientes reales

r_xx_calc=[1,r_xx_np(2:4)];

for i=5:128
    r_xx_new=phi_p_i(1)*r_xx_calc(i-1)+phi_p_i(2)*r_xx_calc(i-2)+phi_p_i(3)*r_xx_calc(i-3);
    %;
    r_xx_calc=[r_xx_calc,r_xx_new];
end
    
%figure
%plot(0:Sn-1,r_xx_np,0:Sn-1,r_xx_calc,'r--');
%title('Autocorrelacion - Estimada/Te�rica');
%xlabel('Muestras');
%ylabel('Amplitud');
%legend('Estimada','Teorica');
%grid on;


phikk_calc=r_xx_calc(2);
for p=2:Sn-1
    %con esto se crea la matriz de Yule-Walker para encontrar los
    %coeficientes
    YWmat=toeplitz([r_xx_calc(1:p)]);
    aux2=r_xx_calc(2:p+1);
    phifound2=linsolve(YWmat,aux2.');
    phikk_calc=[phikk_calc,phifound2(end)];
end


%figure
%plot(0:Sn-2,phikk,0:Sn-2,phikk_calc,'r--')
%title('Coeficentes parciales de correlacion - Estimado/Te�rico');
%xlabel('Muestras');
%ylabel('Amplitud');
%legend('Estimada','Teorica');
%grid on;



%transformada de la autocorrelacion

r_xx_fft=fft([R_xx_np, fliplr(R_xx_np)]);
r_xx_fft=abs(r_xx_fft);




%calculo de periodogram

PE=fft(samples);
PE=abs(PE);
PE=PE.^2./max(size(samples));



%fft teorica

r_xx_teo_fft=fft(r_xx_calc);
r_xx_teo_fft=abs(r_xx_teo_fft);


plot(PE);
hold on
plot([1:length(r_xx_fft)].*length(PE)./length(r_xx_fft),r_xx_fft,'g');
plot([1:length(r_xx_teo_fft)].*length(PE)./length(r_xx_teo_fft),r_xx_teo_fft,'r');
hold off
title('Comparacion de transformadas');

legend('Periodigrama','Autocorrelacion estimada','Valor te�rico');
%grid on;











