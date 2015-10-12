%% Ed Meletyan
%  ASEN 5050
%  Homework #3

%% Problem 1
clc; clear;

% Given
rijk = [-5633.9; -2644.9; 2834.4];  % km
vijk = [2.425; -7.103; -1.800];     % km/s
MU_E   = 398600.4418;                 % km^3/s^2

% Find a, e, i, raan, w, nu
[p, a, e, i, raan, w, nu] = RV2COE(rijk, vijk, MU_E);
disp([p, a, e, i, raan, w, nu]);


%% Problem 2
clc; clear;

% Given
% ISS (ZARYA)
% 1 NNNNNU NNNNNAAA NNNNN.NNNNNNNN +.NNNNNNNN +NNNNN-N +NNNNN-N N NNNNN
% 1 25544U 98067A   01260.91843750  .00059354  00000-0  74277-3 0 4795
% 2 NNNNN NNN.NNNN NNN.NNNN NNNNNNN NNN.NNNN NNN.NNNN NN.NNNNNNNNNNNNNN
% 2 25544  51.6396 342.1053 0008148 106.9025 231.8021 15.5918272116154

i    = deg2rad(51.6396);
raan = deg2rad(342.1053);
w    = deg2rad(106.9025);
M    = deg2rad(231.8021);
e    = 0.0008148;
nrd  = 15.59182721;  % revs/day
n    = nrd * 2 * pi / 24 / 3600;  % rad/s
MU_E = 398600.4418;

% Find rijk, vijk in ECI
T    = 60 * 60 * 24 / nrd;
a    = ((T / (2 * pi))^2 * MU_E)^(1 / 3);
p    = a * (1 - e^2);
E    = KEPEQNE(M, e);
nu   = 2 * atan(sqrt((1 + e) / (1 - e)) * tan(E / 2));

[rijk, vijk] = COE2RV(p, e, i, raan, w, nu, MU_E);

%% Problem 3

% Given
dt  = 3600;  % sec

% From Problem 2: M1, n, p, e, i, raan, w, nu1, mu
M1  = M;
nu1 = nu;

% Analysis

% At time 2 (t2 - t1) = dt
nu2 = TRUEANOMALYFROMT(M1, e, n, dt);

% Position and velocity at dt
[rijk2, vijk2] = COE2RV(p, e, i, raan, w, nu2, MU_E);












