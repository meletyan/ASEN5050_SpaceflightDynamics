clc; clear;

khat = [0 0 1];
rvec = [-5650.0; -2650.0; 2850.0];
r = norm(rvec);
vvec = [2.415; -7.032; -1.796];
v = norm(vvec);
mu = 398600.4418;


hvec = cross(rvec, vvec);
h = norm(hvec);
a = -mu/2/(v^2/2 - mu/r);
e = sqrt(1 - h^2/mu/a);
eps = -mu/2/a;
i = acosd(dot(khat, hvec)/h);
cfpa = sqrt(a^2*(1 - e^2)/r/(2*a - r));
sfpa = v/sqrt(2*mu/r - mu/a);
fpa = atan2d(sfpa, cfpa);
hmin = a*(1 - e) - 6378.137;
hmax = a*(1 + e) - 6378.137;
