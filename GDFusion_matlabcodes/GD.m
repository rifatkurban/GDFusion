% Gaussian of differences: a simple and efficient general image fusion method
% Rifat Kurban, rifat.kurban@agu.edu.tr
% https://github.com/rifatkurban/GDfusion

function fuseimage = GD(images,ver)
%ver=1: GD5
%ver=2: GD10
%ver=3: GD15
%ver=4: GDPSQABF
%ver=5: GDPSQCD
%ver=6: GDPSQCV
if ver==1
    k=5;
    fuseimage = mfiltw(images,k);
elseif ver==2
    k=10;
    fuseimage = mfiltw(images,k);
elseif ver==3
    k=15;
    fuseimage = mfiltw(images,k);
elseif ver==4
    fitmetric="Qabf";
    [fuseimage]=mfiltw_opt(images,fitmetric);
elseif ver==5
    fitmetric="Qcb";
    [fuseimage]=mfiltw_opt(images,fitmetric);
elseif ver==6
    fitmetric="Qcv";
    [fuseimage]=mfiltw_opt(images,fitmetric);
end
