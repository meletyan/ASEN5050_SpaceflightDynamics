%% Ed Meletyan
%  ASEN 5050
%  Midterm

%% Problem 6
clc; clear;

rE = 6378.1363;
muE = 398600.4415;

eci = [8800; -1100; 5500];
w = 15;
theta_gst0 = 45;
latB = 40.015;
lonB = -105.27;
rB = 6379.77;
hB = rB - rE;

% Analysis
theta_gst = theta_gst0 + 3 * w;
ecef = ECI2ECEF(eci, theta_gst);
lat = asind(ecef(3) / norm(ecef));
lon = atand(ecef(2) / ecef(1));
pos_topo = ECEF2TOPO(ecef, latB, lonB, hB);