%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu
%1/22/2019
in1=readraw('rose_dark.raw');
in2=readraw('rose_bright.raw');
x=0:1:255;
hist1=zeros(1,256);
cdf1=zeros(1,256);
tf=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in1(i,j)==k)
hist1(k+1)=hist1(k+1)+1;
end
end
end
end
cdf1(1)=hist1(1);
for i=2:256
    cdf1(i)=cdf1(i-1)+hist1(i);
end
for i=2:256
    if(cdf1(i)>0)
        cdfmin=cdf1(i);
        break;
    end
end
for i=2:256
    if(cdf1(i)>0)
   tf(i)=round(255*(cdf1(i)-cdfmin)/(400*400-cdfmin));
    end
end
plot(x,tf(x+1),'.');
title('transfer function of rose_dark' );

hist2=zeros(1,256);
cdf2=zeros(1,256);
tf2=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in2(i,j)==k)
hist2(k+1)=hist2(k+1)+1;
end
end
end
end
cdf2(1)=hist2(1);
for i=2:256
    cdf2(i)=cdf2(i-1)+hist2(i);
end
for i=2:256
    if(cdf2(i)>0)
        cdfmin=cdf2(i);
        break;
    end
end
for i=2:256
    if(cdf2(i)>0)
   tf2(i)=round(255*(cdf2(i)-cdfmin)/(400*400-cdfmin));
    end
end
figure(2);
plot(x,tf2(x+1),'.');
title('transfer function of rose_bright' );