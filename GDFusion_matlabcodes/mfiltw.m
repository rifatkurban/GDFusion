function [f]=mfiltw(images,k)
% Gaussian of differences: a simple and efficient general image fusion method
% Rifat Kurban, rifat.kurban@agu.edu.tr
%
% Please cite this study as:
% Kurban, R. Gaussian of Differences: A Simple and Efficient General Image Fusion Method. Entropy 2023, 25, 1215. https://doi.org/10.3390/e25081215
%
% Please also see: https://github.com/xingchenzhang/VIFB

kernelsize=2*k+1;
sigma=(kernelsize-1)/6;
h=fspecial('gaussian',kernelsize,sigma);

[m,n,imagecount]=size(images);
cc=zeros(m,n,imagecount);
for i=1:imagecount
    [ir,ic]=edges_func(padarray(double(images(:,:,i)),[k k],'symmetric'));
    cc_temp=conv2(sqrt(ir+ic), h,'valid');
    cc(:,:,i)=cc_temp+eps; 
end

lowlim=(1/imagecount)*0.1;
uplim=1-lowlim;

sumcc=sum(cc,3);
f=zeros(m,n);
for i=1:imagecount
    fw=cc(:,:,i)./sumcc;
    fw(fw<lowlim)=lowlim;
    fw(fw>uplim)=uplim;
    fws(:,:,i)=fw;
    f = f + fw.*double(images(:,:,i));
end


function [yr,yc]=edges_func(x)
yr=conv2(x,[0 1 -1]','same').^2;
yc=conv2(x,[0 1 -1] ,'same').^2;
