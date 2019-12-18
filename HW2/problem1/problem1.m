%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu

s1=321;s2=481;
colorImage1 = imread('Pig.jpg');
%Turn color image to gray-scale
Image1=zeros(s1,s2);
for i=1:s1
    for j=1:s2
        Image1(i,j)=uint8(colorImage1(i,j,1)/3+colorImage1(i,j,2)/3+colorImage1(i,j,3)/3);
    end
end

figure(1);
imshow(uint8(Image1));

colorImage2 = imread('Tiger.jpg');
%Turn color image to gray-scale
Image2=zeros(s1,s2);
for i=1:s1
    for j=1:s2
        Image2(i,j)=uint8(colorImage2(i,j,1)/3+colorImage2(i,j,2)/3+colorImage2(i,j,3)/3);
    end
end
figure(2);
imshow(uint8(Image2));

%computing Gradiant in both directions by using sobel filter
gy1=zeros(s1,s2);%vertical
for i=1:s1
    for j=1:s2
        g=0;
        if(i+1<=s1&&j-1>=1)
        g=g-Image1(i+1,j-1);
        end
        if(i+1<=s1)
        g=g-2*Image1(i+1,j);
        end
        if(i+1<=s1&&j+1<=s2)
        g=g-Image1(i+1,j+1);
        end
        if(i-1>=1&&j-1>=1)
        g=g+Image1(i-1,j-1);
        end
        if(i-1>=1)
        g=g+2*Image1(i-1,j);
        end
        if(i-1>=1&&j+1<=s2)
        g=g+Image1(i-1,j+1);
        end
        gy1(i,j)=abs(g);
        
    end
end

gx1=zeros(s1,s2);%horizontal
for i=1:s1
    for j=1:s2
        g=0;
        if(i-1>=1&&j+1<=s2)
            g=g+Image1(i-1,j+1);
        end
        if(j+1<=s2)
            g=g+2*Image1(i,j+1);
        end
        if(i+1<=s1&&j+1<=s2)
            g=g+Image1(i+1,j+1);
        end
        if(i-1>=1&&j-1>=1)
            g=g-Image1(i-1,j-1);
        end
        if(j-1>=1)
            g=g-2*Image1(i,j-1);
        end
        if(i+1<=s1&&j-1>=1)
            g=g-Image1(i+1,j-1);
        end
        gx1(i,j)=abs(g);
    end
end

%Normalization
maxx=0;
maxy=0;
for i=1:s1
    for j=1:s2
        if(gx1(i,j)>maxx)
            maxx=gx1(i,j);
        end
        if(gy1(i,j)>maxy)
            maxy=gy1(i,j);
        end
    end
end
for i=1:s1
    for j=1:s2
        gx1(i,j)=round(gx1(i,j)*255/maxx);
        gy1(i,j)=round(gy1(i,j)*255/maxy);
    end
end

%computing Gradiant in both directions by using sobel filter
gy2=zeros(s1,s2);%vertical
for i=1:s1
    for j=1:s2
        g=0;
        if(i+1<=s1&&j-1>=1)
        g=g-Image2(i+1,j-1);
        end
        if(i+1<=s1)
        g=g-2*Image2(i+1,j);
        end
        if(i+1<=s1&&j+1<=s2)
        g=g-Image2(i+1,j+1);
        end
        if(i-1>=1&&j-1>=1)
        g=g+Image2(i-1,j-1);
        end
        if(i-1>=1)
        g=g+2*Image2(i-1,j);
        end
        if(i-1>=1&&j+1<=s2)
        g=g+Image2(i-1,j+1);
        end
        gy2(i,j)=abs(g);
        
    end
end

gx2=zeros(s1,s2);%horizontal
for i=1:s1
    for j=1:s2
        g=0;
        if(i-1>=1&&j+1<=s2)
            g=g+Image2(i-1,j+1);
        end
        if(j+1<=s2)
            g=g+2*Image2(i,j+1);
        end
        if(i+1<=s1&&j+1<=s2)
            g=g+Image2(i+1,j+1);
        end
        if(i-1>=1&&j-1>=1)
            g=g-Image2(i-1,j-1);
        end
        if(j-1>=1)
            g=g-2*Image2(i,j-1);
        end
        if(i+1<=s1&&j-1>=1)
            g=g-Image2(i+1,j-1);
        end
        gx2(i,j)=abs(g);
    end
end

%Normalization
maxx=0;
maxy=0;
for i=1:s1
    for j=1:s2
        if(gx2(i,j)>maxx)
            maxx=gx2(i,j);
        end
        if(gy2(i,j)>maxy)
            maxy=gy2(i,j);
        end
    end
end
for i=1:s1
    for j=1:s2
        gx2(i,j)=round(gx2(i,j)*255/maxx);
        gy2(i,j)=round(gy2(i,j)*255/maxy);
    end
end

figure(3);
imshow(uint8(gx1));
figure(4);
imshow(uint8(gy1));

figure(5);
imshow(uint8(gx2));
figure(6);
imshow(uint8(gy2));

%finding the value of the grad in each pixel 
grad1=zeros(s1,s2);%grad of pig
for i=1:s1
    for j=1:s2
        grad1(i,j)=sqrt(gx1(i,j)*gx1(i,j)+gy1(i,j)*gy1(i,j));
    end
end

grad2=zeros(s1,s2);%grad of tiger
for i=1:s1
    for j=1:s2
        grad2(i,j)=sqrt(gx2(i,j)*gx2(i,j)+gy2(i,j)*gy2(i,j));
    end
end

max1=0;
max2=0;
for i=1:s1
    for j=1:s2
        if(grad1(i,j)>max1)
            max1=grad1(i,j);
        end
        if(grad2(i,j)>max2)
            max2=grad2(i,j);
        end
    end
end
for i=1:s1
    for j=1:s2
        grad1(i,j)=round(grad1(i,j)*255/max1);
        grad2(i,j)=round(grad2(i,j)*255/max2);
    end
end

figure(7);
imshow(uint8(grad1));
figure(8);
imshow(uint8(grad2));

%Histogram
x=0:1:255;
hist1=zeros(1,256);
cum1=zeros(1,256);
for k=0:255
    for i=1:s1
        for j=1:s2
            if(grad1(i,j)==k)
                hist1(k+1)=hist1(k+1)+1;
            end
        end
    end
    if(k==0)
    cum1(k+1)=hist1(k+1)/(s1*s2);
    else
    cum1(k+1)=cum1(k)+hist1(k+1)/(s1*s2);
    end
end
figure(9);
plot(x,cum1(x+1));
title('histograms of the grad of the Pig image');

x=0:1:255;
hist2=zeros(1,256);
cum2=zeros(1,256);
for k=0:255
    for i=1:s1
        for j=1:s2
            if(grad2(i,j)==k)
                hist2(k+1)=hist2(k+1)+1;
            end
        end
    end
    if(k==0)
    cum2(k+1)=hist2(k+1)/(s1*s2);
    else
    cum2(k+1)=cum2(k)+hist2(k+1)/(s1*s2);
    end
end
figure(10);
plot(x,cum2(x+1));
title('histograms of the grad of the Tiger image');

%finding Th=90% for pig
for k=0:255
    if(cum1(k+1)>=.9)
        Th90_1=k;
        break;
    end
end

%finding Th=90% for tiger
for k=0:255
    if(cum2(k+1)>=.9)
        Th90_2=k;
        break;
    end
end

%finding Th=85% for pig
for k=0:255
    if(cum1(k+1)>=.85)
        Th85_1=k;
        break;
    end
end

%finding Th=85% for tiger
for k=0:255
    if(cum2(k+1)>=.85)
        Th85_2=k;
        break;
    end
end

out90_1=ones(s1,s2);
for i=1:s1
        for j=1:s2
            if(grad1(i,j)>=Th90_1)
                out90_1(i,j)=0;
            end
        end
end

figure(11);
imshow(out90_1);title('out90_1.png');
imwrite(out90_1,'out90_1.png')

out85_1=ones(s1,s2);
for i=1:s1
        for j=1:s2
            if(grad1(i,j)>=Th85_1)
                out85_1(i,j)=0;
            end
        end
end

figure(12);
imshow(out85_1);title('out85_1.png');
imwrite(out85_1,'out85_1.png');

out90_2=ones(s1,s2);
for i=1:s1
        for j=1:s2
            if(grad2(i,j)>=Th90_2)
                out90_2(i,j)=0;
            end
        end
end

figure(13);
imshow(out90_2);title('out90_2.png');
imwrite(out90_2,'out90_2.png')

out85_2=ones(s1,s2);
for i=1:s1
        for j=1:s2
            if(grad2(i,j)>=Th85_2)
                out85_2(i,j)=0;
            end
        end
end

figure(14);
imshow(out85_2);title('out85_2.png');
imwrite(out90_1,'out85_2.png')
%%
clc;clear;
s1=321;s2=481;
colorImage1 = imread('Pig.jpg');
%Turn color image to gray-scale
Image1=zeros(s1,s2);
for i=1:s1
    for j=1:s2
        Image1(i,j)=uint8(colorImage1(i,j,1)/3+colorImage1(i,j,2)/3+colorImage1(i,j,3)/3);
    end
end

figure(15);
imshow(uint8(Image1));

colorImage2 = imread('Tiger.jpg');
%Turn color image to gray-scale
Image2=zeros(s1,s2);
for i=1:s1
    for j=1:s2
        Image2(i,j)=uint8(colorImage2(i,j,1)/3+colorImage2(i,j,2)/3+colorImage2(i,j,3)/3);
    end
end
figure(16);
imshow(uint8(Image2));

[BW1, threshOut1] = edge(Image1,'canny',[.1,.2]);
figure(17);
imshow(1-BW1)
imwrite(1-BW1,'canny1_lowT.png')

BW1= edge(Image1,'canny',[.11,.34]);
figure(18);
imshow(1-BW1)
imwrite(1-BW1,'canny1_medT.png')

BW1 = edge(Image1,'canny',[.15,.35]);
figure(19);
imshow(1-BW1)
imwrite(1-BW1,'canny1_highT.png')

[BW2, threshOut2] = edge(Image2,'canny',[.1,.3]);
figure(20);
imshow(1-BW2)
imwrite(1-BW2,'canny2_lowT.png')

BW2= edge(Image2,'canny',[.175,.31]);
figure(21);
imshow(1-BW2)
imwrite(1-BW2,'canny2_medT.png')

BW2= edge(Image2,'canny',[.2,.4]);
figure(22);
imshow(1-BW2)
imwrite(1-BW2,'canny2_highT.png')
%%
%toolboxCompile;
mex private/edgesDetectMex.cpp -outdir private [-DUSEOMP' 'OPTIMFLAGS="$OPTIMFLAGS' '/openmp"]
mex private/edgesNmsMex.cpp    -outdir private [-DUSEOMP' 'OPTIMFLAGS="$OPTIMFLAGS' '/openmp"]
mex private/spDetectMex.cpp    -outdir private [-DUSEOMP' 'OPTIMFLAGS="$OPTIMFLAGS' '/openmp"]
mex private/edgeBoxesMex.cpp   -outdir private
addpath(pwd); savepath;
%%
E=im2double(imread('out90_2.png'));
G=load('Tiger.mat');
K=65;
Result=zeros(5,2,K);
for i=1:length(G.groundTruth)
    G=load('Tiger.mat');
    G=G.groundTruth{i};
    [thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(1-E,G);
    r=cntR./sumR;
    p=cntP./sumP;
    Result(i,1,:)=r;
    Result(i,2,:)=p;
end

meanThP=zeros(1,5);
meanThR=zeros(1,5);
for i=1:5
    meanThR(i)=mean(Result(i,1,:));
    meanThP(i)=mean(Result(i,2,:));
end
meanThF=2*meanThR.*meanThP./(meanThR+meanThP);

meanModelP=zeros(1,5);
meanModelR=zeros(1,5);
for i=1:K
    meanModelR(i)=mean(Result(:,1,i));
    meanModelP(i)=mean(Result(:,2,i));
end
meanModelF=2*meanModelR.*meanModelP./(meanModelR+meanModelP);
figure(23);
plot(thrs,meanModelF);ylim([min(meanModelF(:))-.1 max(meanModelF(:))+.1])
BestF=max(meanModelF(:));
