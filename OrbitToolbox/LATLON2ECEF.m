function pos_ecef = LATLON2ECEF(phi_gd, lambda, h, R_E)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Compute ECEF position on Earth from lat, lon, and altitude
%%%
%%% Input:    phi_gd    -   Geodetic latitude (rad)
%%%           lambda    -   Longitude (rad)
%%%                h    -   Altitude
%%%
%%% Output: pos_ecef    -   Position in ECEF coordinates
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pre-assign sin/cos functions
r  = h + R_E;
cp = cos(phi_gd);
sp = sin(phi_gd);
cl = cos(lambda);
sl = sin(lambda);

% Compute ECEF position
ri = r * cp * cl;
rj = r * cp * sl;
rk = r * sp;

pos_ecef = [ri; rj; rk];

end

