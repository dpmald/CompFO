%% Classical and Modified Quarter Wave Stack
clear
LambdaS = 100; % start wavelength
LambdaE = 1200; % end wavelength
LambdaI = 1; % wavelength increment
Lambda0 = 500; % monitor wavelength
Lambda = LambdaS - LambdaI;
x = 0;
y = 0;
z = 0; 
while Lambda < LambdaE
    Lambda = Lambda + LambdaI
    g_Lambda = Lambda0 / Lambda
    x = x + 1
    xvalue2(x) = Lambda
    z = z + 1
    xvalue1(z) = g_Lambda
    fr = 1 % number of quarter waves in each material
    p = 11 % number of layer pair repeats in desing
    Delta_g = (pi/2) * fr * g_Lambda
    Eta_0 = 1.0 % refractive index - incident media
    Eta_l = 1.46 % refractive index - low
    %Eta_m = 2.1 % refractive index - medium
    Eta_h = 3.3 % refractive index - high
    Eta_s = 4.02 % refractive index - substrate
    M_1 = cos(Delta_g);
    M_2 = sin(Delta_g);
    L_g = [M_1 (M_2 / Eta_l)*1i ; M_2*1i*Eta_l M_1]
    H_g = [M_1 (M_2 / Eta_h)*1i ; M_2*1i*Eta_h M_1]
    %M_g = [M_1 (M_2 / Eta_m)*1i ; M_2*1i*Eta_m M_1]
    X_g = ((L_g*H_g)^p) * L_g * [1.0; Eta_s]
    Y_g = X_g(2) / X_g(1)
    r_g = (Eta_0 - Y_g)/(Eta_0 + Y_g)
    c_g = conj(r_g)
    R_g = (r_g*c_g)*100
    y = y + 1;
    yvalue(y) = R_g
end
clf()
plot(xvalue1,yvalue)
%plot(xvalue2,yvalue)
    