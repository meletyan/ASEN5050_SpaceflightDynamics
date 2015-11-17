%% Ed Meletyan
%  ASEN 5050
%  Midterm

%% Problem 5
clc; clear;

rE = 6378.1363;
muE = 398600.4415;

ru = 380000;
rp = 362600;
ra = 405400;

% Analysis
a = (rp + ra) / 2;
ecc = (ra - rp) / (ra + rp);
P = 2 * pi * sqrt(a^3 / muE) / 3600 / 24;
n = 2 * pi / P;
E1 = acos((1 - ru / a) / ecc);
E2 = 2 * pi - E1;
M1 = E1 - ecc * sin(E1);
M2 = E2 - ecc * sin(E2);
t = 2 * M1 / n;
te = 100 * t / P;