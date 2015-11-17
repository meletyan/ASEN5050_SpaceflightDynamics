%% Ed Meletyan
%  ASEN 5050
%  Midterm

%% Problem 3
clc; clear;

rE = 6378.1363;
muE = 398600.4415;

rss = (rE + 380);
r0 = [0; 0; 0];
va0 = [0; 0; 0.4];  % m/s relative to shuttle
vb0 = [0; 0.2; 0];  % m/s relative to shuttle

w = sqrt(muE / rss^3);
t = 8 * 60;

[ra1(1), ra1(2), ra1(3), va1(1), va1(2), va1(3)] = ...
    HILLSEQN(r0(1), r0(2), r0(3), va0(1), va0(2), va0(3), w, t);
[rb1(1), rb1(2), rb1(3), vb1(1), vb1(2), vb1(3)] = ...
    HILLSEQN(r0(1), r0(2), r0(3), vb0(1), vb0(2), vb0(3), w, t);

% Pos/Vel of A relative to b
t2 = 12 * 60;
rab = ra1 - rb1;
[vab(1), vab(2), vab(3)] = CWVELOCITY(rab(1), rab(2), rab(3), w, t2);
[rabf(1), rabf(2), rabf(3), vabf(1), vabf(2), vabf(3)] = ...
    HILLSEQN(rab(1), rab(2), rab(3), vab(1), vab(2), vab(3), w, t2);