function [C] = CXX(t,val,numMuestras,numTime,time1,time2)
    C = RXX(t,val,numMuestras,numTime,time1,time2)-(valorEsperado(t,val,numMuestras,numTime,time1)*valorEsperado(t,val,numMuestras,numTime,time2));
end