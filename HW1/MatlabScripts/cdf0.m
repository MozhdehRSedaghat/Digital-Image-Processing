%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu
%1/22/2019
in1=readraw('rose_dark.raw');
in2=readraw('rose_bright.raw');
x=0:1:255;
hist1=zeros(1,256);
cdf1=zeros(1,256);
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
figure(1);
plot(x,cdf1(x+1),'.');
title('cumulative histogram of rose_dark' );

hist2=zeros(1,256);
cdf2=zeros(1,256);
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
figure(2);
plot(x,cdf2(x+1),'.');
title('cumulative histogram of rose_bright' );