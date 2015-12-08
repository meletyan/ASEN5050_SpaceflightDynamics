%% Ed Meletyan
%  ASEN 5050
%  Homework #8

%% Problem 1
clc; clear; close all;

h    = 800;                  % Orbital altitude
Re   = 6378.1363;            % Earth radius
spd  = 86400;                % sec per day
r    = h + Re;               % Orbit radius
omgT = 360 / 365.2421897;    % Sun-sync reqt
J2   = 0.0010826267;         % J2 perturbation
muE  = 398600.4418;

[omgd, inct] = PLOTSEC(r, Re, muE, J2, omgT);

%% Problem 2
clc; clear; close all;

% Days per year
ye = 365.2421897;

% Planetary information
planets.J2(1) = 0.00006;   planets.R(1) = 2439;   planets.P(1) = 87.9666;        planets.Mu(1) = 2.2032e4; % Mercury
planets.J2(2) = 0.000027;  planets.R(2) = 6052;   planets.P(2) = 224.6906;       planets.Mu(2) = 3.257e5;  % Venus
planets.J2(3) = 0.0010826267; planets.R(3) = 6378.1363; planets.P(3) = 365.2421897; planets.Mu(3) = 398600.4418; % Earth
planets.J2(4) = 0.0002027; planets.R(4) = 1738;   planets.P(4) = 27.321582;      planets.Mu(4) = 4902.799; % Moon
planets.J2(5) = 0.001964;  planets.R(5) = 3397.2; planets.P(5) = 686.915;        planets.Mu(5) = 4.305e4;  % Mars
planets.J2(6) = 0.01475;   planets.R(6) = 71492;  planets.P(6) = 11.856525*ye;   planets.Mu(6) = 1.268e8;  % Jupiter
planets.J2(7) = 0.01645;   planets.R(7) = 60268;  planets.P(7) = 29.423519*ye;   planets.Mu(7) = 3.794e7;  % Saturn
planets.J2(8) = 0.012;     planets.R(8) = 25559;  planets.P(8) = 83.747406*ye;   planets.Mu(8) = 5.794e6;  % Uranus
planets.J2(9) = 0.004;     planets.R(9) = 24764;  planets.P(9) = 163.7232045*ye; planets.Mu(9) = 6.809e6;  % Neptune

% RAAN drift
planets.omgt = 360 ./ planets.P;
planets.omgd = cell(9,1);
planets.inct = cell(9,1);

% Plot
for i = 1:9
    [planets.omgd{i}, planets.inct{i}] = ...
        PLOTSEC(800 + planets.R(i), ...
                planets.R(i), ...
                planets.Mu(i), ...
                planets.J2(i), ...
                planets.omgt(i));    
end
legend('Mercury', 'Venus', 'Earth', 'Moon', 'Mars', 'Jupiter', ...
       'Saturn', 'Uranus', 'Neptune', 'Location', 'SouthEast');



%% Problem 3
clc; clear; close all;

% At t0
rp   = 400 + 6378.1363;   % km
ra   = 1000 + 6378.1363;  % km
a    = (ra + rp) / 2;
ecc  = (ra - rp) / (ra + rp);
inc  = d2r(51.5);  % deg
raan = 0;     % deg
wp   = d2r(60);    % deg
nu   = 0;     % deg
muE = 398600.4418;

% Perturbing acceleration
dist = 1e-6;  % m/s^2 in orbit normal (rs'W')

% Analysis
% a) Inclination, RAAN
% b) Inclination, RAAN, Argument of Periapse
% c) (Shown below)

% Timeline
time = 0:10*86400;
% time = 2*(0:2*pi*sqrt(a^3/muE)+1);

% At time 1 (t1 - t0)
n   = sqrt(muE / a^3);
p   = a * (1 - ecc^2);
E0  = nu2E(nu, ecc);
M0  = E0 - ecc * sin(E0);

xyztt  = zeros(length(time), 3);
vxyztt = zeros(length(time), 3);
oeI = zeros(length(time), 1);
oeR = zeros(length(time), 1);
oeW = zeros(length(time), 1);
nutt = zeros(length(time), 1);

for tt = 1:length(time);
    nutt(tt) = TRUEANOMALYFROMT(M0, ecc, n, time(tt));
    [xyztt(tt,:), vxyztt(tt,:)] = COE2RV(p, ecc, inc, raan, wp, nutt(tt), muE);
    
    hijk = cross(xyztt(tt,:), vxyztt(tt,:));
    h = norm(hijk);
    didt = norm(xyztt(tt,:)) * cos(wp + nutt(tt)) / (n * a^2 * sqrt(1 - ecc^2)) * dist;
    dodt = norm(xyztt(tt,:)) * sin(wp + nutt(tt)) / (n * a^2 * sin(inc) * sqrt(1 - ecc^2)) * dist;
    dwdt = -norm(xyztt(tt,:)) * cot(inc) * sin(wp + nutt(tt)) / h * dist;
    
    inc  = inc + didt;
    raan = raan + dodt;
    wp   = wp + dwdt;
    
    oeI(tt) = didt;
    oeR(tt) = dodt;
    oeW(tt) = dwdt;
end

oeI = rad2deg(oeI) * 86400;
oeR = rad2deg(oeR) * 86400;
oeW = rad2deg(oeW) * 86400;

figure(2)
subplot(3,1,1); plot(time, oeI);
title('Rate of Inclination Change');
xlabel('Time (s)');
ylabel('di/dt (deg/day)');
subplot(3,1,2); plot(time, oeR);
title('Rate of \Omega Change');
xlabel('Time (s)');
ylabel('d\Omega/dt (deg/day)');
subplot(3,1,3); plot(time, oeW);
title('Rate of \omega Change');
xlabel('Time (s)');
ylabel('d\omega/dt (deg/day)');

figure(3)
subplot(3,1,1); plot(nutt, oeI);
title('Rate of Inclination Change');
xlabel('True Anomaly (deg)');
ylabel('di/dt (deg/day)');
subplot(3,1,2); plot(nutt, oeR);
title('Rate of \Omega Change');
xlabel('True Anomaly (deg)');
ylabel('d\Omega/dt (deg/day)');
subplot(3,1,3); plot(nutt, oeW);
title('Rate of \omega Change');
xlabel('True Anomaly (deg)');
ylabel('d\omega/dt (deg/day)');









