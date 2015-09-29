function pos_topo = ECEF2TOPO(pos_ecef, phi, lambda, h)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Compute Azimuth, Elevation, and Range from ECEF positions of tracking
%%% station and satellite.
%%%
%%% Input:  pos_ecef    -   Position in ECEF of the satellite
%%%              phi    -   Geodetic latitude (rad) of tracking station
%%%           lambda    -   Longitude (rad) of tracking station
%%%                h    -   Altitude of tracking station
%%%
%%% Output: pos_topo    -   [Azimuth; Elevation; Range] vector
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Find difference between tracking station and satellite in ECEF
r = pos_ecef - LATLON2ECEF(phi, lambda, h);

% Decompose vector for convenience
rx = r(1);
ry = r(2);
rz = r(3);

% Calculate azimuth, range, elevation relative to tracking station
azimuth     = atan2(ry, rx);
elevation   = atan2(rz, sqrt(rx^2 + ry^2));
range       = norm(r);

% Concatenate into single output vector
pos_topo = [azimuth; elevation; range];
end