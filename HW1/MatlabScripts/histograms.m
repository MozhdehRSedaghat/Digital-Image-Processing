%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu
%1/22/2019
in1=readraw('rose_dark.raw');
in2=readraw('rose_bright.raw');
in3=readraw('outputrose_dark_tf.raw');
in4=readraw('outputrose_bright_tf.raw');
in5=readraw('outputrose_dark_cp.raw');
in6=readraw('outputrose_bright_cp.raw');
x=0:1:255;
hist1=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in1(i,j)==k)
hist1(k+1)=hist1(k+1)+1;
end
end
end
end
figure(1);
title('histograms of rose_dark');
plot(x,hist1(x+1));
hold on;
plot(x,hist1(x+1),'.');
hist1=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in2(i,j)==k)
hist1(k+1)=hist1(k+1)+1;
end
end
end
end
figure(2);
title('histograms of rose_bright');
plot(x,hist1(x+1));
hold on;
plot(x,hist1(x+1),'.');
hist1=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in3(i,j)==k)
hist1(k+1)=hist1(k+1)+1;
end
end
end
end
figure(3);
title('histograms of rose_dark after applying tf');
plot(x,hist1(x+1));
hold on;
plot(x,hist1(x+1),'.');
hist1=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in4(i,j)==k)
hist1(k+1)=hist1(k+1)+1;
end
end
end
end
figure(4);
title('histograms of rose_bright after applying tf');
plot(x,hist1(x+1));
hold on;
plot(x,hist1(x+1),'.');
hist1=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in5(i,j)==k)
hist1(k+1)=hist1(k+1)+1;
end
end
end
end
figure(5);
title('histograms of rose_dark after applying cp');
plot(x,hist1(x+1));
hold on;
plot(x,hist1(x+1),'.');
hist1=zeros(1,256);
for k=0:255
for i=1:400
for j=1:400
if(in6(i,j)==k)
hist1(k+1)=hist1(k+1)+1;
end
end
end
end
figure(6);
title('histograms of rose_bright after applying cp');
plot(x,hist1(x+1));
hold on;
plot(x,hist1(x+1),'.');