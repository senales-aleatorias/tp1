numMuestras = 100;
numTime = 100;

t = zeros(numTime,numMuestras);
val = zeros(numTime,numMuestras);
lambda = 1.0;

for u = 1:numMuestras
    for i = 1:numTime
        temp = rand;
        interArribalTime = -1 * log(1-temp)/lambda;
        if i > 1
            t(i,u)=t(i-1,u)+interArribalTime;
            val(i,u) = val(i-1,u)+1;
        end
    end
end
stairs(t,val)
grid minor;

%%Valor esperado
%Teorico
EX4_teo = lambda*4;
EX4_calc = valorEsperado(t,val,numMuestras,numTime,4);
EX4_teo
EX4_calc

%%Varianza

VAR7_teo = lambda*7;
VAR7_calc = 0;
EX7_calc = valorEsperado(t,val,numMuestras,numTime,7);
for i = 1:numMuestras
    temp = 0;
    for u =1:numTime
        if (t(u,i)>7)
            if(temp <= 0)
                temp = u-1;
            end
        end
    end
    VAR7_calc = VAR7_calc + (val(temp,i)-EX7_calc)^2;
end
VAR7_calc = VAR7_calc /numMuestras;

VAR7_teo
VAR7_calc


%%RXX

RXX58_teo=lambda^2 * 5 * 8 + 5;
RXX58_calc = RXX(t,val,numMuestras,numTime,5,8);
RXX58_teo
RXX58_calc

%%rxx


rxx23_teo=(lambda^2 * 2 * 3 + lambda*2 - lambda*2 *lambda*3)/sqrt((lambda^2 * 2 * 2 + lambda*2 - lambda*2 *lambda*2)*(lambda^2 * 3 * 3 + lambda*3 - lambda*3 *lambda*3));
rxx23_calc = CXX(t,val,numMuestras,numTime,2,3)/(sqrt(CXX(t,val,numMuestras,numTime,2,2)*CXX(t,val,numMuestras,numTime,3,3)));


rxx23_teo
rxx23_calc


%% Punto c


    
