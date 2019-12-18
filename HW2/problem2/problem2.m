%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu

%Part a
file = fopen('bridge.raw','r');
Data = fread(file,'uint8=>uint8');
Image = reshape(Data,600,400)';
figure(1);
imshow(Image);
randTh=255*(rand(400,600));
out1=zeros(400,600);
for i=1:400
    for j=1:600
        if(Image(i,j)>=randTh(i,j))
           out1(i,j)=1;
        else
           out1(i,j)=0;
        end
    end
end
figure(2);
imshow(out1);      

I2=[1 2;3 0];
I4=[4*I2+1,4*I2+2;4*I2+3,4*I2];
I8=[4*I4+1,4*I4+2;4*I4+3,4*I4];
I16=[4*I8+1,4*I8+2;4*I8+3,4*I8];
I32=[4*I16+1,4*I16+2;4*I16+3,4*I16];
thMat2=zeros(2);
thMat8=zeros(8);
thMat32=zeros(32);
for i=1:2
    for j=1:2
        thMat2(i,j)=(I2(i,j))*255/4;
    end
end
for i=1:8
    for j=1:8
        thMat8(i,j)=(I8(i,j))*255/64;
    end
end
for i=1:32
    for j=1:32
        thMat32(i,j)=(I32(i,j)+.5)*255/1024;
    end
end

out2=zeros(400,600);
for i=1:400
    for j=1:600
            if(Image(i,j)>=thMat2(mod(i,2)+1,mod(j,2)+1))
               out2(i,j)=1;
            else
               out2(i,j)=0;
            end
    end
end
figure(3);
imshow(out2);

out3=zeros(400,600);
for i=1:400
    for j=1:600
            if(Image(i,j)>=thMat8(mod(i,8)+1,mod(j,8)+1))
               out3(i,j)=1;
            else
               out3(i,j)=0;
            end
    end
end
figure(4);
imshow(out3);

out4=zeros(400,600);
for i=1:400
    for j=1:600
            if(Image(i,j)>=thMat32(mod(i,32)+1,mod(j,32)+1))
               out4(i,j)=1;
            else
               out4(i,j)=0;
            end
    end
end
figure(5);
imshow(out4);

%%
%Part b
file = fopen('bridge.raw','r');
Data = fread(file,'uint8=>uint8');
Image = reshape(Data,600,400)';
figure(6);
imshow(Image);

input=zeros(400,600);

for i=1:400
    for j=1:600
        input(i,j)=Image(i,j);
    end
end
        
out5=zeros(400,600);%Floyd-Steinberg’s error diffusion
for i=1:400
    if(mod(i,2)==1)
        for j=1:600
            if(input(i,j)>=127)
                out5(i,j)=1;
                temperror=input(i,j)-255;
            else
                out5(i,j)=0;
                temperror=input(i,j);
            end
            if(j+1<=600)
                input(i,j+1)=input(i,j+1)+7/16*temperror;
            end
            if(j+1<=600&&i+1<=400)
                input(i+1,j+1)=input(i+1,j+1)+1/16*temperror;
            end
            if(i+1<=400)
                input(i+1,j)=input(i+1,j)+5/16*temperror;
            end
            if(j-1>=1&&i+1<=400)
                input(i+1,j-1)=input(i+1,j-1)+3/16*temperror;
            end
        end
    else
        for j=600:-1:1
            if(input(i,j)>=127)
                out5(i,j)=1;
                temperror=input(i,j)-255;
            else
                out5(i,j)=0;
                temperror=input(i,j);
            end
            if(j-1>=1)
                input(i,j-1)=input(i,j-1)+7/16*temperror;
            end
            if(j-1>=1&&i+1<=400)
                input(i+1,j-1)=input(i+1,j-1)+1/16*temperror;
            end
            if(i+1<=400)
                input(i+1,j)=input(i+1,j)+5/16*temperror;
            end
            if(j+1<=600&&i+1<=400)
                input(i+1,j+1)=input(i+1,j+1)+3/16*temperror;
            end
        end
    end
end
figure(7);
imshow(out5);

for i=1:400
    for j=1:600
        input(i,j)=Image(i,j);
    end
end
        
out6=zeros(400,600);%JJN error diffusion
for i=1:400
    if(mod(i,2)==1)
        for j=1:600
            if(input(i,j)>=127)
                out6(i,j)=1;
                temperror=input(i,j)-255;
            else
                out6(i,j)=0;
                temperror=input(i,j);
            end
            if(j+1<=600)
                input(i,j+1)=input(i,j+1)+7/48*temperror;
            end
            if(j+1<=600&&i+1<=400)
                input(i+1,j+1)=input(i+1,j+1)+5/48*temperror;
            end
            if(i+1<=400)
                input(i+1,j)=input(i+1,j)+7/48*temperror;
            end
            if(j-1>=1&&i+1<=400)
                input(i+1,j-1)=input(i+1,j-1)+5/48*temperror;
            end
            if(j+2<=600)
                input(i,j+2)=input(i,j+2)+5/48*temperror;
            end
            if(j+2<=600&&i+1<=400)
                input(i+1,j+2)=input(i+1,j+2)+3/48*temperror;
            end
            if(j+2<=600&&i+2<=400)
                input(i+2,j+2)=input(i+2,j+2)+1/48*temperror;
            end
            if(j+1<=600&&i+2<=400)
                input(i+2,j+1)=input(i+2,j+1)+3/48*temperror;
            end
            if(i+2<=400)
                input(i+2,j)=input(i+2,j)+5/48*temperror;
            end
            if(j-1>=1&&i+2<=400)
                input(i+2,j-1)=input(i+2,j-1)+3/48*temperror;
            end
            if(j-2>=1&&i+2<=400)
                input(i+2,j-2)=input(i+2,j-2)+1/48*temperror;
            end
            if(j-2>=1&&i+1<=400)
                input(i+1,j-2)=input(i+1,j-2)+3/48*temperror;
            end
        end
    else
        for j=600:-1:1
            if(input(i,j)>=127)
                out6(i,j)=1;
                temperror=input(i,j)-255;
            else
                out6(i,j)=0;
                temperror=input(i,j);
            end
            if(j-1>=1)
                input(i,j-1)=input(i,j-1)+7/48*temperror;
            end
            if(j+1<=600&&i+1<=400)
                input(i+1,j+1)=input(i+1,j+1)+5/48*temperror;
            end
            if(i+1<=400)
                input(i+1,j)=input(i+1,j)+7/48*temperror;
            end
            if(j-1>=1&&i+1<=400)
                input(i+1,j-1)=input(i+1,j-1)+5/48*temperror;
            end
            if(j-2>=1)
                input(i,j-2)=input(i,j-2)+5/48*temperror;
            end
            if(j+2<=600&&i+1<=400)
                input(i+1,j+2)=input(i+1,j+2)+3/48*temperror;
            end
            if(j+2<=600&&i+2<=400)
                input(i+2,j+2)=input(i+2,j+2)+1/48*temperror;
            end
            if(j+1<=600&&i+2<=400)
                input(i+2,j+1)=input(i+2,j+1)+3/48*temperror;
            end
            if(i+2<=400)
                input(i+2,j)=input(i+2,j)+5/48*temperror;
            end
            if(j-1>=1&&i+2<=400)
                input(i+2,j-1)=input(i+2,j-1)+3/48*temperror;
            end
            if(j-2>=1&&i+2<=400)
                input(i+2,j-2)=input(i+2,j-2)+1/48*temperror;
            end
            if(j-2>=1&&i+1<=400)
                input(i+1,j-2)=input(i+1,j-2)+3/48*temperror;
            end
        end
    end
end
figure(8);
imshow(out6);

for i=1:400
    for j=1:600
        input(i,j)=Image(i,j);
    end
end
        
out7=zeros(400,600);%Stucki error diffusion
for i=1:400
    if(mod(i,2)==1)
        for j=1:600
            if(input(i,j)>=127)
                out7(i,j)=1;
                temperror=input(i,j)-255;
            else
                out7(i,j)=0;
                temperror=input(i,j);
            end
            if(j+1<=600)
                input(i,j+1)=input(i,j+1)+8/42*temperror;
            end
            if(j+1<=600&&i+1<=400)
                input(i+1,j+1)=input(i+1,j+1)+4/42*temperror;
            end
            if(i+1<=400)
                input(i+1,j)=input(i+1,j)+8/42*temperror;
            end
            if(j-1>=1&&i+1<=400)
                input(i+1,j-1)=input(i+1,j-1)+4/42*temperror;
            end
            if(j+2<=600)
                input(i,j+2)=input(i,j+2)+4/42*temperror;
            end
            if(j+2<=600&&i+1<=400)
                input(i+1,j+2)=input(i+1,j+2)+2/42*temperror;
            end
            if(j+2<=600&&i+2<=400)
                input(i+2,j+2)=input(i+2,j+2)+1/42*temperror;
            end
            if(j+1<=600&&i+2<=400)
                input(i+2,j+1)=input(i+2,j+1)+2/42*temperror;
            end
            if(i+2<=400)
                input(i+2,j)=input(i+2,j)+4/42*temperror;
            end
            if(j-1>=1&&i+2<=400)
                input(i+2,j-1)=input(i+2,j-1)+2/42*temperror;
            end
            if(j-2>=1&&i+2<=400)
                input(i+2,j-2)=input(i+2,j-2)+1/42*temperror;
            end
            if(j-2>=1&&i+1<=400)
                input(i+1,j-2)=input(i+1,j-2)+2/42*temperror;
            end
        end
    else
        for j=600:-1:1
            if(input(i,j)>=127)
                out7(i,j)=1;
                temperror=input(i,j)-255;
            else
                out7(i,j)=0;
                temperror=input(i,j);
            end
            if(j-1>=1)
                input(i,j-1)=input(i,j-1)+8/42*temperror;
            end
            if(j+1<=600&&i+1<=400)
                input(i+1,j+1)=input(i+1,j+1)+4/42*temperror;
            end
            if(i+1<=400)
                input(i+1,j)=input(i+1,j)+8/42*temperror;
            end
            if(j-1>=1&&i+1<=400)
                input(i+1,j-1)=input(i+1,j-1)+4/42*temperror;
            end
            if(j-2>=1)
                input(i,j-2)=input(i,j-2)+4/42*temperror;
            end
            if(j+2<=600&&i+1<=400)
                input(i+1,j+2)=input(i+1,j+2)+2/42*temperror;
            end
            if(j+2<=600&&i+2<=400)
                input(i+2,j+2)=input(i+2,j+2)+1/42*temperror;
            end
            if(j+1<=600&&i+2<=400)
                input(i+2,j+1)=input(i+2,j+1)+2/42*temperror;
            end
            if(i+2<=400)
                input(i+2,j)=input(i+2,j)+4/42*temperror;
            end
            if(j-1>=1&&i+2<=400)
                input(i+2,j-1)=input(i+2,j-1)+2/42*temperror;
            end
            if(j-2>=1&&i+2<=400)
                input(i+2,j-2)=input(i+2,j-2)+1/42*temperror;
            end
            if(j-2>=1&&i+1<=400)
                input(i+1,j-2)=input(i+1,j-2)+2/42*temperror;
            end
        end
    end
end
figure(9);
imshow(out7);

%%
%Part c
file = fopen('bird.raw','r');
rgbImage = fread(file,'*uint8');
redCh = reshape(rgbImage(1:3:end), [500,375]);
greenCh = reshape(rgbImage(2:3:end), [500,375]);
blueCh = reshape(rgbImage(3:3:end), [500,375]);
redCh=redCh';greenCh=greenCh';blueCh=blueCh';
Image= cat(3,redCh, greenCh, blueCh);
figure(10);
imshow(Image);
c=zeros(375,500);
m=zeros(375,500);
y=zeros(375,500);
for i=1:375
    for j=1:500
        c(i,j)=255-redCh(i,j);
    end
end
for i=1:375
    for j=1:500
        m(i,j)=255-greenCh(i,j);
    end
end
for i=1:375
    for j=1:500
        y(i,j)=255-blueCh(i,j);
    end
end

newc=diffuse_error(c);
newm=diffuse_error(m);
newy=diffuse_error(y);

r=zeros(375,500);
g=zeros(375,500);
b=zeros(375,500);
for i=1:375
    for j=1:500
        r(i,j)=1-newc(i,j);
    end
end
for i=1:375
    for j=1:500
        g(i,j)=1-newm(i,j);
    end
end
for i=1:375
    for j=1:500
        b(i,j)=1-newy(i,j);
    end
end
out8= cat(3,r, g, b);
figure(11);
imshow(out8);

%MBVQ Method


out9=zeros(375,500,3);
Image0=zeros(375,500,3);
for i=1:375
    for j=1:500
        Image0(i,j,:)=Image(i,j,:);
    end
end

for i=1:375
    if(mod(i,2)==1)
        for j=1:500
            quadrant=MBVQ(Image0(i,j,1),Image0(i,j,2),Image0(i,j,3));
            Nearestv=getNearestVertex(quadrant,Image0(i,j,1)/255,Image0(i,j,2)/255,Image0(i,j,3)/255);
            if(strcmp(Nearestv,'white'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=1;
                out9(i,j,2)=1;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'yellow'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3);
                out9(i,j,1)=1;
                out9(i,j,2)=1;
                out9(i,j,3)=0;
            elseif(strcmp(Nearestv,'magenta'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=1;
                out9(i,j,2)=0;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'cyan'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=0;
                out9(i,j,2)=1;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'green'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3);
                out9(i,j,1)=0;
                out9(i,j,2)=1;
                out9(i,j,3)=0;
            elseif(strcmp(Nearestv,'red'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3);
                out9(i,j,1)=1;
                out9(i,j,2)=0;
                out9(i,j,3)=0;
            elseif(strcmp(Nearestv,'blue'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=0;
                out9(i,j,2)=0;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'black'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3);
                out9(i,j,1)=0;
                out9(i,j,2)=0;
                out9(i,j,3)=0;
            end%Now diffuse error
            if(j+1<=500)
                Image0(i,j+1,1)=Image0(i,j+1,1)+7/16*rerror;
            end
            if(j+1<=500&&i+1<=375)
                Image0(i+1,j+1,1)=Image0(i+1,j+1,1)+1/16*rerror;
            end
            if(i+1<=375)
                Image0(i+1,j,1)=Image0(i+1,j,1)+5/16*rerror;
            end
            if(j-1>=1&&i+1<=375)
                Image0(i+1,j-1,1)=Image0(i+1,j-1,1)+3/16*rerror;
            end
            %green chanel
            if(j+1<=500)
                Image0(i,j+1,2)=Image0(i,j+1,2)+7/16*gerror;
            end
            if(j+1<=500&&i+1<=375)
                Image0(i+1,j+1,2)=Image0(i+1,j+1,2)+1/16*gerror;
            end
            if(i+1<=375)
                Image0(i+1,j,2)=Image0(i+1,j,2)+5/16*gerror;
            end
            if(j-1>=1&&i+1<=375)
                Image0(i+1,j-1,2)=Image0(i+1,j-1,2)+3/16*gerror;
            end
            %blue chacel
            if(j+1<=50)
                Image0(i,j+1,3)=Image0(i,j+1,3)+7/16*berror;
            end
            if(j+1<=500&&i+1<=375)
                Image0(i+1,j+1,3)=Image0(i+1,j+1,3)+1/16*berror;
            end
            if(i+1<=375)
                Image0(i+1,j,3)=Image0(i+1,j,3)+5/16*berror;
            end
            if(j-1>=1&&i+1<=375)
                Image0(i+1,j-1,3)=Image0(i+1,j-1,3)+3/16*berror;
            end
            
        end
    else
        for j=500:-1:1
            quadrant=MBVQ(Image0(i,j,1),Image0(i,j,2),Image0(i,j,3));
            Nearestv=getNearestVertex(quadrant,Image0(i,j,1)/255,Image0(i,j,2)/255,Image0(i,j,3)/255);
            if(strcmp(Nearestv,'white'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=1;
                out9(i,j,2)=1;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'yellow'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3);
                out9(i,j,1)=1;
                out9(i,j,2)=1;
                out9(i,j,3)=0;
            elseif(strcmp(Nearestv,'magenta'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=1;
                out9(i,j,2)=0;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'cyan'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=0;
                out9(i,j,2)=1;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'green'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2)-255;
                berror=Image0(i,j,3);
                out9(i,j,1)=0;
                out9(i,j,2)=1;
                out9(i,j,3)=0;
            elseif(strcmp(Nearestv,'red'))
                rerror=Image0(i,j,1)-255;
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3);
                out9(i,j,1)=1;
                out9(i,j,2)=0;
                out9(i,j,3)=0;
            elseif(strcmp(Nearestv,'blue'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3)-255;
                out9(i,j,1)=0;
                out9(i,j,2)=0;
                out9(i,j,3)=1;
            elseif(strcmp(Nearestv,'black'))
                rerror=Image0(i,j,1);
                gerror=Image0(i,j,2);
                berror=Image0(i,j,3);
                out9(i,j,1)=0;
                out9(i,j,2)=0;
                out9(i,j,3)=0;
            end%Now diffuse error
            if(j-1>=1)
                Image0(i,j-1,1)=Image0(i,j-1,1)+7/16*rerror;
            end
            if(j-1>=1&&i+1<=375)
                Image0(i+1,j-1,1)=Image0(i+1,j-1,1)+1/16*rerror;
            end
            if(i+1<=375)
                Image0(i+1,j,1)=Image0(i+1,j,1)+5/16*rerror;
            end
            if(j+1<=500&&i+1<=375)
                Image0(i+1,j+1,1)=Image0(i+1,j+1,1)+3/16*rerror;
            end
            %green chanel
            if(j-1>=1)
                Image0(i,j-1,2)=Image0(i,j-1,2)+7/16*gerror;
            end
            if(j-1>=1&&i+1<=375)
                Image0(i+1,j-1,2)=Image0(i+1,j-1,2)+1/16*gerror;
            end
            if(i+1<=375)
                Image0(i+1,j,2)=Image0(i+1,j,2)+5/16*gerror;
            end
            if(j+1<=500&&i+1<=375)
                Image0(i+1,j+1,2)=Image0(i+1,j+1,2)+3/16*gerror;
            end
            %blue chacel
            if(j-1>=1)
                Image0(i,j-1,3)=Image0(i,j-1,3)+7/16*berror;
            end
            if(j-1>=1&&i+1<=375)
                Image0(i+1,j-1,3)=Image0(i+1,j-1,3)+1/16*berror;
            end
            if(i+1<=375)
                Image0(i+1,j,3)=Image0(i+1,j,3)+5/16*berror;
            end
            if(j+1<=500&&i+1<=375)
                Image0(i+1,j+1,3)=Image0(i+1,j+1,3)+3/16*berror;
            end
            
        end
    end
end

figure(12);
imshow(out9);



