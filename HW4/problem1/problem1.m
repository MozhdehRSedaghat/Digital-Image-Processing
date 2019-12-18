%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu

%Part a
S=128;
F=25;
N=12;

Img=cell(1,N);
for i=1:N %storing 12 textures
    s=strcat('texture',int2str(i),'.raw');
    file= fopen(s,'r');
    Data = fread(file,'uint8=>uint8');
    Img{i} = reshape(Data,S,S)';
    figure(i);
    Img{i}=imadjust(Img{i});
    imshow(Img{i});
    
end

f2d=cell(1,F);%computing 25 filters
f1d=[1 4 6 4 1;-1 -2 0 2 1;-1 0 2 0 -1;-1 2 0 -2 1; 1 -4 6 -4 1];
for i=1:5
    for j=1:5
        f2d{(i-1)*5+j}=f1d(i,:)'*f1d(j,:);
    end
end

F2=25;
f2d_15=f2d;

% F2=15;
% f2d_15={f2d{1:5},f2d{7:10},f2d{13:15},f2d{19:20},f2d{25}};

data=cell(1,N);
for i=1:N
    data{i}=zeros(S+4,S+4);
end
for k=1:N%image border extension
    for i=1:S
        for j=1:S
            data{k}(i+2,j+2)=Img{k}(i,j);
        end
    end
    for j=1:S
        data{k}(1,j+2)=Img{k}(2,j);
        data{k}(2,j+2)=Img{k}(1,j);
        data{k}(S+3,j+2)=Img{k}(S,j);
        data{k}(S+4,j+2)=Img{k}(S-1,j);
        
        data{k}(j+2,1)=Img{k}(j,2);
        data{k}(j+2,2)=Img{k}(j,1);
        data{k}(j+2,S+3)=Img{k}(j,S);
        data{k}(j+2,S+4)=Img{k}(j,S-1);
    end
    for i=1:2
        for j=1:2
            data{k}(i,j)=Img{k}(1,1);
            data{k}(S+2+i,j)=Img{k}(S,1);
            data{k}(i,S+2+j)=Img{k}(1,S);
            data{k}(S+2+i,S+2+j)=Img{k}(S,S);
        end
    end
end

%decrease mean
for k=1:N
    mean1=sum(sum(data{k}))/((S+4)^2);
    for i=1:S+4
        for j=1:S+4
            data{k}(i,j)=data{k}(i,j)-mean1;
        end
    end
end

res=cell(1,N);
for i=1:N
    res{i}=cell(1,F2);
    for j=1:F2
        res{i}{j}=zeros(S,S);
    end
end

%computing filter responses
for k=1:N%for each image
    for f=1:F2%for each filter
        for i=3:S+2
            for j=3:S+2%for each pixel
                for m=-2:2
                    for n=-2:2
                        res{k}{f}(i-2,j-2)=res{k}{f}(i-2,j-2)+data{k}(i+m,j+n)*f2d_15{f}(m+3,n+3);
                    end
                end
            end
        end
    end
end

aveFeature=zeros(N,F2);

%computing average??????????????????????????????
for k=1:N%for each image
    for f=1:F2%for each filter
        for i=1:S
            for j=1:S%for each pixel
                aveFeature(k,f)=aveFeature(k,f)+res{k}{f}(i,j)^2;
            end
        end
        aveFeature(k,f)=aveFeature(k,f)/(S*S);
    end
end

NormalizedaveFeature=zeros(N,F2);
%normalizing

for k=1:N%for each image
    mea=mean(aveFeature);
    st=std(aveFeature);
    for f=1:F2%for each filter
        NormalizedaveFeature(k,f)=(aveFeature(k,f)-mea(f))/st(f);
    end
end

%Drawing pca components
[U1,S1,V1] = svd(NormalizedaveFeature);
inf3d=U1(:,:)*S1(:,1:3)*[1 0 0 0 0 0 0 0 0 0 0 0;0 1 0 0 0 0 0 0 0 0 0 0 ;0 0 1 0 0 0 0 0 0 0 0 0];
inf3d=inf3d(:,1:3);
figure(13);
plot3(inf3d(:,1),inf3d(:,2),inf3d(:,3),'.','MarkerSize',20);
grid on;

% [coeff, score] = pca(NormalizedaveFeature);
% reducedDimension = coeff(:,1:3);
% reducedData = NormalizedaveFeature * reducedDimension;

%kmeans algorithm for 3d data
K=4;
labels_3d=ones(1,N);
score=0;
for trying=0:10
    %intialization
    center=rand(K,3)*16-8;
    out=ones(1,N);
    %finding the points which belong to each center
    for itr=0:50
        for n=1:N
            minD=100;%A very large num
            class=1;
            for c=1:K
                distance=0;
                for dim=1:3
                    distance=distance+(center(c,dim)-inf3d(n,dim))^2;
                end
                distance=sqrt(distance);
                if(distance<minD)
                    minD=distance;
                    class=c;
                end
            end
            out(n)=class;
        end
        
        %computing new c
        centerp=center;
        for c=1:K
            num=0;
            val=zeros(1,3);
            for n=1:N
                if(out(n)==c)
                    val=val+inf3d(n,:);
                    num=num+1;
                end
            end
            if(num~=0)
                val=val/num;
            end
            center(c,:)=val;
        end
        
        %checking whether we need more iterations
        delta=sum(sum(abs(centerp-center)));
        if(delta<.000001)
            break;
        end
    end
    
    %computing score to see whether we have reached a better clustering
    
    distance=0;
    for c=1:K
        for n=1:N
            if(out(n)==c)
                for dim=1:3
                    distance=distance+(center(c,dim)-inf3d(n,dim))^2;
                end
            end
        end
    end
    if(1/distance>score)
        labels_3d=out;
        score=1/distance;
    end
end

%kmeans algorithm for 25/15d data
inf25d=NormalizedaveFeature;%changed to 15 dim
labels_25d=ones(1,N);
score=0;
for trying=0:10
    %intialization
    center=rand(K,F2)*4-2;
    out=ones(1,N);
    %finding the points which belong to each center
    for itr=0:50
        for n=1:N
            minD=500;%A very large num
            class=1;
            for c=1:K
                distance=0;
                for dim=1:F2
                    distance=distance+(center(c,dim)-inf25d(n,dim))^2;
                end
                distance=sqrt(distance);
                if(distance<minD)
                    minD=distance;
                    class=c;
                end
            end
            out(n)=class;
        end
        
        %computing new c
        centerp=center;
        for c=1:K
            num=0;
            val=zeros(1,F2);
            for n=1:N
                if(out(n)==c)
                    val=val+inf25d(n,:);
                    num=num+1;
                end
            end
            if(num~=0)
                val=val/num;
            end
            center(c,:)=val;
        end
        
        %checking whether we need more iterations
        delta=sum(sum(abs(centerp-center)));
        if(delta<.000001)
            break;
        end
    end
    
    %computing score to see whether we have reached a better clustering
    
    distance=0;
    for c=1:K
        for n=1:N
            if(out(n)==c)
                for dim=1:F2
                    distance=distance+(center(c,dim)-inf25d(n,dim))^2;
                end
            end
        end
    end
    if(1/distance>score)
        labels_25d=out;
        score=1/distance;
    end
end

Intrabyinter=zeros(F2,1);
for f=1:F2
    Intra=0;
    Inter=0;
    for i=1:n
        for j=1:n
            if(labels_25d(i)==labels_25d(j))
                Intra=Intra+(inf25d(i,f)-inf25d(j,f))^2;
            else
                Inter=Inter+(inf25d(i,f)-inf25d(j,f))^2;
            end
        end
    end
    Intrabyinter(f)=Intra/Inter;
end

%%
%Part b
S=510;
F=25;
file= fopen('comb.raw','r');
Data = fread(file,'uint8=>uint8');
Img = reshape(Data,S,S)';
figure(14);
imshow(Img);

f2d=cell(1,F);%computing 25 filters
f1d=[1 4 6 4 1;-1 -2 0 2 1;-1 0 2 0 -1;-1 2 0 -2 1; 1 -4 6 -4 1];
for i=1:5
    for j=1:5
        f2d{(i-1)*5+j}=f1d(i,:)'*f1d(j,:);
    end
end

data=zeros(S+4,S+4);
%image border extension
for i=1:S
    for j=1:S
        data(i+2,j+2)=Img(i,j);
    end
end
for j=1:S
    data(1,j+2)=Img(2,j);
    data(2,j+2)=Img(1,j);
    data(S+3,j+2)=Img(S,j);
    data(S+4,j+2)=Img(S-1,j);
    
    data(j+2,1)=Img(j,2);
    data(j+2,2)=Img(j,1);
    data(j+2,S+3)=Img(j,S);
    data(j+2,S+4)=Img(j,S-1);
end
for i=1:2
    for j=1:2
        data(i,j)=Img(1,1);
        data(S+2+i,j)=Img(S,1);
        data(i,S+2+j)=Img(1,S);
        data(S+2+i,S+2+j)=Img(S,S);
    end
end

res=cell(1,F);
for j=1:F
    res{j}=zeros(S,S);
end

%computing filter responses
for f=1:F%for each filter
    for i=3:S+2
        for j=3:S+2%for each pixel
            for m=-2:2
                for n=-2:2
                    res{f}(i-2,j-2)=res{f}(i-2,j-2)+data(i+m,j+n)*f2d{f}(m+3,n+3);
                end
            end
        end
    end
end
%computing energy
WS=31;
energy=cell(1,F);
for j=1:F
    energy{j}=zeros(S,S);
end
for f=1:F%for each filter
    for i=1:S
        for j=1:S%for each pixel
            num=0;
            for m=-(WS-1)/2:(WS-1)/2
                for n=-(WS-1)/2:(WS-1)/2
                    if(i+m>=1&&j+n>=1&&j+n<=S&&i+m<=S)
                        energy{f}(i,j)=energy{f}(i,j)+res{f}(i+m,j+n)^2;
                        num=num+1;
                    end
                end
            end
            energy{f}(i,j)=energy{f}(i,j)/num;
        end
    end
end
%Normalization
% for f=2:F
%     for i=1:S
%         for j=1:S%for each pixel
%             res{f}(i,j)=res{f}(i,j)/energy{1}(i,j);
%         end
%     end
% end

for f=1:F
    st=std2(energy{f});
    mea=mean(mean(energy{f}));
    for i=1:S
        for j=1:S%for each pixel
            energy{f}(i,j)=(energy{f}(i,j)-mea)/st;
        end
    end
end

K=7;
%kmeans algorithm for 25/15d data
labels_25d=ones(S,S);
score=0;
for trying=0:3
    %intialization
    center=rand(K,F)*4-2;
    out=ones(S,S);
    %finding the points which belong to each center
    for itr=0:50
        for i=1:S
            for j=1:S
                minD=5000;%A very large num
                class=1;
                for c=1:K
                    distance=0;
                    for dim=1:F
                        distance=distance+(center(c,dim)-energy{dim}(i,j))^2;
                    end
                    distance=sqrt(distance);
                    if(distance<minD)
                        minD=distance;
                        class=c;
                    end
                end
                out(i,j)=class;
            end
        end
        
        %computing new c
        centerp=center;
        for c=1:K
            num=0;
            val=zeros(1,F);
            for i=1:S
                for j=1:S
                    if(out(i,j)==c)
                        for f=1:F
                            val(1,f)=val(1,f)+energy{f}(i,j);
                            num=num+1;
                        end
                    end
                end
            end
            if(num~=0)
                val=val/num;
            end
            center(c,:)=val;
        end
        
        %checking whether we need more iterations
        delta=sum(sum(abs(centerp-center)));
        if(delta<.001)
            itr
            delta
            break;
        end
    end
    
    %computing score to see whether we have reached a better clustering
    
    distance=0;
    for c=1:K
        for i=1:S
            for j=1:S
                if(out(n)==c)
                    for dim=1:F
                        distance=distance+(center(c,dim)-energy{dim}(i,j))^2;
                    end
                end
            end
        end
    end
    if(1/distance>score)
        labels_25d=out;
        score=1/distance;
    end
end

output=zeros(S,S);
for i=1:S
    for j=1:S
        if(labels_25d(i,j)==1)
            output(i,j)=0;
        elseif(labels_25d(i,j)==2)
            output(i,j)=42;
        elseif(labels_25d(i,j)==3)
            output(i,j)=84;
        elseif(labels_25d(i,j)==4)
            output(i,j)=126;%130
        elseif(labels_25d(i,j)==5)
            output(i,j)=168;%180
        elseif(labels_25d(i,j)==6)
            output(i,j)=210;
        elseif(labels_25d(i,j)==7)
            output(i,j)=255;%255
        end
    end
end

figure(15);
imshow(uint8(output))
%%
%c
S=510;
F=25;
file= fopen('comb.raw','r');
Data = fread(file,'uint8=>uint8');
Img = reshape(Data,S,S)';
figure(14);
imshow(Img);

f2d=cell(1,F);%computing 25 filters
f1d=[1 4 6 4 1;-1 -2 0 2 1;-1 0 2 0 -1;-1 2 0 -2 1; 1 -4 6 -4 1];
for i=1:5
    for j=1:5
        f2d{(i-1)*5+j}=f1d(i,:)'*f1d(j,:);
    end
end

% %using 15 filters
% F=15;
% f2d={f2d{1:5},f2d{7:10},f2d{13:15},f2d{19:20},f2d{25}};

data=zeros(S+4,S+4);
%image border extension
for i=1:S
    for j=1:S
        data(i+2,j+2)=Img(i,j);
    end
end
for j=1:S
    data(1,j+2)=Img(2,j);
    data(2,j+2)=Img(1,j);
    data(S+3,j+2)=Img(S,j);
    data(S+4,j+2)=Img(S-1,j);
    
    data(j+2,1)=Img(j,2);
    data(j+2,2)=Img(j,1);
    data(j+2,S+3)=Img(j,S);
    data(j+2,S+4)=Img(j,S-1);
end
for i=1:2
    for j=1:2
        data(i,j)=Img(1,1);
        data(S+2+i,j)=Img(S,1);
        data(i,S+2+j)=Img(1,S);
        data(S+2+i,S+2+j)=Img(S,S);
    end
end

res=cell(1,F);
for j=1:F
    res{j}=zeros(S,S);
end

%computing filter responses
for f=1:F%for each filter
    for i=3:S+2
        for j=3:S+2%for each pixel
            for m=-2:2
                for n=-2:2
                    res{f}(i-2,j-2)=res{f}(i-2,j-2)+data(i+m,j+n)*f2d{f}(m+3,n+3);
                end
            end
        end
    end
end

%computing energy
WS=31;
energy=cell(1,F);
for j=1:F
    energy{j}=zeros(S,S);
end
for f=1:F%for each filter
    for i=1:S
        for j=1:S%for each pixel
            num=0;
            for m=-(WS-1)/2:(WS-1)/2
                for n=-(WS-1)/2:(WS-1)/2
                    if(i+m>=1&&j+n>=1&&j+n<=S&&i+m<=S)
                        energy{f}(i,j)=energy{f}(i,j)+res{f}(i+m,j+n)^2;
                        num=num+1;
                    end
                end
            end
            energy{f}(i,j)=energy{f}(i,j)/num;
        end
    end
end
%Normalization
% for f=2:F
%     for i=1:S
%         for j=1:S%for each pixel
%             energy{f}(i,j)=energy{f}(i,j)+energy{1}(i,j);
%         end
%     end
% end

for f=1:F
    st=std2(energy{f});
    mea=mean(mean(energy{f}));
    for i=1:S
        for j=1:S%for each pixel
            energy{f}(i,j)=(energy{f}(i,j)-mea)/st;
        end
    end
end

%apply PCA
energy{f}={energy{2:5},energy{7:10},energy{13:15},energy{19:20},energy{25}};
F=14;
NormalizedaveFeature=zeros(S*S,F);
for i=1:S
    for j=1:S
        for f=1:F
        NormalizedaveFeature((i-1)*S+j,f)=energy{f}(i,j);
        end
    end
end
[coeff, score] = pca(NormalizedaveFeature);
reducedDimension = coeff(:,1:3);
NormalizedaveFeature  = NormalizedaveFeature * reducedDimension;
F=3;
for f=1:F
    for i=1:S
        for j=1:S
            energy{f}(i,j)=NormalizedaveFeature((i-1)*S+j,f);
            
        end
    end
end

K=7;
%kmeans algorithm for 25/15d data
labels_25d=ones(S,S);
score=0;
for trying=0:1
    %intialization
    center=rand(K,F)*4-2;
    out=ones(S,S);
    %finding the points which belong to each center
    for itr=0:50
        for i=1:S
            for j=1:S
                minD=5000;%A very large num
                class=1;
                for c=1:K
                    distance=0;
                    for dim=1:F
                        distance=distance+(center(c,dim)-energy{dim}(i,j))^2;
                    end
                    distance=sqrt(distance);
                    if(distance<minD)
                        minD=distance;
                        class=c;
                    end
                end
                out(i,j)=class;
            end
        end
        
        %computing new c
        centerp=center;
        for c=1:K
            num=0;
            val=zeros(1,F);
            for i=1:S
                for j=1:S
                    if(out(i,j)==c)
                        for f=1:F
                            val(1,f)=val(1,f)+energy{f}(i,j);
                            num=num+1;
                        end
                    end
                end
            end
            if(num~=0)
                val=val/num;
            end
            center(c,:)=val;
        end
        
        %checking whether we need more iterations
        delta=sum(sum(abs(centerp-center)));
        if(delta<.001)
            itr
            delta
            break;
        end
    end
    
    %computing score to see whether we have reached a better clustering
    
    distance=0;
    for c=1:K
        for i=1:S
            for j=1:S
                if(out(n)==c)
                    for dim=1:F
                        distance=distance+(center(c,dim)-energy{dim}(i,j))^2;
                    end
                end
            end
        end
    end
    if(1/distance>score)
        labels_25d=out;
        score=1/distance;
    end
end

output=zeros(S,S);
for i=1:S
    for j=1:S
        if(labels_25d(i,j)==1)
            output(i,j)=0;
        elseif(labels_25d(i,j)==2)
            output(i,j)=40;
        elseif(labels_25d(i,j)==3)
            output(i,j)=90;
        elseif(labels_25d(i,j)==4)
            output(i,j)=130;
        elseif(labels_25d(i,j)==5)
            output(i,j)=180;
        elseif(labels_25d(i,j)==6)
            output(i,j)=90;
        elseif(labels_25d(i,j)==7)
            output(i,j)=255;
        end
    end
end

figure(16);
imshow(uint8(output))