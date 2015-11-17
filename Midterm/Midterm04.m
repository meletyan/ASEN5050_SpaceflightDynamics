%% Ed Meletyan
%  ASEN 5050
%  Midterm

%% Problem 4
clc; clear;

rE = 6378.1363;
muE = 398600.4415;

lat = 56;
lon1 = 220;
lon2 = 195;

dlon = lon2 - lon1;
P = abs(dlon) / 15 * 3600;
a = (muE * P^2 / 4 / pi^2)^(1 / 3);
h = a - rE;
i = 180 - lat;

