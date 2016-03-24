% Rotational Shear interferometer with aberrated wavefront
%
% Uses LightPipes for Matlab
% http://www.okotech.com/lightpipes-mathcad-matlab-download

clear;
m = 1;
cm = 1e-2*m;
mm = 1e-3*m;
nm = 1e-9*m;
rad = 1;
size = 4*cm;
lambda = 500*nm;
N = 64;         % must be 64 if using LightPipes demo functions
Rp = 1*cm;
Rplate = 0.5;
figure;
% 1) Coma:
PhiRot = 180;
nZer = 3;
mZer = 1;
RZer = 10*mm;
AZer = 10*rad;
F = LPBegin(size,lambda,N);
F = LPCircAperture(Rp,0,0,F);
F = LPZernike(nZer,mZer,RZer,AZer,F);
F1 = LPIntAttenuator(Rplate,F);
F2 = LPIntAttenuator(1-Rplate,F);
F2 = LPInterpol(size,N,0,0,PhiRot,1,F2);
F = LPBeamMix(F1,F2);
I = LPIntensity(1,F);
str1 = sprintf('Coma with:\nrotation:%d\nLPZernike(%d,%d,%d*mm,%d*rad,F)',PhiRot,nZer,mZer,RZer/mm,AZer);
subplot(1,3,1),imshow(I), title(str1,'FontSize',8);
% 2) Astigmatism:
PhiRot = 90;
nZer = 2;
mZer = 2;
RZer = 10*mm;
AZer = 10*rad;
subplot(1,3,2),imshow(I),title(str1);
F = LPBegin(size,lambda,N);
F = LPCircAperture(Rp,0,0,F);
F = LPZernike(nZer,mZer,RZer,AZer,F);
F1 = LPIntAttenuator(Rplate,F);
F2 = LPIntAttenuator(1-Rplate,F);
F2 = LPInterpol(size,N,0,0,PhiRot,1,F2);
F = LPBeamMix(F1,F2);
I = LPIntensity(1,F);
str1 = sprintf('Astigmatism with:\nrotation:%d\nLPZernike(%d,%d,%d*mm,%d*rad,F)',PhiRot,nZer,mZer,RZer/mm,AZer);
subplot(1,3,2),imshow(I),title(str1,'FontSize',8);
% 3) High order aberration:
PhiRot = 90;
nZer = 7;
mZer = 3;
RZer = 10*mm;
AZer = 10*rad;
F = LPBegin(size,lambda,N);
F = LPCircAperture(Rp,0,0,F);
F = LPZernike(nZer,mZer,RZer,AZer,F);
F1 = LPIntAttenuator(Rplate,F);
F2 = LPIntAttenuator(1-Rplate,F);
F2 = LPInterpol(size,N,0,0,PhiRot,1,F2);
F = LPBeamMix(F1,F2);
I = LPIntensity(1,F);
str1 = sprintf('High order aberration with:\nrotation:%d\nLPZernike(%d,%d,%d*mm,%d*rad,F)',PhiRot,nZer,mZer,RZer/mm,AZer);
subplot(1,3,3),imshow(I),title(str1,'FontSize',8);
flnm = sprintf('(man0021.emf)');flnm=strcat('\it',flnm);
text(100,500,flnm);
