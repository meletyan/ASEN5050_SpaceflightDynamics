function [aTrans, tauTrans, dva, dvb, dv] = HOHMANNTRANSFERELLIPTIC(rInitial, rFinal, eInitial, eFinal, initPoint, finalPoint, MU)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Computes velocities required to achieve a two-burn Hohmann transfer
%%% between two ellipitcal orbits. Assume:
%%%     - Burns only occur at 0 deg or 180 deg
%%%     - Semi-major axes must be aligned
%%%
%%% Input:  rInitial    -   Initial orbit radius
%%%           rFinal    -   Final orbit radius
%%%         eInitial    -   Eccentricity of starting orbit
%%%           eFinal    -   Eccentricity of final orbit
%%%        initPoint    -   Set equal to 1 if the 1st burn is at periapsis
%%%       finalPoint    -   Set equal to 1 if the 2nd burn is at periapsis
%%%               MU    -   Gravitational parameter km^3/s^2
%%%
%%% Output:   aTrans    -   Semi-major axis of transfer orbit
%%%         tauTrans    -   Transfer time
%%%              dva    -   Burn 1 to get out of initial orbit
%%%              dvb    -   Burn 2 to achieve final orbit
%%%               dv    -   Total change in velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if initPoint == 1  % First burn at periapsis
    aInitial = rInitial / (1 - eInitial);
else               % First burn at apoapsis
    aInitial = rInitial / (1 + eInitial);
end
if finalPoint == 1  % Second burn at periapsis
    aFinal = rFinal / (1 - eFinal);
else               % Second burn at apoapsis
    aFinal = rFinal / (1 + eFinal);
end

aTrans   = (rInitial + rFinal) / 2;
vInitial = sqrt(2 * MU / rInitial - MU / aInitial);
vTransA  = sqrt(2 * MU / rInitial - MU / aTrans);
vFinal   = sqrt(2 * MU / rFinal - MU / aFinal);
vTransB  = sqrt(2 * MU / rFinal - MU / aTrans);

dva      = vTransA - vInitial;
dvb      = vFinal - vTransB;
dv       = abs(dva) + abs(dvb);
tauTrans = pi * sqrt(aTrans^3 / MU);
end