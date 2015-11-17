%% Ed Meletyan
%  ASEN 5050
%  Homework #6

%% Problem 1
clc; clear;

tle  = 'E:\GradSchool\ASEN5050_SpaceflightDynamics\Homework06\zarya_tle.txt';
oe   = READTLE(tle);
a    = oe(3);  % km
ecc  = oe(4);
inc  = deg2rad(oe(5));  % rad
raan = deg2rad(oe(6));  % rad
w    = deg2rad(oe(7));  % rad
M0   = deg2rad(oe(8));  % rad
muE  = 398600.4418;

%%

% Epoch of TLE
epochYr = 2014;
epochMo = 10;
epochDy = 10;
epochHr = (oe(2) - floor(oe(2))) * 24;
epochMi = (epochHr - floor(epochHr)) * 60;
epochSc = (epochMi - floor(epochMi)) * 60;

% TLE Epoch = 10-Oct-2014, 20:51:47.006 [UTC/GMT] = 11-Oct-2014, 
tleDate = datenum(epochYr, epochMo, epochDy, floor(epochHr), floor(epochMi), epochSc);
pgtDate = datenum(2014, 10, 11, 1, 0, 0);  % 

% Propogation Duration
dateDiff = (pgtDate - tleDate) * 24 * 60 * 60;  % s

%%

% Julian Date
jd   = juliandate([epochYr, epochMo, epochDy, floor(epochHr), floor(epochMi), epochSc]);
Tut1 = (jd - 2451545) / 36525;

% Greenwich Mean Sidereal Time (Reduce to 86400s range)
theta_gmst = rem(67310.54841 + ...
                (876600 * 3600 + 8640184.812866) * Tut1 + ...
                 0.093104 * Tut1^2 - ...
                 6.2e-6 * Tut1^3, 86400) / 240;
if theta_gmst < 0
    theta_gmst = theta_gmst + 360;
end

% Compute ground track time interval
% Start - 19:00:00 Mountain
% End   - 22:00:00 Mountain
t  = dateDiff:60:(3*3600 + dateDiff);    % s
% Rotation rate of the Earth
we = 7.2921158553e-5;                    % rad/s
% Mean Motion
n  = sqrt(muE / a^3);
% Semi-parameter
p  = a * (1 - ecc^2);

% Initialize arrays
lat  = zeros(length(t), 1);
lon  = zeros(length(t), 1);
alt  = zeros(length(t), 1);
pass = zeros(length(t), 4);

% Read background image
img = imread('gtNoTracks.bmp');
figure(2)
hold on
imagesc([-180 180], [-90 90], flipud(img));
xlim([-180 180])
ylim([-90 90])
xlabel('Longitude (deg)'); ylabel('Latitude (deg)');
hold on

% Loop over ground track interval with dt = 60
for dt = 1:length(t)
    % Mean anomaly
    M          = M0 + n * t(dt);
    % Eccentric anomaly
    E          = KEPEQNE(M, ecc);
    % True anomaly
    nu         = 2 * atan(sqrt((1 + ecc) / (1 - ecc)) * tan(E / 2));
    % Position in ECI
    eci        = COE2RV(p, ecc, inc, raan, w, nu, muE);
    % Position in ECF
    ecef       = ECI2ECEF(eci, deg2rad(theta_gmst) + we * t(dt));
    % Latitude/Longitude/Altitude from ECEF position
    [lat(dt), lon(dt), alt(dt)]  = ECEF2LATLON(ecef);
    % Azimuth/Elevation/Range from ECEF position
    topo = ECEF2TOPO(ecef, deg2rad(40.01), deg2rad(254.83), 1.615);
    
    % Compute Pass start when elevation > 0
    if topo(2) > 0
        fprintf('Elevation is greater than 0 at dt = %i\n', dt);
        pass(dt, 1) = rad2deg(topo(1));  % Azimuth
        pass(dt, 2) = rad2deg(topo(2));  % Elevation
        pass(dt, 3) = topo(3);           % Range
        pass(dt, 4) = t(dt);             % Time
        plot(rad2deg(lon(dt)), rad2deg(lat(dt)), 'rd', 'MarkerSize',16,'MarkerFaceColor','r');
    end
    plot(rad2deg(lon(dt)), rad2deg(lat(dt)), 'c.', 'MarkerSize',24)
  
    
end
hold off

figure(1)
plot(rad2deg(lon), rad2deg(lat), '.')
xlim([-180 180])
ylim([-90 90])
xlabel('Longitude (deg)'); ylabel('Latitude (deg)');

figure(3)
polar(deg2rad(pass(17:26,1)), 90 - pass(17:26,2))








