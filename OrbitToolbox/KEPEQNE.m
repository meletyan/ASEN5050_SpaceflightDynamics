function E = KEPEQNE(M, e)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Iterative solution to the Kepler equation for eccentric anomaly
%%%
%%% Input:         M    -   Mean anomaly
%%%                e    -   Eccentricity
%%%
%%% Output:        E    -   Eccentric anomaly
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if -pi < M < 0 || M > pi
    E = M - e;
else
    E = M + e;
end

threshold = 1e-8;
Enext = KEPEQN(E, M, e);

while abs(Enext - E) > threshold
    E = Enext;
    Enext = KEPEQN(E, M, e);
end

end

function E1 = KEPEQN(E0, M, e)
E1 = E0 + (M - E0 + e * sin(E0)) / (1 - e * cos(E0));
end

