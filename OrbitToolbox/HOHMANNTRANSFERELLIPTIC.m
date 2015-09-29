function [aTrans, tauTrans, dva, dvb, dv] = ...
    HOHMANNTRANSFERELLIPTIC(rInitial, rFinal, aInitial, aFinal, MU)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Computes velocities required to achieve a two-burn Hohmann transfer
%%% between two ellipitcal orbits. Assume:
%%%     - Burns only occur at 0 deg or 180 deg
%%%     - Semi-major axes must be aligned
%%%
%%% Input:  rInitial    -   Initial orbit radius
%%%           rFinal    -   Final orbit radius
%%%         aInitial    -   Semi-major axis of starting orbit
%%%           aFinal    -   Semi-major axis of destination orbit
%%%               MU    -   Gravitational parameter km^3/s^2
%%%
%%% Output:   aTrans    -   Semi-major axis of transfer orbit
%%%         tauTrans    -   Transfer time
%%%              dva    -   Burn 1 to get out of initial orbit
%%%              dvb    -   Burn 2 to achieve final orbit
%%%               dv    -   Total change in velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Transfer orbit semi-major axis
aTrans   = (rInitial + rFinal) / 2;

% Tangential velocity before 1st burn
vInitial = sqrt(2 * MU / rInitial - MU / aInitial);

% Velocity required to enter transfer orbit
vTransA  = sqrt(2 * MU / rInitial - MU / aTrans);

% Velocity required to enter destination orbit
vFinal   = sqrt(2 * MU / rFinal - MU / aFinal);

% Velocity in transfer orbit before 2nd burn
vTransB  = sqrt(2 * MU / rFinal - MU / aTrans);

% 1st Burn
dva      = vTransA - vInitial;

% 2nd Burn
dvb      = vFinal - vTransB;

% Total velocity change
dv       = abs(dva) + abs(dvb);

% Transfer time
tauTrans = pi * sqrt(aTrans^3 / MU);
end