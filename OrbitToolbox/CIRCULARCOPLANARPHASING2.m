function [tauWait, dv, aTrans] = CIRCULARCOPLANARPHASING2(aIntercept, aTarget, phase1, k, mu) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Computes coplanar phasing (different orbits) for Interceptor to reach
%%% Target
%%%
%%% Input: aIntercept    -   Interceptor semi-major axis
%%%           aTarget    -   Target orbit semi-major axis
%%%            phase1    -   Initial phase angle
%%%                 k    -   Revolutions
%%%                mu    -   Gravitational parameter
%%%
%%% Output:   tauWait    -   Transfer time
%%%                dv    -   Total change in velocity
%%%            aTrans    -   Phasing orbit semi-major axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

w_tgt    = sqrt(mu / aTarget^3);
w_int    = sqrt(mu / aIntercept^3);
aTrans   = (aIntercept + aTarget) / 2;
tauTrans = pi * sqrt(aTrans^3 / mu);
aL       = w_tgt * tauTrans;
phase2   = pi - aL;
tauWait  = (phase2 - phase1 + 2 * pi * k) / (w_int - w_tgt);
dv1      = abs(sqrt(2 * mu / aIntercept - mu / aTrans) - sqrt(mu / aIntercept));
dv2      = abs(sqrt(2 * mu / aTarget - mu / aTrans) - sqrt(mu / aTarget));
dv       = dv1 + dv2;

end

