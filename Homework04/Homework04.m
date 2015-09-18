%% Ed Meletyan
%  ASEN 5050
%  Homework #4

%% Problem 1
clc; clear;

% Given
hp1 = 250;   % km
ha1 = 600;   % km
hp2 = 2000;  % km
ha2 = 5000;  % km
R_E = 6378.137;

% Analysis
rp1 = hp1 + R_E;
ra1 = ha1 + R_E;
rp2 = hp2 + R_E;
ra2 = ha2 + R_E;

% [aTrans, tauTrans, dva, dvb, dv] = ...
%     HOHMANNTRANSFERELLIPTIC(rInitial, rFinal, ...
%     eInitial, eFinal, initPoint, finalPoint, MU);
