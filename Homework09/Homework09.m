%% Ed Meletyan
%  ASEN 5050
%  Homework #9

%% Problem 1
clc; clear;

rpe = 185 + 6378.4418;
rpm = 300 + 3397.2;
rse = 149598023;        % km
rsm = 227939186;
ms  = 1.9891e30;
me  = 5.9742e24;
mm  = 6.4191e23;
mem = me + 7.3483e22;
muS = 1.32712428e11;    % km^3/s^2
muE = 398600.4415;
muM = 43050;

% Analysis
rseSOI  = (me / ms)^(2 / 5) * rse;
rsmSOI  = (mm / ms)^(2 / 5) * rsm;
rsemSOI = (mem / ms)^(2 / 5) * rse;

% Velocity of Earth/Mars relative to the Sun
ve = sqrt(muS / rse);
vm = sqrt(muS / rsm);

% Transfer orbit semi-major axis
aTrans   = (rse + rsm) / 2;

% Departure/Arrivals for transfer orbit
vdepS = sqrt(2 * muS / rse - muS / aTrans);
varrS = sqrt(2 * muS / rsm - muS / aTrans);

% Hyperbolic excess velocity
vinfdep = vdepS - ve;
vinfarr = abs(varrS - vm);

% Delta V to reach hyperbolic excess velocity
dvd = sqrt(2 * muE / rpe + vinfdep^2) - sqrt(muE / rpe);
dva = sqrt(2 * muM / rpm + vinfarr^2) - sqrt(muM / rpm);

% Transfer time
tauTrans = pi * sqrt(aTrans^3 / muS);
tdays = tauTrans / 86400;


%% Problem 2
rmin  = 200 + 3397.2;
ecc   = 1 + vinfarr^2 * rmin / muM;
delta = 2 * asind(1/ecc);
% delta = 0:360;
vmMax = sqrt((vm + vinfarr * cosd(180 - delta)).^2 + (vinfarr * sind(180 - delta)).^2);
vmMin = sqrt((vm - vinfarr * cosd(180 - delta)).^2 + (vinfarr * sind(180 - delta)).^2);

%% Problem 3
clc; clear;
muJ = 1.268e8;
rj  = 71492;
rsj = 778298361;
rse = 149598023;
muE = 398600.4415;
muS = 1.32712428e11;

ve   = sqrt(muS / rse);
vj   = sqrt(muS / rsj);
vesc = sqrt(2 * muS / rsj);

% Transfer orbit semi-major axis
aTrans   = (rsj + rse) / 2;

% Departure/Arrivals for transfer orbit
vdepS = sqrt(2 * muS / rse - muS / aTrans);
varrS = sqrt(2 * muS / rsj - muS / aTrans);

% Hyperbolic excess velocity
vinfdep = vdepS - ve;
vinfarr = abs(varrS - vj);

% Turning angle
ecc   = 1 + vinfarr^2 * 2 * rj / muJ;
delta = 2 * asind(1/ecc);

% After gravity assist
vga = sqrt((vj + vinfarr * cosd(180 - delta)).^2 + (vinfarr * sind(180 - delta)).^2);
energy = vinfarr^2 / 2;

%% Problem 4

mj = 1.8988e27;
ms  = 1.9891e30;

rsjSOI  = (mj / ms)^(2 / 5) * rsj;
soifrac = 0.67 * rsjSOI;

msat = 5.685e26;
rssat = 1429394133;

rssatSOI  = (msat / ms)^(2 / 5) * rssat;
soifracsat = 0.67 * rssatSOI;
