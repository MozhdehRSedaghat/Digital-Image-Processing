%Mozhdeh Rouhsedaghat
%2726554211
%rouhseda@usc.edu
%1/22/2019
in1=readraw('pepper_dark.raw');
in2=readraw('pepper_dark_noise.raw');
for i=1:256
for j=1:256
in1(i,j)=round(2*sqrt(in1(i,j)+3/8));
end
end
for i=1:256
for j=1:256
in2(i,j)=round(2*sqrt(in2(i,j)+3/8));
end
end
[psnr,out]=BM3D(in1,in2,1);
for i=1:256
for j=1:256
out(i,j)=round((256*out(i,j)*256*out(i,j)/4)-3/8);
end
end
writeraw(out,'BM3D_output.raw');
