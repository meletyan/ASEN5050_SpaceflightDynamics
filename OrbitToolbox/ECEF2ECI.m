function pos_eci = ECEF2ECI(pos_ecef, theta_gst)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Rotate Earth-centered Earth-fixed to inertial coordinates
%%%
%%% Input:  pos_ecef    -   Position in ECEF coordinates
%%%        theta_gst    -   Greenwich Sidereal Time (rad)
%%%
%%% Output:  pos_eci    -   Position in ECI coordinates
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pre-assign sin/cos functions
st = sin(-theta_gst);
ct = cos(-theta_gst);

% Rotation about z-axis
R3 = [ ct st 0;
      -st ct 0;
       0  0  1];

% Rotate ECI vector
pos_eci = R3 * pos_ecef;

end

