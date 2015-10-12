function [x, y, z, dx, dy, dz] = HILLSEQN(x0, y0, z0, dx0, dy0, dz0, w_tgt, dt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Clohessy-Wiltshire (CW) or Hill's Equation to analyze the equations of
%%% motion between two close-orbiting satellites. 
%%%
%%% Input:    x0, y0, z0    -   Initial Interceptor position
%%%        dx0, dy0, dz0    -   Initial Interceptor velocity
%%%                w_tgt    -   Target orbit revolutions
%%%                   dt    -   Desired maneuver time
%%%
%%% Output:      x, y, z    -   Transfer time
%%%           dx, dy, dz    -   Total change in velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = sin(w_tgt * dt);
C = cos(w_tgt * dt);

% Position at time dt
x = dx0 / w_tgt * S - ...
    (3 * x0 + 2 * dy0 / w_tgt) * C + ...
    (4 * x0 + 2 * dy0 / w_tgt);

y = (6 * x0 + 4 * dy0 / w_tgt) * S + ...
    2 * dx0 / w_tgt * C - ...
    (6 * w_tgt* x0 + 3 * dy0) * dt + ...
    (y0 - 2 * dx0 / w_tgt);

z = z0 * C + dz0 / w_tgt * S;

% Velocity at time dt
dx = dx0 * C + (3 * w_tgt * x0 + 2 * dy0) * S;

dy = (6 * w_tgt * x0 + 4 * dy0) * C - 2 * dx0 * S - (6 * w_tgt * x0 + 3 * dy0);

dz = -z0 * w_tgt * S + dz0 * C;
end

