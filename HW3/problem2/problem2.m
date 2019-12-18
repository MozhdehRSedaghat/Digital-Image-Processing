%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu

%Part a

s=  [[0,0,1,0,1,0,0,0,0];[1,0,0,0,1,0,0,0,0];[0,0,0,0,1,0,1,0,0];[0,0,0,0,1,0,0,0,1];
	[0,0,0,0,1,1,0,0,0];[0,1,0,0,1,0,0,0,0];[0,0,0,1,1,0,0,0,0];[0,0,0,0,1,0,0,1,0];
	[0,0,1,0,1,1,0,0,0];[0,1,1,0,1,0,0,0,0];[1,1,0,0,1,0,0,0,0];[1,0,0,1,1,0,0,0,0];
	[0,0,0,1,1,0,1,0,0];[0,0,0,0,1,0,1,1,0];[0,0,0,0,1,0,0,1,1];[0,0,0,0,1,1,0,0,1];
	[0,0,1,0,1,1,0,0,1];[1,1,1,0,1,0,0,0,0];[1,0,0,1,1,0,1,0,0];[0,0,0,0,1,0,1,1,1];
	[1,1,0,0,1,1,0,0,0];[0,1,0,0,1,1,0,0,1];[0,1,1,1,1,0,0,0,0];[0,0,1,0,1,1,0,1,0];
	[0,1,1,0,1,1,0,0,0];[1,1,0,1,1,0,0,0,0];[0,0,0,1,1,0,1,1,0];[0,0,0,0,1,1,0,1,1];
	[1,1,0,0,1,1,0,0,1];[0,1,1,1,1,0,1,0,0];[1,1,1,0,1,1,0,0,0];[0,1,1,0,1,1,0,0,1];
    [1,1,1,1,1,0,0,0,0];[1,1,0,1,1,0,1,0,0];[1,0,0,1,1,0,1,1,0];[0,0,0,1,1,0,1,1,1];
    [0,0,0,0,1,1,1,1,1];[0,0,1,0,1,1,0,1,1];[1,1,1,0,1,1,0,0,1];[1,1,1,1,1,0,1,0,0];
    [1,0,0,1,1,0,1,1,1];[0,0,1,0,1,1,1,1,1];[0,1,1,0,1,1,0,1,1];[1,1,1,1,1,1,0,0,0];
    [1,1,0,1,1,0,1,1,0];[0,0,0,1,1,1,1,1,1];[1,1,1,0,1,1,0,1,1];[0,1,1,0,1,1,1,1,1];
    [1,1,1,1,1,1,1,0,0];[1,1,1,1,1,1,0,0,1];[1,1,1,1,1,0,1,1,0];[1,1,0,1,1,0,1,1,1];
    [1,0,0,1,1,1,1,1,1];[0,0,1,1,1,1,1,1,1];[1,1,1,0,1,1,1,1,1];[1,1,1,1,1,1,1,0,1];
    [1,1,1,1,1,0,1,1,1];[1,0,1,1,1,1,1,1,1]];
t=  [[0,1,0,0,1,1,0,0,0];[0,1,0,1,1,0,0,0,0];[0,0,0,1,1,0,0,1,0];[0,0,0,0,1,1,0,1,0];
	[0,0,1,0,1,1,0,0,1];[1,1,1,0,1,0,0,0,0];[1,0,0,1,1,0,1,0,0];[0,0,0,0,1,0,1,1,1];
	[1,1,0,0,1,1,0,0,0];[0,1,0,0,1,1,0,0,1];[0,1,1,1,1,0,0,0,0];[0,0,1,0,1,1,0,1,0];
	[0,1,1,0,1,1,0,0,0];[1,1,0,1,1,0,0,0,0];[0,0,0,1,1,0,1,1,0];[0,0,0,0,1,1,0,1,1];
	[1,1,0,0,1,1,0,0,1];[0,1,1,1,1,0,1,0,0];[1,1,1,0,1,1,0,0,0];[0,1,1,0,1,1,0,0,1];
    [1,1,1,1,1,0,0,0,0];[1,1,0,1,1,0,1,0,0];[1,0,0,1,1,0,1,1,0];[0,0,0,1,1,0,1,1,1];
    [0,0,0,0,1,1,1,1,1];[0,0,1,0,1,1,0,1,1];[1,1,1,0,1,1,0,0,1];[1,1,1,1,1,0,1,0,0];
    [1,0,0,1,1,0,1,1,1];[0,0,1,0,1,1,1,1,1];[0,1,1,0,1,1,0,1,1];[1,1,1,1,1,1,0,0,0];
    [1,1,0,1,1,0,1,1,0];[0,0,0,1,1,1,1,1,1];[1,1,1,0,1,1,0,1,1];[0,1,1,0,1,1,1,1,1];
    [1,1,1,1,1,1,1,0,0];[1,1,1,1,1,1,0,0,1];[1,1,1,1,1,0,1,1,0];[1,1,0,1,1,0,1,1,1];
    [1,0,0,1,1,1,1,1,1];[0,0,1,1,1,1,1,1,1];[1,1,1,0,1,1,1,1,1];[1,1,1,1,1,1,1,0,1];
    [1,1,1,1,1,0,1,1,1];[1,0,1,1,1,1,1,1,1]];
k=  [[0,1,0,0,1,1,0,0,0];[0,1,0,1,1,0,0,0,0];[0,0,0,1,1,0,0,1,0];[0,0,0,0,1,1,0,1,0];
	[0,0,1,0,1,1,0,0,1];[1,1,1,0,1,0,0,0,0];[1,0,0,1,1,0,1,0,0];[0,0,0,0,1,0,1,1,1];
	[1,1,1,0,1,1,0,0,0];[0,1,1,0,1,1,0,0,1];[1,1,1,1,1,0,0,0,0];[1,1,0,1,1,0,1,0,0];
	[1,0,0,1,1,0,1,1,0];[0,0,0,1,1,0,1,1,1];[0,0,0,0,1,1,1,1,1];[0,0,1,0,1,1,0,1,1];
	[1,1,1,0,1,1,0,0,1];[1,1,1,1,1,0,1,0,0];[1,0,0,1,1,0,1,1,1];[0,0,1,0,1,1,1,1,1];
	[0,1,1,0,1,1,0,1,1];[1,1,1,1,1,1,0,0,0];[1,1,0,1,1,0,1,1,0];[0,0,0,1,1,1,1,1,1];
	[1,1,1,0,1,1,0,1,1];[0,1,1,0,1,1,1,1,1];[1,1,1,1,1,1,1,0,0];[1,1,1,1,1,1,0,0,1];
	[1,1,1,1,1,0,1,1,0];[1,1,0,1,1,0,1,1,1];[1,0,0,1,1,1,1,1,1];[0,0,1,1,1,1,1,1,1];
	[1,1,1,0,1,1,1,1,1];[1,1,1,1,1,1,1,0,1];[1,1,1,1,1,0,1,1,1];[1,0,1,1,1,1,1,1,1];
	[1,1,1,1,1,1,0,1,1];[1,1,1,1,1,1,1,1,0];[1,1,0,1,1,1,1,1,1];[0,1,1,1,1,1,1,1,1]];
ms=[[0,0,1,0,1,0,0,0,0];[1,0,0,0,1,0,0,0,0];[0,0,0,0,1,0,0,1,0];[0,0,0,0,1,1,0,0,0];
	[0,1,1,1,1,0,0,0,0];[1,1,0,0,1,1,0,0,0];[0,1,0,0,1,1,0,0,1];[0,0,1,0,1,1,0,1,0];
	[0,2,1,0,1,2,1,0,0];[1,2,0,2,1,0,0,0,1];[0,0,1,2,1,0,1,2,0];[1,0,0,0,1,2,0,2,1];
	[1,1,-1,1,1,-1,-1,-1,-1];[-1,1,0,1,1,1,-1,0,0];[0,1,-1,1,1,1,0,0,-1];[0,0,-1,1,1,1,0,1,-1];
    [-1,0,0,1,1,1,-1,1,0];[-1,1,-1,1,1,0,0,1,0];[0,1,0,1,1,0,-1,1,-1];[0,1,0,0,1,1,-1,1,-1];
    [-1,1,-1,0,1,1,0,1,0];[1,-1,1,-1,1,-1,2,2,2];[1,-1,2,-1,1,2,1,-1,2];[2,2,2,-1,1,-1,1,-1,1];
    [2,-1,1,2,1,-1,2,-1,1];[-1,1,0,0,1,1,1,0,-1];[0,1,-1,1,1,0,-1,0,1];[-1,0,1,1,1,0,0,1,-1];
    [1,0,-1,0,1,1,-1,1,0]];
mt=[[0,0,1,0,1,0,0,0,0];[1,0,0,0,1,0,0,0,0];[0,0,0,0,1,0,0,1,0];[0,0,0,0,1,1,0,0,0];
	[0,0,1,0,1,1,0,0,0];[0,1,1,0,1,0,0,0,0];[1,1,0,0,1,0,0,0,0];[1,0,0,1,1,0,0,0,0];
	[0,0,0,1,1,0,1,0,0];[0,0,0,0,1,0,1,1,0];[0,0,0,0,1,0,0,1,1];[0,0,0,0,1,1,0,0,1];
	[0,1,1,1,1,0,0,0,0];[1,1,0,0,1,1,0,0,0];[0,1,0,0,1,1,0,0,1];[0,0,1,0,1,1,0,1,0];
	[0,2,1,0,1,2,1,0,0];[1,2,0,2,1,0,0,0,1];[0,0,1,2,1,0,1,2,0];[1,0,0,0,1,2,0,2,1];
	[1,1,-1,1,1,-1,-1,-1,-1];[-1,1,0,1,1,1,-1,0,0];[0,1,-1,1,1,1,0,0,-1];[0,0,-1,1,1,1,0,1,-1];
    [-1,0,0,1,1,1,-1,1,0];[-1,1,-1,1,1,0,0,1,0];[0,1,0,1,1,0,-1,1,-1];[0,1,0,0,1,1,-1,1,-1];
    [-1,1,-1,0,1,1,0,1,0];[1,-1,1,-1,1,-1,2,2,2];[1,-1,2,-1,1,2,1,-1,2];[2,2,2,-1,1,-1,1,-1,1];
    [2,-1,1,2,1,-1,2,-1,1];[-1,1,0,0,1,1,1,0,-1];[0,1,-1,1,1,0,-1,0,1];[-1,0,1,1,1,0,0,1,-1];
    [1,0,-1,0,1,1,-1,1,0]];
mk=[[0,0,0,0,1,0,0,0,1];[0,0,0,0,1,0,1,0,0];[0,0,1,0,1,0,0,0,0];[1,0,0,0,1,0,0,0,0];
	[0,0,0,0,1,0,0,1,0];[0,0,0,0,1,1,0,0,0];[0,0,0,1,1,0,0,0,0];[0,1,0,0,1,0,0,0,0];
	[0,1,0,0,1,1,0,0,0];[0,1,0,1,1,0,0,0,0];[0,0,0,0,1,1,0,1,0];[0,0,0,1,1,0,0,1,0];
	[1,1,-1,1,1,-1,-1,-1,-1];[-1,-1,-1,-1,1,1,-1,1,1];[-1,1,-1,1,1,1,-1,-1,-1];[-1,1,-1,1,1,-1,-1,1,-1];
    [-1,-1,-1,1,1,1,-1,1,-1];[-1,1,-1,-1,1,1,-1,1,-1];[1,-1,1,-1,1,-1,2,2,2];[1,-1,2,-1,1,2,1,-1,2];
    [2,2,2,-1,1,-1,1,-1,1];[2,-1,1,2,1,-1,2,-1,1];[-1,1,0,0,1,1,1,0,-1];[0,1,-1,1,1,0,-1,0,1];
    [-1,0,1,1,1,0,0,1,-1];[1,0,-1,0,1,1,-1,1,0]];

Size=375;
file= fopen('pattern1.raw','r');
Data = fread(file,'uint8=>uint8');
Image1 = reshape(Data,Size,Size)';
figure(1);
imshow(Image1);
file= fopen('pattern2.raw','r');
Data = fread(file,'uint8=>uint8');
Image2 = reshape(Data,Size,Size)';
figure(2);
imshow(Image2);
file= fopen('pattern3.raw','r');
Data = fread(file,'uint8=>uint8');
Image3 = reshape(Data,Size,Size)';
figure(3);
imshow(Image3);
file= fopen('pattern4.raw','r');
Data = fread(file,'uint8=>uint8');
Image4 = reshape(Data,Size,Size)';
figure(4);
imshow(Image4);

%shrinking
for im=1:4
    if(im==1)
        out1=Image1/255;
    elseif (im==2)
        out1=Image2/255;
    elseif (im==3)
        out1=Image3/255;   
    elseif (im==4)
        out1=Image4/255;
    end
    change=1;
    while change==1
%    for iteration=0:160
        marray=zeros(Size,Size);
        count=0;
        change=0;
        for i=2:Size-1
            for j=2:Size-1
                if(out1(i,j)==1)
                    %checking bond
                    bond=2*(out1(i-1,j)+out1(i+1,j)+out1(i,j-1)+out1(i,j+1))+(out1(i-1,j-1)+out1(i+1,j+1)+out1(i+1,j-1)+out1(i-1,j+1));
                    if(bond>=1&&bond<=10)
                        %first stage
                        for f=1:58
                            filter0=s(f,:);
                            for m=0:2
                                for n=0:2
                                    if(out1(i-1+m,j-1+n)==filter0(m*3+n+1))
                                        count=count+1;
                                    end   
                                end
                            end
                            if(count==9)
                                marray(i,j)=1;
                                count=0;
                                break;
                            end
                            count=0;
                        end
                    end
                end
            end
        end
        for i=2:Size-1
            for j=2:Size-1
                if(marray(i,j)==1)%second stage
                    hit=0;
                    for f=1:29
                            filter0=ms(f,:);
                            count=0;
                            countor=0;
                            orvalidatin=0;
                            for m=0:2
                                for n=0:2
                                    if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                        count=count+1;
                                    elseif(filter0(m*3+n+1)==2)
                                        countor=countor+1; 
                                        if(marray(i-1+m,j-1+n)==1)
                                            orvalidatin=1;
                                        end
                                    end
                                end
                            end
                            if(count==9-countor&&(countor==0||orvalidatin==1))
                                hit=1;
                                break;
                            end
                    end
                    if(hit==0)
                        out1(i,j)=0;
                        change=1;
                    end
                end
            end
        end

    end
    if(im==1)
        figure(5);
        imshow(255*out1);
    elseif (im==2)
        figure(6);
        imshow(255*out1);
    elseif (im==3)
        figure(7);
        imshow(255*out1);   
    elseif (im==4)
        figure(8);
        imshow(255*out1);
    end
end

%thining
for im=1:4
    if(im==1)
        out2=Image1/255;
    elseif (im==2)
        out2=Image2/255;
    elseif (im==3)
        out2=Image3/255;   
    elseif (im==4)
        out2=Image4/255;
    end
    change=1;
    while change==1
%   for iteration=0:160
        marray=zeros(Size,Size);
        count=0;
        change=0;
        for i=2:Size-1
            for j=2:Size-1
                if(out2(i,j)==1)
                    %checking bond
                    bond=2*(out2(i-1,j)+out2(i+1,j)+out2(i,j-1)+out2(i,j+1))+(out2(i-1,j-1)+out2(i+1,j+1)+out2(i+1,j-1)+out2(i-1,j+1));
                    if(bond>=4&&bond<=10)
                        %first stage
                        for f=1:46
                            filter0=t(f,:);
                            for m=0:2
                                for n=0:2
                                    if(out2(i-1+m,j-1+n)==filter0(m*3+n+1))
                                        count=count+1;
                                    end   
                                end
                            end
                            if(count==9)
                                marray(i,j)=1;
                                count=0;
                                break;
                            end
                            count=0;
                        end
                    end
                end
            end
        end
        for i=2:Size-1
            for j=2:Size-1
                if(marray(i,j)==1)%second stage
                    hit=0;
                    for f=1:37
                            filter0=mt(f,:);
                            count=0;
                            countor=0;
                            orvalidatin=0;
                            for m=0:2
                                for n=0:2
                                    if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                        count=count+1;
                                    elseif(filter0(m*3+n+1)==2)
                                        countor=countor+1; 
                                        if(marray(i-1+m,j-1+n)==1)
                                            orvalidatin=1;
                                        end
                                    end
                                end
                            end
                            if(count==9-countor&&(countor==0||orvalidatin==1))
                                hit=1;
                                break;
                            end
                    end
                    if(hit==0)
                        out2(i,j)=0;
                        change=1;
                    end
                end
            end
        end

    end
    if(im==1)
        figure(9);
        imshow(255*out2);
    elseif (im==2)
        figure(10);
        imshow(255*out2);
    elseif (im==3)
        figure(11);
        imshow(255*out2);   
    elseif (im==4)
        figure(12);
        imshow(255*out2);
    end
end

%skeletonizing
for im=1:4
    if(im==1)
        out3=Image1/255;
    elseif (im==2)
        out3=Image2/255;
    elseif (im==3)
        out3=Image3/255;   
    elseif (im==4)
        out3=Image4/255;
    end
    change=1;
    while change==1
%   for iteration=0:160
        marray=zeros(Size,Size);
        count=0;
        change=0;
        for i=2:Size-1
            for j=2:Size-1
                if(out3(i,j)==1)
                    %checking bond
                    bond=2*(out3(i-1,j)+out3(i+1,j)+out3(i,j-1)+out3(i,j+1))+(out3(i-1,j-1)+out3(i+1,j+1)+out3(i+1,j-1)+out3(i-1,j+1));
                    if(bond>=4&&bond<=11&&bond~=5)
                        %first stage
                        for f=1:40
                            filter0=t(f,:);
                            for k=0:2
                                for n=0:2
                                    if(out3(i-1+m,j-1+n)==filter0(m*3+n+1))
                                        count=count+1;
                                    end   
                                end
                            end
                            if(count==9)
                                marray(i,j)=1;
                                count=0;
                                break;
                            end
                            count=0;
                        end
                    end
                end
            end
        end
        for i=2:Size-1
            for j=2:Size-1
                if(marray(i,j)==1)%second stage
                    hit=0;
                    for f=1:26
                            filter0=mk(f,:);
                            count=0;
                            countor=0;
                            orvalidatin=0;
                            for m=0:2
                                for n=0:2
                                    if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                        count=count+1;
                                    elseif(filter0(m*3+n+1)==2)
                                        countor=countor+1; 
                                        if(marray(i-1+m,j-1+n)==1)
                                            orvalidatin=1;
                                        end
                                    end
                                end
                            end
                            if(count==9-countor&&(countor==0||orvalidatin==1))
                                hit=1;
                                break;
                            end
                    end
                    if(hit==0)
                        out3(i,j)=0;
                        change=1;
                    end
                end
            end
        end

    end
    
    %BRIDGING
    for i=2:Size-1
            for j=2:Size-1
                L1=~out3(i,j)&~out3(i,j+1)&out3(i-1,j+1)&~out3(i-1,j)&out3(i-1,j-1)&~out3(i,j-1)&~out3(i+1,j-1)&~out3(i+1,j)&~out3(i+1,j+1);
                L2=~out3(i,j)&~out3(i,j+1)&~out3(i-1,j+1)&~out3(i-1,j)&out3(i-1,j-1)&~out3(i,j-1)&out3(i+1,j-1)&~out3(i+1,j)&~out3(i+1,j+1);
                L3=~out3(i,j)&~out3(i,j+1)&~out3(i-1,j+1)&~out3(i-1,j)&~out3(i-1,j-1)&~out3(i,j-1)&out3(i+1,j-1)&~out3(i+1,j)&out3(i+1,j+1);
                L4=~out3(i,j)&~out3(i,j+1)&out3(i-1,j+1)&~out3(i-1,j)&~out3(i-1,j-1)&~out3(i,j-1)&~out3(i+1,j-1)&~out3(i+1,j)&out3(i+1,j+1);
                Pq=L1|L2|L3|L4;
                P1=~out3(i-1,j)&~out3(i+1,j)&( out3(i-1,j-1)|out3(i,j-1)|out3(i+1,j-1) )&( out3(i,j+1)|out3(i-1,j+1)|out3(i+1,j+1) )&~Pq;
                P2=~out3(i,j+1)&~out3(i,j-1)&( out3(i-1,j+1)|out3(i-1,j)|out3(i-1,j-1) )&( out3(i+1,j-1)|out3(i+1,j)|out3(i+1,j+1) )&~Pq;
                P3=~out3(i,j+1)&~out3(i+1,j)&out3(i+1,j+1)& (out3(i-1,j)|out3(i-1,j-1)|out3(i,j-1));
                P4=~out3(i,j+1)&~out3(i-1,j)&out3(i-1,j+1)& (out3(i,j-1)|out3(i+1,j-1)|out3(i+1,j));
                P5=~out3(i-1,j)&out3(i-1,j-1)&~out3(i,j-1)& (out3(i,j+1)|out3(i+1,j)|out3(i+1,j+1));
                P6=~out3(i,j-1)&out3(i+1,j-1)&~out3(i+1,j)& (out3(i,j+1)|out3(i-1,j+1)|out3(i-1,j));
                out3(i,j)=out3(i,j)|P1|P2|P3|P4|P5|P6;
            end
    end
   
    
    if(im==1)
        figure(13);
        imshow(255*out3);
    elseif (im==2)
        figure(14);
        imshow(255*out3);
    elseif (im==3)
        figure(15);
        imshow(255*out3);   
    elseif (im==4)
        figure(16);
        imshow(255*out3);
    end
end

%%
%Partb
file= fopen('deer.raw','r');
Data = fread(file,'uint8=>uint8');
Image5 = reshape(Data,550,691)';
figure(17);
imshow(Image5);
filter0=[-1 1 -1 1 0 1 -1 1 -1];
out=Image5;
out2=Image5;
indexi=zeros(10);
indexj=zeros(10);
count=0;
num=0;
for i=2:690
    for j=2:549
        if(out(i,j)==0)
            for m=0:2
                for n=0:2
                    if(filter0(m*3+n+1)==-1||out(i-1+m,j-1+n)/255==filter0(m*3+n+1))
                        count=count+1;
                    end   
                end
            end
            if(count==9)
                num=num+1;
                indexi(num)=i;
                indexj(num)=j;
                out2(i,j)=255;
                for m=0:6
                    for n=0:6
                        if(m==0||n==0||m==6||n==6)
                            out(i-3+m,j-3+n)=50;
                        end
                    end
                end
            end
            count=0;
        end
    end
end
figure(18);
imshow(out);
figure(19);
imshow(out2);

%%
%Part c
s=  [[0,0,1,0,1,0,0,0,0];[1,0,0,0,1,0,0,0,0];[0,0,0,0,1,0,1,0,0];[0,0,0,0,1,0,0,0,1];
	[0,0,0,0,1,1,0,0,0];[0,1,0,0,1,0,0,0,0];[0,0,0,1,1,0,0,0,0];[0,0,0,0,1,0,0,1,0];
	[0,0,1,0,1,1,0,0,0];[0,1,1,0,1,0,0,0,0];[1,1,0,0,1,0,0,0,0];[1,0,0,1,1,0,0,0,0];
	[0,0,0,1,1,0,1,0,0];[0,0,0,0,1,0,1,1,0];[0,0,0,0,1,0,0,1,1];[0,0,0,0,1,1,0,0,1];
	[0,0,1,0,1,1,0,0,1];[1,1,1,0,1,0,0,0,0];[1,0,0,1,1,0,1,0,0];[0,0,0,0,1,0,1,1,1];
	[1,1,0,0,1,1,0,0,0];[0,1,0,0,1,1,0,0,1];[0,1,1,1,1,0,0,0,0];[0,0,1,0,1,1,0,1,0];
	[0,1,1,0,1,1,0,0,0];[1,1,0,1,1,0,0,0,0];[0,0,0,1,1,0,1,1,0];[0,0,0,0,1,1,0,1,1];
	[1,1,0,0,1,1,0,0,1];[0,1,1,1,1,0,1,0,0];[1,1,1,0,1,1,0,0,0];[0,1,1,0,1,1,0,0,1];
    [1,1,1,1,1,0,0,0,0];[1,1,0,1,1,0,1,0,0];[1,0,0,1,1,0,1,1,0];[0,0,0,1,1,0,1,1,1];
    [0,0,0,0,1,1,1,1,1];[0,0,1,0,1,1,0,1,1];[1,1,1,0,1,1,0,0,1];[1,1,1,1,1,0,1,0,0];
    [1,0,0,1,1,0,1,1,1];[0,0,1,0,1,1,1,1,1];[0,1,1,0,1,1,0,1,1];[1,1,1,1,1,1,0,0,0];
    [1,1,0,1,1,0,1,1,0];[0,0,0,1,1,1,1,1,1];[1,1,1,0,1,1,0,1,1];[0,1,1,0,1,1,1,1,1];
    [1,1,1,1,1,1,1,0,0];[1,1,1,1,1,1,0,0,1];[1,1,1,1,1,0,1,1,0];[1,1,0,1,1,0,1,1,1];
    [1,0,0,1,1,1,1,1,1];[0,0,1,1,1,1,1,1,1];[1,1,1,0,1,1,1,1,1];[1,1,1,1,1,1,1,0,1];
    [1,1,1,1,1,0,1,1,1];[1,0,1,1,1,1,1,1,1]];
ms=[[0,0,1,0,1,0,0,0,0];[1,0,0,0,1,0,0,0,0];[0,0,0,0,1,0,0,1,0];[0,0,0,0,1,1,0,0,0];
	[0,1,1,1,1,0,0,0,0];[1,1,0,0,1,1,0,0,0];[0,1,0,0,1,1,0,0,1];[0,0,1,0,1,1,0,1,0];
	[0,2,1,0,1,2,1,0,0];[1,2,0,2,1,0,0,0,1];[0,0,1,2,1,0,1,2,0];[1,0,0,0,1,2,0,2,1];
	[1,1,-1,1,1,-1,-1,-1,-1];[-1,1,0,1,1,1,-1,0,0];[0,1,-1,1,1,1,0,0,-1];[0,0,-1,1,1,1,0,1,-1];
    [-1,0,0,1,1,1,-1,1,0];[-1,1,-1,1,1,0,0,1,0];[0,1,0,1,1,0,-1,1,-1];[0,1,0,0,1,1,-1,1,-1];
    [-1,1,-1,0,1,1,0,1,0];[1,-1,1,-1,1,-1,2,2,2];[1,-1,2,-1,1,2,1,-1,2];[2,2,2,-1,1,-1,1,-1,1];
    [2,-1,1,2,1,-1,2,-1,1];[-1,1,0,0,1,1,1,0,-1];[0,1,-1,1,1,0,-1,0,1];[-1,0,1,1,1,0,0,1,-1];
    [1,0,-1,0,1,1,-1,1,0]];
file = fopen('rice.raw','r');
rgbImage = fread(file,'*uint8');
redCh = reshape(rgbImage(1:3:end), [690,500]);
greenCh = reshape(rgbImage(2:3:end), [690,500]);
blueCh = reshape(rgbImage(3:3:end), [690,500]);
redCh=redCh';greenCh=greenCh';blueCh=blueCh';
Image= cat(3,redCh, greenCh, blueCh);
figure(20);
imshow(Image);
input=zeros(500,690);
for i=1:500
    for j=1:690
        input(i,j)=(redCh(i,j)/3+greenCh(i,j)/3+blueCh(i,j)/3);
    end
end
figure(21);
imshow(uint8(input));
for i=1:500
    for j=1:690
        input(i,j)=(redCh(i,j)/3+greenCh(i,j)/3+blueCh(i,j)/3);
        if(input(i,j)>=67&&input(i,j)<=81)%66
            input(i,j)=0;
        else
            input(i,j)=255;
        end
    end
end
figure(30);
imshow(uint8(input));
%interior fill
for i=2:499
    for j=2:689
        if(input(i-1,j)==255&&input(i+1,j)==255&&input(i,j-1)==255&&input(i,j+1)==255)
        input(i,j)=255;
        end
    end
end
for i=2:499
    for j=2:689
        if(input(i-1,j)==255&&input(i+1,j)==255&&input(i,j-1)==255&&input(i,j+1)==255)
        input(i,j)=255;
        end
    end
end

figure(31);
imshow(uint8(input));

for iteration=0:6
    marray=zeros(500,690);
    count=0;
    for i=2:499
        for j=2:689
            if(input(i,j)/255==1)
                %checking bond
                bond=2*(input(i-1,j)/255+input(i+1,j)/255+input(i,j-1)/255+input(i,j+1)/255)+(input(i-1,j-1)/255+input(i+1,j+1)/255+input(i+1,j-1)/255+input(i-1,j+1)/255);
                if(bond>=1&&bond<=10)
                    %first stage
                    for f=1:58
                        filter0=s(f,:);
                        for m=0:2
                            for n=0:2
                                if(input(i-1+m,j-1+n)/255==filter0(m*3+n+1))
                                    count=count+1;
                                end
                            end
                        end
                        if(count==9)
                            marray(i,j)=1;
                            count=0;
                            break;
                        end
                        count=0;
                    end
                end
            end
        end
    end
    for i=2:499
        for j=2:689
            if(marray(i,j)==1)%second stage
                hit=0;
                for f=1:29
                    filter0=ms(f,:);
                    count=0;
                    countor=0;
                    orvalidatin=0;
                    for m=0:2
                        for n=0:2
                            if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                count=count+1;
                            elseif(filter0(m*3+n+1)==2)
                                countor=countor+1;
                                if(marray(i-1+m,j-1+n)==1)
                                    orvalidatin=1;
                                end
                            end
                        end
                    end
                    if(count==9-countor&&(countor==0||orvalidatin==1))
                        hit=1;
                        break;
                    end
                end
                if(hit==0)
                    input(i,j)=0;
                end
            end
        end
    end
end
%isolated point removal
for i=2:499
    for j=2:689
        if(input(i,j)~=0&&input(i-1,j)==0&&input(i+1,j)==0&&input(i,j-1)==0&&input(i,j+1)==0)
        input(i,j)=0;
        end
    end
end
figure(32);
imshow(uint8(input));

input2=zeros(500,690);
for i=1+4:500-4
    for j=1+4:690-4
        if(input(i,j)==255)
            for m=-4:4
                for n=-4:4
                    input2(i+m,j+n)=255;
                end
            end
        end
    end
end
figure(33);
imshow(uint8(input2));

for iteration=0:30
    marray=zeros(500,690);
    count=0;
    for i=2:499
        for j=2:689
            if(input2(i,j)/255==1)
                %checking bond
                bond=2*(input2(i-1,j)/255+input2(i+1,j)/255+input2(i,j-1)/255+input2(i,j+1)/255)+(input2(i-1,j-1)/255+input2(i+1,j+1)/255+input2(i+1,j-1)/255+input2(i-1,j+1)/255);
                if(bond>=1&&bond<=10)
                    %first stage
                    for f=1:58
                        filter0=s(f,:);
                        for m=0:2
                            for n=0:2
                                if(input2(i-1+m,j-1+n)/255==filter0(m*3+n+1))
                                    count=count+1;
                                end
                            end
                        end
                        if(count==9)
                            marray(i,j)=1;
                            count=0;
                            break;
                        end
                        count=0;
                    end
                end
            end
        end
    end
    for i=2:499
        for j=2:689
            if(marray(i,j)==1)%second stage
                hit=0;
                for f=1:29
                    filter0=ms(f,:);
                    count=0;
                    countor=0;
                    orvalidatin=0;
                    for m=0:2
                        for n=0:2
                            if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                count=count+1;
                            elseif(filter0(m*3+n+1)==2)
                                countor=countor+1;
                                if(marray(i-1+m,j-1+n)==1)
                                    orvalidatin=1;
                                end
                            end
                        end
                    end
                    if(count==9-countor&&(countor==0||orvalidatin==1))
                        hit=1;
                        break;
                    end
                end
                if(hit==0)
                    input2(i,j)=0;
                end
            end
        end
    end
end

figure(34);
imshow(uint8(input2));

countRice=0;
for i=1:500
    for j=1:690
        if(input2(i,j)==255)
            countRice=countRice+1;
        end
    end
end

for iteration=0:7
    marray=zeros(500,690);
    count=0;
    for i=2:499
        for j=2:689
            if(input(i,j)/255==1)
                %checking bond
                bond=2*(input(i-1,j)/255+input(i+1,j)/255+input(i,j-1)/255+input(i,j+1)/255)+(input(i-1,j-1)/255+input(i+1,j+1)/255+input(i+1,j-1)/255+input(i-1,j+1)/255);
                if(bond>=1&&bond<=10)
                    %first stage
                    for f=1:58
                        filter0=s(f,:);
                        for m=0:2
                            for n=0:2
                                if(input(i-1+m,j-1+n)/255==filter0(m*3+n+1))
                                    count=count+1;
                                end
                            end
                        end
                        if(count==9)
                            marray(i,j)=1;
                            count=0;
                            break;
                        end
                        count=0;
                    end
                end
            end
        end
    end
    for i=2:499
        for j=2:689
            if(marray(i,j)==1)%second stage
                hit=0;
                for f=1:29
                    filter0=ms(f,:);
                    count=0;
                    countor=0;
                    orvalidatin=0;
                    for m=0:2
                        for n=0:2
                            if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                count=count+1;
                            elseif(filter0(m*3+n+1)==2)
                                countor=countor+1;
                                if(marray(i-1+m,j-1+n)==1)
                                    orvalidatin=1;
                                end
                            end
                        end
                    end
                    if(count==9-countor&&(countor==0||orvalidatin==1))
                        hit=1;
                        break;
                    end
                end
                if(hit==0)
                    input(i,j)=0;
                end
            end
        end
    end
end

figure(35);
imshow(uint8(input));
for iteration=0:1
    marray=zeros(500,690);
    count=0;
    for i=2:499
        for j=2:689
            if(input(i,j)/255==1)
                %checking bond
                bond=2*(input(i-1,j)/255+input(i+1,j)/255+input(i,j-1)/255+input(i,j+1)/255)+(input(i-1,j-1)/255+input(i+1,j+1)/255+input(i+1,j-1)/255+input(i-1,j+1)/255);
                if(bond>=1&&bond<=10)
                    %first stage
                    for f=1:58
                        filter0=s(f,:);
                        for m=0:2
                            for n=0:2
                                if(input(i-1+m,j-1+n)/255==filter0(m*3+n+1))
                                    count=count+1;
                                end
                            end
                        end
                        if(count==9)
                            marray(i,j)=1;
                            count=0;
                            break;
                        end
                        count=0;
                    end
                end
            end
        end
    end
    for i=2:499
        for j=2:689
            if(marray(i,j)==1)%second stage
                hit=0;
                for f=1:29
                    filter0=ms(f,:);
                    count=0;
                    countor=0;
                    orvalidatin=0;
                    for m=0:2
                        for n=0:2
                            if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                count=count+1;
                            elseif(filter0(m*3+n+1)==2)
                                countor=countor+1;
                                if(marray(i-1+m,j-1+n)==1)
                                    orvalidatin=1;
                                end
                            end
                        end
                    end
                    if(count==9-countor&&(countor==0||orvalidatin==1))
                        hit=1;
                        break;
                    end
                end
                if(hit==0)
                    input(i,j)=0;
                end
            end
        end
    end
end

figure(36);
imshow(uint8(input));
for iteration=0:1
    marray=zeros(500,690);
    count=0;
    for i=2:499
        for j=2:689
            if(input(i,j)/255==1)
                %checking bond
                bond=2*(input(i-1,j)/255+input(i+1,j)/255+input(i,j-1)/255+input(i,j+1)/255)+(input(i-1,j-1)/255+input(i+1,j+1)/255+input(i+1,j-1)/255+input(i-1,j+1)/255);
                if(bond>=1&&bond<=10)
                    %first stage
                    for f=1:58
                        filter0=s(f,:);
                        for m=0:2
                            for n=0:2
                                if(input(i-1+m,j-1+n)/255==filter0(m*3+n+1))
                                    count=count+1;
                                end
                            end
                        end
                        if(count==9)
                            marray(i,j)=1;
                            count=0;
                            break;
                        end
                        count=0;
                    end
                end
            end
        end
    end
    for i=2:499
        for j=2:689
            if(marray(i,j)==1)%second stage
                hit=0;
                for f=1:29
                    filter0=ms(f,:);
                    count=0;
                    countor=0;
                    orvalidatin=0;
                    for m=0:2
                        for n=0:2
                            if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                count=count+1;
                            elseif(filter0(m*3+n+1)==2)
                                countor=countor+1;
                                if(marray(i-1+m,j-1+n)==1)
                                    orvalidatin=1;
                                end
                            end
                        end
                    end
                    if(count==9-countor&&(countor==0||orvalidatin==1))
                        hit=1;
                        break;
                    end
                end
                if(hit==0)
                    input(i,j)=0;
                end
            end
        end
    end
end

figure(37);
imshow(uint8(input));

for iteration=0:5
    marray=zeros(500,690);
    count=0;
    for i=2:499
        for j=2:689
            if(input(i,j)/255==1)
                %checking bond
                bond=2*(input(i-1,j)/255+input(i+1,j)/255+input(i,j-1)/255+input(i,j+1)/255)+(input(i-1,j-1)/255+input(i+1,j+1)/255+input(i+1,j-1)/255+input(i-1,j+1)/255);
                if(bond>=1&&bond<=10)
                    %first stage
                    for f=1:58
                        filter0=s(f,:);
                        for m=0:2
                            for n=0:2
                                if(input(i-1+m,j-1+n)/255==filter0(m*3+n+1))
                                    count=count+1;
                                end
                            end
                        end
                        if(count==9)
                            marray(i,j)=1;
                            count=0;
                            break;
                        end
                        count=0;
                    end
                end
            end
        end
    end
    for i=2:499
        for j=2:689
            if(marray(i,j)==1)%second stage
                hit=0;
                for f=1:29
                    filter0=ms(f,:);
                    count=0;
                    countor=0;
                    orvalidatin=0;
                    for m=0:2
                        for n=0:2
                            if(filter0(m*3+n+1)==-1||marray(i-1+m,j-1+n)==filter0(m*3+n+1))
                                count=count+1;
                            elseif(filter0(m*3+n+1)==2)
                                countor=countor+1;
                                if(marray(i-1+m,j-1+n)==1)
                                    orvalidatin=1;
                                end
                            end
                        end
                    end
                    if(count==9-countor&&(countor==0||orvalidatin==1))
                        hit=1;
                        break;
                    end
                end
                if(hit==0)
                    input(i,j)=0;
                end
            end
        end
    end
end

figure(38);
imshow(uint8(input));

