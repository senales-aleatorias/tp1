function rayleighRVs = rayleighRVS(nPoints, lambda)
    % Funcion que genera un vector de numeros aleatorios con distribucion
    % de Rayleigh
    % parametro n: extension del vector a generar
    % parametro lambda: parametro de escala de la distribucion de Rayleigh
    % return rvs: vector de elementos generado
    
    uniformRVs = rand(1,nPoints);
    rayleighRVs = sqrt(2*lambda^2*log(1./(1-uniformRVs)));
end