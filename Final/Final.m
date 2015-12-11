%% Ed Meletyan
%  ASEN 5050
%  Final Exam

%% Problem 1
clc; clear;

%% Problem 2
clc; clear;

%% Problem 3
clc; clear;

G = 6.673e-20;
ma = 1e15;
ms = 1.9891e30;
aa = 3 * 149597870;
muA = ma * G;
rsoi = aa * (ma / ms)^(2 / 5);
as = 40;
P = pi * sqrt(as^3 / muA);
vi = sqrt(muA / as);
dv = -0.001;
vtransA = vi + dv;
ra = as;
atrans = 1 / (2 / ra - vtransA^2 / muA);
rp = 2 * atrans - ra;
ecc = (ra - rp) / (ra + rp);
n  = sqrt(muA / atrans^3);
M2 = pi + n * 6 * 3600;
E2 = KEPEQNE(M2, ecc);
r_t6 = atrans * (1 - ecc * cos(E2));
v2 = sqrt(muA / r_t6);
vi = sqrt(muA * (2 / r_t6 - 1 / atrans));
dv2 = v2 - vi;
fpa = acosd(sqrt(atrans^2 * (1 - ecc^2) / r_t6 / (2 * atrans - r_t6)));
vivec = [vi * sind(fpa); vi * cosd(fpa); 0];
v2vec = [0; v2; 0];
dvvec = v2vec - vivec;


%% Problem 4
clc; clear;

Rv = [48965315.1; 96179438.8; 0];
Vv = [-31.322263; 15.730492; 0];
VscA = [-28.123456; 8.654321; 0];
muS = 1.32712428e11;  % km^3/s^2
muV = 3.257e5;
delta = 42;

% Analysis
vv = norm(Vv);
vsca = norm(VscA);
ra = norm(Rv);
epsS = (vsca^2 / 2 - muS / ra) * 1e6;
Vinf = VscA - Vv;
vinf = norm(Vinf);
epsV = vinf^2 / 2 * 1e6;
ecc = 1 / sind(delta / 2);
rp = muV * (ecc - 1) / vinf^2;
vdec = norm(Vv + ROTZ(deg2rad(-delta))*Vinf);


%% Problem 5
clc; clear;

rp  = 185 + 6378.137; % km
dv1 = 7;              % km/s
as  = 149597870;      % km
muE = 398600.4418;    % km^3/s^2
muS = 1.32712428e11;  % km^3/s^2

% Analysis
vp = sqrt(muE / rp);
vE = sqrt(muS / as);
vinf = sqrt((dv1 + vp)^2 - 2 * muE / rp);
vd = vinf + vE;
atrans = 1 / (2 / as - vd^2 / muS);
rmax = 2 * atrans - as;
vdmin = vE - vinf;
atransmin = 1 / (2 / as - vdmin^2 / muS);
rmin = 2 * atransmin - as;
imax = 2 * asind(vinf / 2 / vE);

%% Problem 6
clc; clear;

rp  = 7000;
ra  = 8000;
inc = 100;
P   = 100 * 60;
R   = 6000;
rs  = 2 * 149597870;
muS = 1.32712428e11;

% Analysis
a = (rp + ra) / 2;
n = sqrt(muS / a^3);
ecc = (ra - rp) / (ra + rp);
muP = pi^2 * a^3 / P^2;
Ps = pi * sqrt(rs^3 / muS);
omgd_tar = 2 * pi / Ps;
p = a * (1 - ecc^2);
J2 = -2 * omgd_tar * p^2 / (3 * n * R^2 * cosd(inc));















