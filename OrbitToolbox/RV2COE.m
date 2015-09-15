function [p, a, e, i, raan, w, nu]  = RV2COE(rijk, vijk, mu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Convert ECI position and velocity vectors into orbital elements. This
%%% function does not apply to:
%%%     - Elliptical equatorial orbits
%%%     - Circular inclined orbits
%%%     - Circular equatorial orbits
%%%
%%% Input:      rijk    -   ECI position vector
%%%             vijk    -   ECI velocity vector
%%%               mu    -   Gravitational parameter km^3/s^2
%%%
%%% Output:        p    -   Semi-parameter
%%%                e    -   Eccentricity vector
%%%                a    -   Semi-major axis (km)
%%%                i    -   Inclination (rad)
%%%             raan    -   Right ascension of the ascending node (rad)
%%%                w    -   Argument of perigee (rad)
%%%               nu    -   True anomaly (rad)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Angular momentum
hijk = cross(rijk, vijk);
h = norm(hijk);

% Eccentricity
eijk = cross(vijk, hijk) / mu - rijk / norm(rijk);
e = norm(eijk);

% Energy
eps = norm(vijk)^2 / 2 - mu / norm(rijk);

% Semi-parameter
if e ~= 1
    a = -mu / (2 * eps);
    p = a * (1 - e^2);
else
    p = h^2 / mu;
    a = inf;
end    

% Inclination
i = acos(dot([0 0 1], hijk) / h);

% Line of nodes
nijk = cross([0 0 1], hijk);
n = norm(nijk);

% RAAN
craan = -hijk(2) / (h * sin(i));
sraan = hijk(1) / (h * sin(i));
raan = atan2(sraan, craan);

% Argument of perigee
w = acos(dot(nijk, eijk) / (n * e));
if eijk(3) < 0
    w = 2*pi - w;
end

% True anomaly
nu =acos(dot(eijk, rijk) / (e * norm(rijk)));
if dot(rijk, vijk) < 0
    nu = 2*pi - nu;
end


