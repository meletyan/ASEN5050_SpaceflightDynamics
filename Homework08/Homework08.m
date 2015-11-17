%% Ed Meletyan
%  ASEN 5050
%  Homework #8

%% Problem 1
clc; clear; close all;

h    = 800;                  % Orbital altitude
Re   = 6378.1363;            % Earth radius
spd  = 86400;                % sec per day
r    = h + Re;               % Orbit radius
inc  = 0:0.01:180;            % Inclination angle range
omgT = 2 * pi / 365.2421897; % Sun-sync reqt
J2   = 0.0010826267;         % J2 perturbation
muE  = 398600.4418;
p    = r;
n    = sqrt(muE / r^3); 

% Analysis
num  = -3 * n * Re^2 * J2;
den  = 2 * p^2;
ci   = cosd(inc);
omgd = rad2deg(num / den * ci) * 86400;
ind  = abs(omgd - omgT) < 0.001;
incT = inc(ind);

figure(1)
hold on
plot(inc, omgd, 'linewidth', 3);
line([0 180], [omgT omgT], 'color', 'r');
line([incT incT], [-8 8], 'color', 'r');
plot(incT, omgT, 'ro', 'markersize', 12);
title('Sun-Synchronous Daily Nodal Regression');
xlabel('Inclination (deg)');
ylabel('Daily Nodal Regression (deg/day)');

%% Problem 3
clc; clear; close all;

% At t0
hp   = 400;   % km
ha   = 1000;  % km
inc  = 51.5;  % deg
raan = 0;     % deg
wp   = 60;    % deg
nu   = 0;     % deg

% Perturbing acceleration
dist = 1e-6;  % m/s^2 in orbit normal (rs'W')

% Analysis
% a) Inclination, RAAN, 
% b) 





