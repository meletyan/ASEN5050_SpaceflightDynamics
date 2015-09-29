function [at1, at2, tau1, tau2, dva, dvb, dvc] = BIELLIPTICTRANSFER(rInitial, rb, rFinal, MU)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Computes velocities required to achieve a two-burn Hohmann transfer
%%% between two circular orbits where r1 < r2.
%%%
%%% Input:  rInitial    -   Initial orbit radius
%%%               rb    -   Intermdeiate point, r1 < r2 < b
%%%           rFinal    -   Final orbit radius
%%%               MU    -   Gravitational parameter km^3/s^2
%%%
%%% Output:      at1    -   Semi-major axis of initial orbit
%%%              at2    -   Semi-major axis of final orbit
%%%             tau1    -   Transfer time to point b
%%%             tau2    -   Transfer time to final orbit
%%%              dva    -   Burn 1 to get out of initial orbit
%%%              dvb    -   Burn 2 to at point b
%%%              dvc    -   Burn 3 to get into final orbit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

