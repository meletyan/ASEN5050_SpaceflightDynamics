function pos_sez = ECEF2SEZ(pos_ecef, phi, lambda)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Rotate ECEF to SEZ
%%%
%%% Input:  pos_ecef    -   Position in ECEF of the satellite
%%%              phi    -   Geodetic latitude (rad) of tracking station
%%%           lambda    -   Longitude (rad) of tracking station
%%%
%%% Output:  pos_sez    -   [South; East; Normal] vector
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pos_sez = ROTY(pi / 2 - phi) * ROTZ(lambda) * pos_ecef;

end

