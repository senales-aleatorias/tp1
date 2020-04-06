clear all
close all
% Generar un vector de numeros aleatorios con distribucion de Rayleigh
nPoints = 700;
lambda = 1;
rayleighRVs = rayleighRVS(nPoints, lambda);

% Plotear histograma vs curva teorica
figure(1)
% Histograma
nBins = 30;
histogram(rayleighRVs, nBins, 'Normalization', 'pdf');
hold on
% Curva Teorica
x = linspace(min(rayleighRVs), max(rayleighRVs));
rayleighPDF = x.*exp((-x.^2)/(2*lambda^2))/lambda^2;
plot(x, rayleighPDF, 'LineWidth', 1.2);
legend('Histograma', 'Funcion Densidad de Probabilidad Teórica')
grid('minor')
hold off

% Estimar media y varianza
meanVector = mean(rayleighRVs);
var = std(rayleighRVs)^2;
% Calcular media y varianza teorica
mux = lambda*sqrt(pi/2);
varx = (4-pi)/2 * lambda^2;
% Calculo de error
meanPorcentualError = abs(meanVector - mux)/mux * 100;
varPorcentualError = abs(var - varx) / varx * 100;

stream1 = ['Error porcentual de la Media: ', num2str(meanPorcentualError), '%'];
stream2 = ['Error porcentual de la varianza: ', num2str(varPorcentualError), '%'];

disp(stream1)
disp(stream2)

%Loops de corridas para hacer histograma de la media
figure(2)
distNumber=700;
nBins=50;

for i=1:distNumber
    meanRayleigh(i) = mean(rayleighRVS(nPoints, lambda));
end

histogram(meanRayleigh, nBins, 'Normalization', 'pdf');
hold on
L = ['Media de la distribución de Rayleigh, ',num2str(distNumber),' muestras.'];
legend(L) 
grid('minor')
hold off