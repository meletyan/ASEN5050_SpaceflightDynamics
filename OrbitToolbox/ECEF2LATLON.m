function [phi, lambda, h] = ECEF2LATLON(pos_ecef)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Compute the geodetic latitude, longitude, and altitude from ECEF
%%% position.
%%%
%%% Input:  pos_ecef    -   Position in ECEF coordinates
%%%
%%% Output:      phi    -   Geodetic latitude (rad)
%%%           lambda    -   Longitude (rad)
%%%                h    -   Altitude
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define Earth constants
R_E = 6378.137;         % Radius (km)
e_E = 0.081819221456;   % Eccentricity

% Decompse position vector
rx = pos_ecef(1);
ry = pos_ecef(2);
rz = pos_ecef(3);

% Equatorial component
rd = sqrt(rx^2 + ry^2);

% Calculate longitude
lambda = atan2(ry, rx);

% Iterate to solve for geodetic latitude
tol = 1e-8;

% First guess
phi_init = atan(rz / rd);
phi      = phi_init + 1;

while abs(phi - phi_init) >= tol
    phi_init = phi;
    C        = R_E / sqrt(1 - e_E^2 * sin(phi_init)^2);
    
    % Output final geodetic latitude
    phi      = atan((rz + C * e_E^2 * sin(phi_init)) / rd);
end

% Calculate altitude
if phi <= 1
    h = rz / sin(phi) - C * (1 - e_E^2);
else
    h =  rd / cos(phi) - C;
end

end

