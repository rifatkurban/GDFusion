% Gaussian of differences: a simple and efficient general image fusion method
% Rifat Kurban, rifat.kurban@agu.edu.tr
%
% Please cite this study as:
% Kurban, R. Gaussian of Differences: A Simple and Efficient General Image Fusion Method. Entropy 2023, 25, 1215. https://doi.org/10.3390/e25081215
%
% Please also see: https://github.com/xingchenzhang/VIFB


%Input images
img1 = imread('A\f11.jpg');
img2 = imread('B\f11.jpg');

img1 = double(img1);
img2 = double(img2);

images=[];
fuseimage = zeros(size(img1));

%Select GD version
%ver=1: GD5
%ver=2: GD10
%ver=3: GD15
%ver=4: GDPSQABF
%ver=5: GDPSQCD
%ver=6: GDPSQCV
ver=2;

tic;
if size(img2, 3) == 1
    images(:,:,1)=img1;
    images(:,:,2)=img2;
    fuseimage = GD(images,ver);
elseif size(img1,3) == 1    
    for i=1:3
        images(:,:,1)=img1(:,:,i);
        images(:,:,2)=img2;
        fuseimage(:,:,i) = GD(images,ver);
    end
else    
    for i=1:3
        images(:,:,1)=img1(:,:,i);
        images(:,:,2)=img2(:,:,i);
        fuseimage(:,:,i) = GD(images,ver);
    end
end
toc;

figure,imshow(uint8(fuseimage));
