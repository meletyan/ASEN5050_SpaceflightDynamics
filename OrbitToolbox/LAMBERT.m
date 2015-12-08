function [v0, v, fail]  =  LAMBERT(r0, r, dt, tm, mu)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Solve the Lambert problem for interplanetary trajectory using the
%%% Universal Variables solution. Section 7.6.2, Algorithm 58.
%%%
%%% Input:        r0     -    Initial position vector (km)
%%%               r1     -    Final position vector (km)
%%%               dt     -    Transfer time (s)
%%%               tm     -     + 1 for short way,  - 1 for long way
%%%               mu     -    Gravitational parameter (km^3 / s^2)
%%%
%%% Output:       v0     -    Initial velocity vector (km / s)
%%%               v1     -    Final velocity vector (km / 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fail = 0;

cosnu = dot(r0,r) / (norm(r0) * norm(r));
A     = tm * sqrt(norm(r) * norm(r0) * (1 + cosnu));

if abs(A) < 1e-12
    error('Cannot calculate this orbit.')
end

psiup  = 4 * pi^2;
psilow =  -4 * pi;
psi    = (psilow + psiup) / 2;

[c2, c3] = findc2c3(psi);
deltnow  = 1e9;
counter  = 0;
maxtries = 1e4;

while abs(deltnow - dt) > 1e-6 && ~fail
    
    if counter > maxtries
        fail = 1;
        display(['Gave up after ' num2str(maxtries) ' iterations.'])
    else
        counter = counter + 1;
    end
    
    y = norm(r0) + norm(r) + A * (psi * c3 - 1) / sqrt(c2);
    
    if A > 0 && y < 0
        while norm(r0) + norm(r) + A * (psilow * c3 - 1) / sqrt(c2) < 0
            psilow = psilow + 0.1;
        end
        display(['Readjusted philow to ' num2str(psilow)])
        counter = 0;
        deltnow = 1e9;
    else
        
        chi = sqrt(y / c2);
        deltnow = (chi^3 * c3 + A * sqrt(y)) / sqrt(mu);
        
        if deltnow <= dt
            psilow = psi;
        else
            psiup = psi;
        end
        
    end
    
    psi      = (psilow + psiup) / 2;
    [c2, c3] = findc2c3(psi);
    
end

if ~fail
    f  = 1 - y / norm(r0);
    gd = 1 - y / norm(r);
    g  = A * sqrt(y / mu);
    v0 = (r - f * r0) / g;
    v  = (gd * r - r0) / g;
else
    v0 = 0;
    v  = 0;
end


end

% function [c2,c3]=findc2c3(psi)
% find variables c2, c3 for Lambert targeting

function [c2, c3] = findc2c3(psi)

if psi > 1e-6    
    c2=(1-cos(sqrt(psi)))/psi;
    c3=(sqrt(psi)-sin(sqrt(psi)))/sqrt(psi^3);    
else   
    if psi < -1e-6        
        c2=(1-cosh(sqrt(-psi)))/psi;
        c3=(sinh(sqrt(-psi))-sqrt(-psi))/sqrt((-psi)^3);        
    else        
        c2=1/2;
        c3=1/6;        
    end    
end

end