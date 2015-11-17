%% Ed Meletyan
%  ASEN 5050
%  Homework #5

%% Problem 1
clc; clear;

% Given
re = 149598023;
rv = 108208601;
rm = 227939186;
rj = 778298361;
MU_Sun = 1.32712428e11;
at = zeros(3,1);
tau = zeros(3,1);
dva = zeros(3,1);
dvb = zeros(3,1);
dvt = zeros(3,1);

% Analysis
[at(1), tau(1), dva(1), dvb(1), dvt(1)] = HOHMANNTRANSFERCIRCULAR(re, rv, MU_Sun);
[at(2), tau(2), dva(2), dvb(2), dvt(2)] = HOHMANNTRANSFERCIRCULAR(re, rm, MU_Sun);
[at(3), tau(3), dva(3), dvb(3), dvt(3)] = HOHMANNTRANSFERCIRCULAR(re, rj, MU_Sun);

%% Problem 2
clc; clear;

% Given
re = 149598023;
rm = 227939186;
MU_Sun = 1.32712428e11;

% Analysis
aTrans = (re + rm) / 2;
tauTrans = pi * sqrt(aTrans^3 / MU_Sun);
wTarget = sqrt(MU_Sun / rm^3);
wIntercept = sqrt(MU_Sun / re^3);
aL = wTarget * tauTrans;
phaseAngle = pi - aL;
synodic = 2 * pi / (wIntercept + wTarget);

%% Problem 3
clc; clear;

% Given
h = 6000;
theta = deg2rad(30);
kTarget = 1;
kIntercept = 1;
mu = 398600.4418;

% Analysis
a = 6378.137 + h;
[tauPhase, dV, aPhase] = ...
    CIRCULARCOPLANARPHASING(a, theta, kTarget, kIntercept, mu);

%% Problem 4
clc; clear;

% Given
h_iss = 400;
dt = 30 * 60;
x0 = 200;
y0 = 300;
z0 = 50;
dx0 = 0.1;
dy0 = 0;
dz0 = -0.1;
mu_E = 398600.4418;

% Analysis
r_iss = 6378.137 + h_iss;
w_tgt = sqrt(mu_E / r_iss^3);
S = sin(w_tgt * dt);
C = cos(w_tgt * dt);

% Velocity required to rendezvous with ISS
[dx1, dy1, dz1] = CWVELOCITY(x0, y0, z0, w_tgt, dt);
dv1 = norm([dx1, dy1, dz1] - [dx0, dy0, dz0]);

% Velocity required to match speed
[x2, y2, z2, dx2, dy2, dz2] = HILLSEQN(x0, y0, z0, dx1, dy1, dz1, w_tgt, dt);
dv2 = norm([dx2, dy2, dz2]);

dvT = dv1 + dv2;

