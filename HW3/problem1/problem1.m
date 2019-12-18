%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu

%Part a
S1=512;
S2=256;
file= fopen('lighthouse.raw','r');
Data = fread(file,'uint8=>uint8');
Image1 = reshape(Data,S1,S1)';
figure(1);
imshow(Image1);

file= fopen('lighthouse1.raw','r');
Data = fread(file,'uint8=>uint8');
Image2 = reshape(Data,S2,S2)';
figure(2);
imshow(Image2);

file= fopen('lighthouse2.raw','r');
Data = fread(file,'uint8=>uint8');
Image3 = reshape(Data,S2,S2)';
figure(3);
imshow(Image3);

file= fopen('lighthouse3.raw','r');
Data = fread(file,'uint8=>uint8');
Image4 = reshape(Data,S2,S2)';
figure(4);
imshow(Image4);
xindex=zeros(1,12);
yindex=zeros(1,12);
%finding holes in the image
filters=[ [-1 -1 -1 1 1 -1 1 1 -1]; [-1 -1 -1 -1 1 1 -1 1 1];[1 1 -1 1 1 -1 -1 -1 -1];[-1 1 1 -1 1 1 -1 -1 -1]];
k=1;
for i=1:S1
    for j=1:S1
        if(Image1(i,j)==255)
            for f=1:4
                count=0;
                filter0=filters(f,:);
                for m=0:2
                    for n=0:2
                        if(filter0(m*3+n+1)~=-1&&Image1(i-1+m,j-1+n)==255*filter0(m*3+n+1))
                            count=count+1;
                        elseif(filter0(m*3+n+1)==-1&&Image1(i-1+m,j-1+n)~=255)
                            count=count+1;
                        end
                    end
                end
                if(count==9)
                    xindex(k)=i;
                    yindex(k)=j;
                    k=k+1;
                    break;
                end
            end
        end
    end
end
%House fill
xindpic1=zeros(1,4);
yindpic1=zeros(1,4);
for i=1:S2
    for j=1:S2
        if(Image2(i,j)~=255)
            xindpic1(1)=i;
            yindpic1(1)=j;
            break;
        end
    end
    if(xindpic1(1)~=0)
        break;
    end
end
for i=S2:-1:1
    for j=1:S2
        if(Image2(i,j)~=255)
            xindpic1(2)=i;
            yindpic1(2)=j;
            break;
        end
    end
    if(xindpic1(2)~=0)
        break;
    end
end
for j=1:S2
    for i=1:S2
        if(Image2(i,j)~=255)
            xindpic1(3)=i;
            yindpic1(3)=j;
            break;
        end
    end
    if(xindpic1(3)~=0)
        break;
    end
end
for j=S2:-1:1
    for i=1:S2
        if(Image2(i,j)~=255)
            xindpic1(4)=i;
            yindpic1(4)=j;
            break;
        end
    end
    if(xindpic1(4)~=0)
        break;
    end
end
%a=[152 81+1 119+1;150+1 116+2 222-1;1 1 1];
a=[(xindpic1(1)+xindpic1(2)+xindpic1(3)+xindpic1(4))/4 xindpic1(1) xindpic1(4);(yindpic1(1)+yindpic1(2)+yindpic1(3)+yindpic1(4))/4+.5 yindpic1(1)+1 yindpic1(4);1 1 1];
b=[(xindex(4)+xindex(7))/2 xindex(4) xindex(8); (yindex(4)+yindex(7))/2 yindex(4) yindex(8);1 1 1];
c=a/b;
for i=xindex(3):xindex(7)
    for j=yindex(3):yindex(4)
        result=c*[i;j;1];
        Image1(i,j)=Image2(round(result(1)),round(result(2)));
    end
end
for i=xindex(3):xindex(7)
    for j=yindex(3):yindex(4)
        if(i==xindex(3)&&Image1(i,j)>=100)
            Image1(i,j)=Image1(i-1,j);
            Image1(i+1,j)=Image1(i+2,j);
        elseif(i==xindex(7))
            Image1(i,j)=Image1(i+1,j);
        elseif(j==yindex(4))
            Image1(i,j)=Image1(i,j+1);
        end
    end
end
figure(5)
imshow(Image1);

%lighthouse
xindpic1=zeros(1,4);
yindpic1=zeros(1,4);
for i=1:S2
    for j=1:S2
        if(Image3(i,j)~=255)
            xindpic1(1)=i;
            yindpic1(1)=j;
            break;
        end
    end
    if(xindpic1(1)~=0)
        break;
    end
end
for i=S2:-1:1
    for j=1:S2
        if(Image3(i,j)~=255)
            xindpic1(2)=i;
            yindpic1(2)=j;
            break;
        end
    end
    if(xindpic1(2)~=0)
        break;
    end
end
for j=1:S2
    for i=1:S2
        if(Image3(i,j)~=255)
            xindpic1(3)=i;
            yindpic1(3)=j;
            break;
        end
    end
    if(xindpic1(3)~=0)
        break;
    end
end
for j=S2:-1:1
    for i=1:S2
        if(Image3(i,j)~=255)
            xindpic1(4)=i;
            yindpic1(4)=j;
            break;
        end
    end
    if(xindpic1(4)~=0)
        break;
    end
end
%a=[152 81+1 119+1;150+1 116+2 222-1;1 1 1];
a=[(xindpic1(1)+xindpic1(2)+xindpic1(3)+xindpic1(4))/4 xindpic1(3) xindpic1(1);(yindpic1(1)+yindpic1(2)+yindpic1(3)+yindpic1(4))/4 yindpic1(3) yindpic1(1);1 1 1];
b=[(xindex(2)+xindex(5))/2 xindex(2) xindex(6); (yindex(2)+yindex(5))/2 yindex(2) yindex(6);1 1 1];
c=a/b;
for i=xindex(1):xindex(5)
    for j=yindex(1):yindex(2)
        result=c*[i;j;1];
        Image1(i,j)=Image3(round(result(1)),round(result(2)));
    end
end
for i=xindex(1):xindex(5)
    for j=yindex(1):yindex(2)
        if(i==xindex(1))
            Image1(i,j)=Image1(i-1,j);
        elseif(i==xindex(5))
            Image1(i,j)=Image1(i+1,j);
        elseif(j==yindex(2))
            Image1(i,j)=Image1(i,j+1);
            Image1(i,j-1)=Image1(i,j-2);
        elseif(j==yindex(1))
            Image1(i,j)=Image1(i,j-1);
        end
    end
end
figure(6)
imshow(Image1);

%rock
xindpic1=zeros(1,4);
yindpic1=zeros(1,4);
for i=1:S2
    for j=1:S2
        if(Image4(i,j)~=255)
            xindpic1(1)=i;
            yindpic1(1)=j;
            break;
        end
    end
    if(xindpic1(1)~=0)
        break;
    end
end
for i=S2:-1:1
    for j=1:S2
        if(Image4(i,j)~=255)
            xindpic1(2)=i;
            yindpic1(2)=j;
            break;
        end
    end
    if(xindpic1(2)~=0)
        break;
    end
end
for j=1:S2
    for i=1:S2
        if(Image4(i,j)~=255)
            xindpic1(3)=i;
            yindpic1(3)=j;
            break;
        end
    end
    if(xindpic1(3)~=0)
        break;
    end
end
for j=S2:-1:1
    for i=1:S2
        if(Image4(i,j)~=255)
            xindpic1(4)=i;
            yindpic1(4)=j;
            break;
        end
    end
    if(xindpic1(4)~=0)
        break;
    end
end
%a=[152 81+1 119+1;150+1 116+2 222-1;1 1 1];
a=[(xindpic1(1)+xindpic1(2)+xindpic1(3)+xindpic1(4))/4 xindpic1(4) xindpic1(2)-2;(yindpic1(1)+yindpic1(2)+yindpic1(3)+yindpic1(4))/4+1 yindpic1(4) yindpic1(2);1 1 1];
b=[(xindex(10)+xindex(11))/2 xindex(10) xindex(12); (yindex(10)+yindex(11))/2 yindex(10) yindex(12);1 1 1];
c=a/b;
for i=xindex(9):xindex(11)
    for j=yindex(9):yindex(10)
        result=c*[i;j;1];
        Image1(i,j)=Image4(round(result(1)),round(result(2)));
    end
end
for i=xindex(9):xindex(11)
    for j=yindex(9):yindex(10)
        if(i==xindex(9))
            Image1(i,j)=Image1(i-1,j);
        elseif(j==yindex(9))
            Image1(i,j)=Image1(i,j-1);
        end
    end
end
figure(8)
imshow(Image1);
%%
%Part b
S=512;
file= fopen('hat.raw','r');
Data = fread(file,'uint8=>uint8');
Image1 = reshape(Data,S,S)';
figure(1);
imshow(Image1);
output=zeros(512,512);
a=[256 128 1 256 512 384;256 384 512 384 512 384];
b=[1 1 1 1 1 1;256 128 1 256 512 384;256 384 512 512 512 384;256^2 128^2 1^2 256^2 512^2 384^2;256^2 128*384 512 256*512 512*512 384^2;256^2 384^2 512^2 512^2 512^2 384^2];
c=a/b;
for i=1:512
    for j=256:512
        if((i<=256&&(j-256)>=256-i)||(i>256&&j>=i))
            m=c*[1;i;j;i^2;j*i;j^2];
            output(round(m(1)),round(m(2)))=Image1(i,j);
        end
    end
end

a=[256 128 1 128 1 128;256 384 512 256 1 128];
b=[1 1 1 1 1 1;256 128 1 1 1 128;256 384 512 256 1 128;256^2 128^2 1^2 1^2 1^2 128^2;256^2 128*384 1*512 256*1 1*1 128^2;256^2 384^2 512^2 256^2 1^2 128^2];
c=a/b;
for i=1:256
    for j=1:512
        if((j<=256&&j>=i)||(j>256&&(j-256)<256-i))
            m=c*[1;i;j;i^2;j*i;j^2];
            output(round(m(1)),round(m(2)))=Image1(i,j);
        end
    end
end

a=[256 1 128 256 512 384;256 1 128 128 1 128];
b=[1 1 1 1 1 1;256 1 128 256 512 384;256 1 128 1 1 128;256^2 1^2 128^2 256^2 512^2 384^2;256^2 1*1 128^2 256 512 384*128;256^2 1^2 128^2 1 1 128^2];
c=a/b;
for i=1:512
    for j=1:256
        if((i<=256&&j<i)||(i>256&&j<=512-i))
            m=c*[1;i;j;i^2;j*i;j^2];
            output(round(m(1)),round(m(2)))=Image1(i,j);
        end
    end
end
a=[256 512 384 512 384 384;256 1 128 512 384 256];
b=[1 1 1 1 1 1;256 512 384 512 384 512;256 1 128 512 384 256;256^2 512^2 384^2 512^2 384^2 512^2;256^2 512 384*128 512*512 384^2 512*256;256^2 1 128^2 512^2 384^2 256^2];
c=a/b;
for i=256:512
    for j=1:512
        if((j<=256&&j>=512-i)||(j>256&&j<i))
            m=c*[1;i;j;i^2;j*i;j^2];
            output(round(m(1)),round(m(2)))=Image1(i,j);
        end
    end
end

figure(2)
imshow(uint8(output));
%%
S2=712;
S1=1072;
file= fopen('classroom.raw','r');
Data = fread(file,'uint8=>uint8');
Image1 = reshape(Data,S1,S2)';
figure(1);
imshow(Image1);

xd=zeros(1072*712,1);
yd=zeros(1072*712,1);
b=zeros(1072*712,3);
k=1;
for v=1:712
    for u=1:1072
        if((v>=20&&v<=100&&u>=50&&u<=200))%||(v>=400&&v<=600&&u>=650&&u<=850))
        r2=((u-536)/600)^2+((u-356)/600)^2;
        xd(k)=((u-536)/600)*(1-0.3536*r2+0.173*(r2^2));
        yd(k)=((v-356)/600)*(1-0.3536*r2+0.173*(r2^2));
        b(k,1)=1;
        b(k,2)=(u-536)/600;%(v-1)*1072+u
        b(k,3)=(v-356)/600;
        k=k+1;
        end
    end
end
a1=pinv(b(1:k-1,:))*xd(1:k-1);
a2=pinv(b(1:k-1,:))*yd(1:k-1);
a3=[a1,a2];
invmat=inv(a3(2:3,:));
uvimage=zeros(712,1072);

for v=1:712
    for u=1:1072
        r2=((u-536)/600)^2+((u-356)/600)^2;
        xd1=(u-536)/600;
        yd1=(v-356)/600;
        xy=[1,xd1,yd1]*(a3);
        x=xy(1)*600+536;
        y=xy(2)*600+356;
        if(round(x)>=1&&round(x)<=1072&&round(y)>=1&&round(y)<=712)
            uvimage(v,u)=Image1(round(y),round(x));
        end
    end
end
figure(2);
imshow(uint8(uvimage));

% uvimage=zeros(712,1072);
% for v=1:712
%     for u=1:1072
%         r2=((u-536)/600)^2+((u-356)/600)^2;
%         xd1=(u-536)/600;
%         yd1=(v-356)/600;
%         xy=[xd1-a3(1,1),yd1-a3(1,2)]*inv(a3(2:3,:));
%         x=xy(1)*600+536;
%         y=xy(2)*600+356;
%         if(round(x)>=1&&round(x)<=1072&&round(y)>=1&&round(y)<=712)
%             uvimage(round(y),round(x))=Image1(v,u);
%         end
%     end
% end
% figure(3);
% imshow(uint8(uvimage));