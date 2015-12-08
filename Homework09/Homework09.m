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

ve = sqrt(muS / rse);
vm = sqrt(muS / rsm);

[aTrans, tauTrans, dva, dvb, dv] = HOHMANNTRANSFERCIRCULAR(rse, rsm, muS);

Vdep_sun = ve + dva;
Varr_sun = sqrt(2 * muS / rsm - muS / aTrans);

Vinf_dep = Vdep_sun - ve;
Vinf_arr = Varr_sun - vm;

dVdep = sqrt(2 * muE / rpe + Vinf_dep^2) - sqrt(muE / rpe);
dVarr = sqrt(2 * muM / rpm + Vinf_arr^2) - sqrt(muE / rpm);

tdays = tauTrans / 86400;


%% Problem 2
clc; clear;

%% Problem 3
clc; clear;

%% Problem 4
clc; clear;
