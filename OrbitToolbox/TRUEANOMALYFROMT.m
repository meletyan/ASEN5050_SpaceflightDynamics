function nu = TRUEANOMALYFROMT(T, mu_e, e, n, dt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Use the Newton-Raphson method to compute the true anomaly at a future
%%% time.
%%%
%%% Input:         T    -   Orbital period (s)
%%%                e    -   Eccentricity
%%%                n    -   Mean motion (rad/s)
%%%               dt    -   Forecast time (s)
%%%
%%% Output:       nu    -   True anomaly (rad)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Semi-major axis
a   = ((T / (2 * pi))^2 * mu_e)^(1 / 3);

% Mean anomaly at time since periapse
M   = n * dt;

% Eccentric anomaly
E   = KEPEQNE(M, e);

% Distance from focus
r   = a * (1 - e * cos(E));

% True anomaly at time since periapse
cnu = (a * cos(E) - a * e) / r;
snu = a * sqrt(1 - e^2) * sin(E) / r;
nu  = atan2(snu, cnu);

end

