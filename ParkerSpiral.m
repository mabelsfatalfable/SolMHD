clc
clear all
close all
format long
%A-2-A ) Parker’s Spiral Structure
w_s = 2.69 * 10^-6; %rad/s
B_0 = 5; %Gauss
r_0 = 1; %Rsun
AU = 149597871; %kilometers
Rsun = 6.9599 * 10^5; %km
r = 1:0.1:2150;
for i=1:1:21491;
V_sw(i) = 103.54 * log(r(i)) - 37.4; 
end
r = r_0:0.1:2150;
B_r = B_0.*(r_0./r).^2;
B_phi = -B_r .* (w_s .* r.*Rsun ./ V_sw);
B_r_T = 10000*B_r; %Tesla
B_phi_T = 10000*B_phi; %Tesla
B_r_nT = 10^-9 *B_r_T; %Tesla
B_phi_nT = 10^-9 *B_phi_T; %Tesla
Psi = 180*atan(B_phi ./ B_r)/3.1415;
r_AU = r*Rsun/AU;
%V_sw = 300;
figure;
phi_0 = 0; %longitude
phi_parker = phi_0 - 180*w_s .*(r - r_0).*Rsun ./ (V_sw .* 3.1415);
phi_parker_radians = deg2rad(phi_parker);
polarplot(phi_parker_radians, r_AU)
hold on;
phi_0 = 90; %longitude
phi_parker = phi_0 - 180*w_s .*(r - r_0).*Rsun ./ (V_sw .* 3.1415);
phi_parker_radians = deg2rad(phi_parker);
polarplot(phi_parker_radians, r_AU)
hold on;
phi_0 = 180; %longitude
phi_parker = phi_0 - 180*w_s .*(r - r_0).*Rsun ./ (V_sw .* 3.1415);
phi_parker_radians = deg2rad(phi_parker);
polarplot(phi_parker_radians, r_AU)
hold on;
phi_0 = 270; %longitude
phi_parker = phi_0 - 180*w_s .*(r - r_0).*Rsun ./ (V_sw .* 3.1415);
phi_parker_radians = deg2rad(phi_parker);
polarplot(phi_parker_radians, r_AU)
hold on;
rlim([0 10])
title('Parker''s Spiral Beyond Saturn')
pax = gca;
pax.ThetaColor = 'blue';
pax.RColor = [0 .5 0];
pax.GridColor = 'red';
%Mercury
th = linspace(0,2*pi,50);
r = 0.387;
polarplot(th,r+zeros(size(th)))
hold on
%Venus
th = linspace(0,2*pi,50);
r = 0.723;
polarplot(th,r+zeros(size(th)))
hold on
%Earth
th = linspace(0,2*pi,50);
r = 1;
polarplot(th,r+zeros(size(th)))
hold on
th = linspace(0,2*pi,50);
%Mars
r = 1.524;
polarplot(th,r+zeros(size(th)))
hold on
%Jupiter
th = linspace(0,2*pi,50);
r = 5.203;
polarplot(th,r+zeros(size(th)))
hold on
%Saturn
th = linspace(0,2*pi,50);
r = 9.539;
polarplot(th,r+zeros(size(th)))
hold on
text(330*pi/180, 0.387, 'Mercury');
text(150*pi/180, 0.723, 'Venus');
text(225*pi/180, 1, 'Earth');
text(30*pi/180, 1.524, 'Mars');
text(0, 5.203, 'Jupiter');
text(65*pi/180, 9.539, 'Saturn');






%A-2-B ) Magnitude of magnetic field
hold off
plot(r*Rsun/AU,B_r); %radial component of B
plot(r*Rsun/AU,B_phi); %azimuthal component of B
xlim([0 10])
r = 1:0.1:2150;
B_tot = sqrt(B_phi.^2 + B_r.^2);
figure;
semilogy(r*Rsun/AU,B_tot * 10^5) %nT
title('IMF Strength Beyond Saturn in XY axes (nT)')
xlabel("Distance [AU]")
ylabel("IMF [in nT]")
xlim([0 10])


%average angle of equatorial magnetic field
figure;
plot(r*Rsun/AU,Psi)
title('IMF Strength Beyond Saturn in XY axes (nT)')
xlabel("Distance [AU]")
ylabel("Angle(degrees)")
xlim([0 10])
ylim([-80 0])
