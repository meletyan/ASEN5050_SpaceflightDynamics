%% Ed Meletyan
%  ASEN 5050
%  Midterm

%% Problem 2
clc; clear;

rE = 6378.1363;
muE = 398600.4415;
a = 8580;
ecc = 0.39;
inc = d2r(150.9);
raan = d2r(275);
w = d2r(110.1);
nu = d2r(230);

% Analysis
rp = a * (1 - ecc);
Ef = acos((1 - rE / a) / ecc);
Mf = Ef - ecc * sin(Ef);
Ei = nu2E(nu, ecc);
Mi = Ei - ecc * sin(Ei);
n = sqrt(muE / a^3);
dt = (Mf - Mi) / n;
vf = sqrt(2 * muE / rE - muE / a);