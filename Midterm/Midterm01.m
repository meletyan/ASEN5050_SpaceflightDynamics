%% Ed Meletyan
%  ASEN 5050
%  Midterm

%% Problem 1
clc; clear;

rE   = 6378.1363;
muE  = 398600.4415;

hp   = 700;
i    = d2r(112);
ecc  = 0.22;
raan = 0;
argp = d2r(310);

% Analysis
rp = rE + hp;
a  = rp / (1 - ecc);
n  = sqrt(muE / a^3);
nu1 = d2r(50);
nu2 = d2r(230);
E1 = nu2E(nu1, ecc);
E2 = nu2E(nu2, ecc);
M1 = E1 - ecc * sin(E1);
M2 = E2 - ecc * sin(E2) + 2 * pi;
dt = (M2 - M1) / n;