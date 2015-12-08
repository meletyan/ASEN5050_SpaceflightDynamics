function [omgd inct] = PLOTSEC(r, R, Mu, J2, omgt)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plot secular rate of change of RAAN. Default plot over 0:180 degree
%%% inclinations. Set up for circular orbits only.
%%%
%%% Input:         r    -   Orbit radius (km)
%%%                R    -   Equatorial radius (km)
%%%               Mu    -   Gravitational parameter (km^3/s^2)
%%%               J2    -   J2 Perturbation
%%%             omgt    -   Sun-Synchronous target (deg/day)
%%%
%%% Output:     omgd    -   Secular rate of change of RAAN (deg/day)
%%%             inct    -   Target inclination for sun-synchronous (deg)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p    = r;
n    = sqrt(Mu / r^3);
inc  = 0:0.0001:180;           

% Analysis
num  = -3 * n * R^2 * J2;
den  = 2 * p^2;
ci   = cosd(inc);
omgd = rad2deg(num / den * ci) * 86400;
[~,ind] = min(abs(omgd - omgt));
inct = inc(ind);

if inct == 180
    inct = NaN;
end

figure(1)
hold on
plot(inc, omgd, 'linewidth', 1);
% plot(inct, omgt, 'o', 'markersize', 12);
% line([0 180], [omgt omgt], 'color', 'r');
% line([inct inct], [-8 8], 'color', 'r');
title('Sun-Synchronous Daily Nodal Regression');
xlabel('Inclination (deg)');
ylabel('Daily Nodal Regression (deg/day)');



end

