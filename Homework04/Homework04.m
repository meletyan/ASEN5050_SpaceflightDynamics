%% Ed Meletyan
%  ASEN 5050
%  Homework #4

%% Problem 1
clc; clear;

% Given

% Periapsis/Apoapsis altitude of initial orbit
hp1 = 250;   % km
ha1 = 600;   % km
% Periapsis/Apoapsis altitude of final orbit
hp2 = 2000;  % km
ha2 = 5000;  % km

% Earth radius
R_E = 6378.137;  % km
% Earth gravitational parameter
MU  = 398600.4418;

% Analysis

% Calculate the semi-major axes of the initial and final orbits
rp1 = hp1 + R_E;
ra1 = ha1 + R_E;
a1  = (rp1 + ra1) / 2;
rp2 = hp2 + R_E;
ra2 = ha2 + R_E;
a2  = (rp2 + ra2) / 2;

% Cases corresponding to Transfer Option
switch 4
    case 1
        % P - A
        rInitial   = rp1;
        rFinal     = ra2;
    case 2
        % P - P
        rInitial   = rp1;
        rFinal     = rp2;
    case 3
        % A - A
        rInitial   = ra1;
        rFinal     = ra2;
    case 4
        % A - P
        rInitial   = ra1;
        rFinal     = rp2;
end

% Calculate Hohmann Transfer
[aTrans, tauTrans, dva, dvb, dv] = ...
    HOHMANNTRANSFERELLIPTIC(rInitial, rFinal, a1, a2, MU);


%% Problem 2
clc; clear;

% Given

% Greenwich Sidereal Time
theta_gst = deg2rad(82.75);
% Eccentricity of Earth
e_E       = 0.081819221456;
% Position in ECI
r_eci     = [-5634; -2645; 2834];

% Analysis
% Convert ECI to ECEF frame
r_ecef = ECI2ECEF(r_eci, theta_gst);

% Determine lat/lon/alt of ECEF vector
[phi_gd, lambda, h] = ECEF2LATLON(r_ecef);

% Compute Geocentric latitude
phi_gc = atan((1 - e_E^2) * tan(phi_gd));


%% Problem 3
clc; clear;

% Given

% Greenwhich Sidereal Time
theta_gstBoulder = deg2rad(103);
% Geodetic Latitude of Boulder
phiBoulder       = deg2rad(40.01);
% Longitude of Boulder
lambdaBoulder    = deg2rad(254.83);
% Altitude of Boulder
hBoulder         = 1.615;  % km

% Analysis
R_E = 6378.137;
% Find ECEF position of Boulder
ecef_Boulder = LATLON2ECEF(phiBoulder, lambdaBoulder, hBoulder, R_E);
% Rotate to ECI
eci_Boulder = ECEF2ECI(ecef_Boulder, theta_gstBoulder);


%% Problem 4
clc; clear;

% Given

% Satellite position in ECEF
r_sat            = [-1681, -5173, 4405]';  % km
% Geodetic Latitude of Boulder
phiBoulder       = deg2rad(40.01);
% Longitude of Boulder
lambdaBoulder    = deg2rad(254.83);
% Altitude of Boulder
hBoulder         = 1.615;  % km

% Analysis

% Calculate azimuth, elevation, and range
r_topo = ECEF2TOPO(r_sat, phiBoulder, lambdaBoulder, hBoulder);









