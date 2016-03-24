% Calculation of the far field with interpolation and
% direct integration
%
% Uses LightPipes for Matlab
% http://www.okotech.com/lightpipes-mathcad-matlab-download

clear;
m = 1;
nm = 1e-9*m;
mm = 1e-3*m;
cm = 1e-2*m;
lambda = 1000*nm;
size = 10*mm;
NewSize = 7.5*mm;
NewerSize = 400*mm;
N = 64;
NewN = 32;
w = 5*mm;
h = 5*mm;
z = 20*cm;
zfar = 400*m;
F = LPBegin(size,lambda,N);
F = LPRectAperture(w,h,0,0,0,F);
F = LPForvard(z,F);
I0 = LPIntensity(1,F);
F = LPInterpol(NewSize,NewN,0,0,0,1,F);
F = LPForward(zfar,NewerSize,NewN,F);
I1 = LPIntensity(1,F);
figure;
subplot(1,2,1);
imshow(I0);
axis off;
subplot(1,2,2);
mesh(I1);
axis off;
clear F;
flnm = sprintf('(man0011.bmp)');flnm = strcat('\it',flnm);
text(10,-10,flnm);
