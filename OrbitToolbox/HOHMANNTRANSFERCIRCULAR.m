function [aTrans, tauTrans, dva, dvb, dv] = HOHMANNTRANSFERCIRCULAR(rInitial, rFinal, MU)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Computes velocities required to achieve a two-burn Hohmann transfer
%%% between two circular orbits where r1 > r2.
%%%
%%% Input:  rInitial    -   Initial orbit radius
%%%           rFinal    -   Final orbit radius
%%%               MU    -   Gravitational parameter km^3/s^2
%%%
%%% Output:   aTrans    -   Semi-major axis of transfer orbit
%%%         tauTrans    -   Transfer time
%%%              dva    -   Burn 1 to get out of initial orbit
%%%              dvb    -   Burn 2 to achieve final orbit
%%%               dv    -   Total change in velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aTrans   = (rInitial + rFinal) / 2;
vInitial = sqrt(MU / rInitial);
vTransA  = sqrt(2 * MU / rInitial - MU / aTrans);
vFinal   = sqrt(MU / rFinal);
vTransB  = sqrt(2 * MU / rFinal - MU / aTrans);

dva      = vTransA - vInitial;
dvb      = vFinal - vTransB;
dv       = abs(dva) + abs(dvb);
tauTrans = pi * sqrt(aTrans^3 / MU);

end