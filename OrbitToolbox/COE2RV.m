function [rijk, vijk] = COE2RV(p, e, i, raan, w, nu, mu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Convert ECI position and velocity vectors into orbital elements. This
%%% function does not apply to:
%%%     - Elliptical equatorial orbits
%%%     - Circular inclined orbits
%%%     - Circular equatorial orbits
%%%
%%% Input:         p    -   Semi-parameter
%%%                e    -   Eccentricity vector
%%%                i    -   Inclination (rad)
%%%             raan    -   Right ascension of the ascending node (rad)
%%%                w    -   Argument of perigee (rad)
%%%               nu    -   True anomaly (rad)
%%%               mu    -   Gravitational parameter km^3/s^2
%%%
%%% Output:     rijk    -   ECI position vector
%%%             vijk    -   ECI velocity vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pre-initialize terms to reduce computation load
snu = sin(nu);
cnu = cos(nu);
smp = sqrt(mu / p);

% Calculate r and v in perifocal plane
rpqw = [p * cnu / (1 + e * cnu);
        p * snu / (1 + e * cnu);
        0];
vpqw = [-smp * snu;
         smp * (e + cnu);
         0];

% Calculate the direction cosine matrix for R3 * R1 * R3
dcm = transpose(ROTZ(w) * ROTX(i) * ROTZ(raan));

% Apply rotation
rijk = dcm * rpqw;
vijk = dcm * vpqw;
       
end








