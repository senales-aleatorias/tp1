function [R] = RXX(t,val,numMuestras,numTime,time1,time2)
    R = 0;
    for i = 1:numMuestras
        temp1 = 0;
        temp2 = 0;
        for u =1:numTime
            if (t(u,i)>time1)
                if(temp1 <= 0)
                    temp1 = u-1;
                end
            end
            if (t(u,i)>time2)
                if(temp2 <= 0)
                    temp2 = u-1;
                end
            end
        end
        R = R + val(temp1,i)*val(temp2,i)/numMuestras;
    end
end