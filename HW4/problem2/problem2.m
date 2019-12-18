%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu

%2b
S2=1024;
S1=768;
file = fopen('river1.raw','r');
rgbImage = fread(file,'*uint8');
redCh = reshape(rgbImage(1:3:end), [S1,S2]);
greenCh = reshape(rgbImage(2:3:end), [S1,S2]);
blueCh = reshape(rgbImage(3:3:end), [S1,S2]);
%redCh=redCh';greenCh=greenCh';blueCh=blueCh';
Image= cat(3,redCh, greenCh, blueCh);
figure(1);
imshow(Image);
imwrite(Image,'river1.jpg');
file = fopen('river2.raw','r');
rgbImage = fread(file,'*uint8');
redCh = reshape(rgbImage(1:3:end), [S1,S2]);
greenCh = reshape(rgbImage(2:3:end), [S1,S2]);
blueCh = reshape(rgbImage(3:3:end), [S1,S2]);
%redCh=redCh';greenCh=greenCh';blueCh=blueCh';
Image= cat(3,redCh, greenCh, blueCh);
figure(2);
imshow(Image);
imwrite(Image,'river2.jpg');
S=28;
for i=1:5 %storing 12 textures
    s=strcat('one_',int2str(i),'.raw');
    file= fopen(s,'r');
    Data = fread(file,'uint8=>uint8');
    Img = reshape(Data,S,S);
    s=strcat('one_',int2str(i),'.jpg');
    imwrite(Img,s);
end
for i=1:5 %storing 12 textures
    s=strcat('zero_',int2str(i),'.raw');
    file= fopen(s,'r');
    Data = fread(file,'uint8=>uint8');
    Img = reshape(Data,S,S);
    s=strcat('zero_',int2str(i),'.jpg');
    imwrite(Img,s);
end
file= fopen('eight.raw','r');
Data = fread(file,'uint8=>uint8');
Img = reshape(Data,S,S);
imwrite(Img,'eight.jpg');
