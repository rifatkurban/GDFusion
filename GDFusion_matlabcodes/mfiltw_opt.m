% Gaussian of differences: a simple and efficient general image fusion method
% Rifat Kurban, rifat.kurban@agu.edu.tr
% https://github.com/rifatkurban/GDfusion

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [f]=mfiltw_opt(images,fitmetric)
func = @(k) mfilt_obj(k,images,fitmetric);
options = optimset('Display','none','MaxIter',20);
k = patternsearch(func,[10;3.5],[],[],[],[],[5;1],[80;100],[],options);

[metric,f]=mfilt_obj(k,images,fitmetric);
%print results k(1): size of the filter, k(2): sigma (std.dev. of dist.)
fprintf('\n %.1f %.2f %.2f\n',k(1),k(2),metric);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [metric,f]=mfilt_obj(k,images,fitmetric)
kernelsize=round(k(1));
sigma=k(2);
[m,n,imagecount]=size(images);

if kernelsize<1
    kernelsize=1;
end
if sigma<0.1
    sigma=0.1;
end

Hsize=2*kernelsize+1;
h=fspecial('gaussian',Hsize,sigma);

cc=zeros(m,n,imagecount);
for i=1:imagecount
    [ir,ic]=edges_func(padarray(double(images(:,:,i)),[kernelsize kernelsize],'symmetric'));
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

if fitmetric=="Qabf"
    metric = -1*metricsQabf(double(images(:,:,1)),double(images(:,:,2)),double(uint8(f)))  ;
elseif fitmetric=="Qcb"
    metric = -1*metricsQcb(double(images(:,:,1)),double(images(:,:,2)),double(uint8(f)))  ;
else
    metric = metricsQcv(double(images(:,:,1)),double(images(:,:,2)),double(uint8(f)))  ;
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [yr,yc]=edges_func(x)
yr=conv2(x,[0 1 -1]','same').^2;
yc=conv2(x,[0 1 -1] ,'same').^2;