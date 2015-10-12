function nu = TRUEANOMALYFROMT(M1, e, n, dt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Use the Newton-Raphson method to compute the true anomaly at a future
%%% time.
%%%
%%% Input:        M1    -   Initial mean anomaly (rad)
%%%                e    -   Eccentricity
%%%                n    -   Mean motion (rad/s)
%%%               dt    -   Forecast time (s)
%%%
%%% Output:       nu    -   True anomaly (rad)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Mean anomaly at time since periapse
M   = M1 + n * dt;

% Eccentric anomaly
E   = KEPEQNE(M, e);

% True anomaly at time since periapse
nu = 2 * atan2(sqrt(1 + e) * tan(E / 2), sqrt(1 - e));

end

