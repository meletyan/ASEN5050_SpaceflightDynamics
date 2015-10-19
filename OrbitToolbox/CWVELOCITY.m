function [dx0, dy0, dz0] = CWVELOCITY(x0, y0, z0, w, t)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Clohessy-Wiltshire (CW) or Hill's Equation to analyze the required
%%% velocity to drive the distance between two close objects to 0.
%%%     > Satellites must be few km apart
%%%     > Target in circular orbit
%%%     > No external forces (drag, etc...)
%%%
%%% Input:     x0, y0, z0    -   Initial Interceptor position
%%%                     w    -   Target orbit revolutions
%%%                     t    -   Desired maneuver time
%%%
%%% Output: dx0, dy0, dz0    -   Required initial velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s = sin(w * t);
c = cos(w * t);
wt = w * t;

% Starting velocity required to drive x, y, z to 0
dy0 = (((6 * x0 * (wt - s)) - y0) * w * s - ...
      2 * w * x0 * (4 - 3 * c) * (1 - c)) / ...
      ((4 * s - 3 * wt) * s + 4 * (1 - c)^2);

dx0 = -(w * x0 * (4 - 3 * c) + 2 * (1 - c) * dy0) / s;

dz0 = -z0 * w * cot(w * t);

end

