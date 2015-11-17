%% Ed Meletyan
%  ASEN 5050
%  Homework #7
clc; clear;

% Initial conditions
X  = 5492.000;      % km
Y  = 3984.001;      % km
Z  = 2.955;         % km
VX = -3.931;        % km/sec
VY = 5.498;         % km/sec
VZ = 3.665;         % km/sec
gm = 398600.4415;   % km^3/sec^2

%% Problem 1

% Orbital elements
[p, a, ecc, i, raan, w, nu0] = RV2COE([X Y Z]', [VX VY VZ]', gm);

% Timeline
t0 = 0;    % s
t1 = 100;  % s
t2 = 1e6;  % s
% time = 0:10:14400;
time = 0:100000:1000000;

% At time 1 (t1 - t0)
n   = sqrt(gm / a^3);
E0  = nu2E(nu0, ecc);
M0  = E0 - ecc * sin(E0);
nu1 = TRUEANOMALYFROMT(M0, ecc, n, t1);

% ECI position at time 1
[XYZ1, VXYZ1] = COE2RV(p, ecc, i, raan, w, nu1, gm);

% At time 2 (t2 - t0)
nu2 = TRUEANOMALYFROMT(M0, ecc, n, t2);

% ECI position at time 1
[XYZ2, VXYZ2] = COE2RV(p, ecc, i, raan, w, nu2, gm);

xyztt  = zeros(length(time), 3);
vxyztt = zeros(length(time), 3);
for tt = 1:length(time);
    nutt = TRUEANOMALYFROMT(M0, ecc, n, time(tt));
    [xyztt(tt,:), vxyztt(tt,:)] = COE2RV(p, ecc, i, raan, w, nutt, gm);
end

%% Problem 2

RO   = [5492.0 3984.001 2.955];
VO   = [-3.931 5.498 3.665];
XO   = [RO VO];
tol  = 1e-4;
options = odeset('RelTol',tol,'AbsTol',[tol tol tol tol tol tol]);

% ode45 matlab integrator - type "help ode45"
[t,x] = ode45('TWOBODY',time, XO, options);

% figure(1)
% subplot(3, 1, 1); plot(time, xyztt(:,1), 'r');
% hold on
% subplot(3, 1, 2); plot(time, xyztt(:,2), 'r');
% hold on
% subplot(3, 1, 3); plot(time, xyztt(:,3), 'r');
% hold on
% subplot(3, 1, 1); plot(time, x(:,1), 'b--');
% subplot(3, 1, 2); plot(time, x(:,2), 'b--');
% subplot(3, 1, 3); plot(time, x(:,3), 'b--');

%% Problem 3

% Positionvector difference
dR = sqrt((x(end,1) - XYZ2(1))^2 + (x(end,2) - XYZ2(2))^2 + (x(end,3) - XYZ2(3))^2)



