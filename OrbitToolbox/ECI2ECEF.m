function pos_ecef = ECI2ECEF(pos_eci, theta_gst)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Rotate inertial coordinates to Earth-centered Earth-fixed
%%%
%%% Input:   pos_eci    -   Position in ECI coordinates
%%%        theta_gst    -   Greenwich Sidereal Time (rad)
%%%
%%% Output: pos_ecef    -   Position in ECEF coordinates
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pre-assign sin/cos functions
st = sin(theta_gst);
ct = cos(theta_gst);

% Rotation about z-axis
R3 = [ ct st 0;
      -st ct 0;
       0  0  1];

% Rotate ECI vector by Greenwich Sidereal Time
pos_ecef = R3 * pos_eci;

end

