function [tauPhase, dv, aPhase] = CIRCULARCOPLANARPHASING(aTarget, phaseAngle, kTarget, kIntercept, mu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Computes coplanar phasing (same orbit) for Interceptor to reach Target
%%%
%%% Input:   aTarget    -   Target orbit semi-major axis
%%%       phaseAngle    -   Phase angle measured from Target to Intercept
%%%          kTarget    -   Target revolutions
%%%       kIntercept    -   Intercept revolutions
%%%               mu    -   Gravitational parameter
%%%
%%% Output: tauPhase    -   Transfer time
%%%               dv    -   Total change in velocity
%%%           aPhase    -   Phasing orbit semi-major axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

w_tgt    = sqrt(mu / aTarget^3);
tauPhase = (2 * pi * kTarget + phaseAngle) / w_tgt;
aPhase   = (mu * (tauPhase / 2 / pi / kIntercept)^2)^(1 / 3);
dv       = 2 * abs(sqrt(2 * mu / aTarget - mu / aPhase) - sqrt(mu / aTarget));


end

