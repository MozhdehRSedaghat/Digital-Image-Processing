function [ out ] = MBVQ( in1,in2,in3 )
    if(in1+in2>255)
        if(in2+in3>255)
            if(in1+in2+in3>510)
                out= 'CMYW';
            else
                out= 'MYGC';
            end
        else
            out='RGMY';
        end
    elseif(~(in2+in3>255))
        if(~(in1+in2+in3>255))
            out='KRGB';
        else
            out='RGBM';
        end
    else
        out='CMGB';
    end
end

