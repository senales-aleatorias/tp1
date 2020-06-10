function [E] = valorEsperado(t,val,numMuestras,numTime,time)
    E = 0;
    for i = 1:numMuestras
        temp = 0;
        for u =1:numTime
            if (t(u,i)>time)
                if(temp <= 0)
                    temp = u-1;
                end
            end
        end
        E = E + val(temp,i)/numMuestras;

    end
end