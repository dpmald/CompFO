% Interference from two slits
%
% Uses LightPipes for Matlab
% http://www.okotech.com/lightpipes-mathcad-matlab-download

clear;
m = 1;
nm = 1e-9*m;
mm = 1e-3*m;
cm = 1e-2*m;
rad = 1;
lambda = 550*nm;
size = 5*mm;
N = 64;
w = 0.1*mm;
h = 2.5*mm;
x = 0.5*mm;
phi = 15*rad;
dz = 7.5*cm;
figure(1);
for i = 1:10
z = i*dz;
F = LPBegin(size,lambda,N);
F1 = LPRectAperture(w,h,-x,0,0,F);
F2 = LPRectAperture(w,h,x,0,phi,F);
F = LPBeamMix(F1,F2);
clear F1;
clear F2;
F = LPFresnel(z,F);
I = LPIntensity(1,F);
subplot(2,5,i);
subimage(I);
Str = sprintf('z=%4.1f cm',z/cm);
title(Str);
axis off;
end
clear F;
flnm = sprintf('(man0009.emf)');flnm = strcat('\it',flnm);
text(0,300,flnm);
print -dmeta '..\figures\man0009';