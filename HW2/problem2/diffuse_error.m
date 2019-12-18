function [ out ] = diffuse_error( in )
    out=zeros(375,500);
    for i=1:375
        if(mod(i,2)==1)
            for j=1:500
                if(in(i,j)>=127)
                    out(i,j)=1;
                    temperror=in(i,j)-255;
                else
                    out(i,j)=0;
                    temperror=in(i,j);
                end
                if(j+1<=500)
                    in(i,j+1)=in(i,j+1)+7/16*temperror;
                end
                if(j+1<=500&&i+1<=375)
                    in(i+1,j+1)=in(i+1,j+1)+1/16*temperror;
                end
                if(i+1<=375)
                    in(i+1,j)=in(i+1,j)+5/16*temperror;
                end
                if(j-1>=1&&i+1<=375)
                    in(i+1,j-1)=in(i+1,j-1)+3/16*temperror;
                end
            end
        else
            for j=500:-1:1
                if(in(i,j)>=127)
                    out(i,j)=1;
                    temperror=in(i,j)-255;
                else
                    out(i,j)=0;
                    temperror=in(i,j);
                end
                if(j-1>=1)
                    in(i,j-1)=in(i,j-1)+7/16*temperror;
                end
                if(j-1>=1&&i+1<=375)
                    in(i+1,j-1)=in(i+1,j-1)+1/16*temperror;
                end
                if(i+1<=375)
                    in(i+1,j)=in(i+1,j)+5/16*temperror;
                end
                if(j+1<=500&&i+1<=375)
                    in(i+1,j+1)=in(i+1,j+1)+3/16*temperror;
                end
            end
        end
    end
end

