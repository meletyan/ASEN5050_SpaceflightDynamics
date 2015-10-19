%% Ed Meletyan
%  ASEN 5050
%  Homework #6

%% Problem 1
clc; clear;

tleFilename = 'E:\GradSchool\ASEN5050_SpaceflightDynamics\Homework06\zarya_tle.txt';
oe = READTLE(tleFilename);

%%

% Epoch of TLE
epochYr = 2014;
epochMo = 10;
epochDy = 10;
epochHr = (oe(2) - floor(oe(2))) * 24;
epochMi = (epochHr - floor(epochHr)) * 60;
epochSc = (epochMi - floor(epochMi)) * 60;
tleDate = datenum(epochYr, epochMo, epochDy, floor(epochHr), floor(epochMi), epochSc);
pgtDate = datenum(2014, 10, 11, 1, 0, 0); 

% Propogation Duration
dateDiff = pgtDate - tleDate;  % Days


