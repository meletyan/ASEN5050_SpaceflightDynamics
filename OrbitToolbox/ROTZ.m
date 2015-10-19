function dcm = ROTZ(theta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Direction cosine matrix rotation about axis 3
%%%
%%% Input:    theta    -   Rotation angle about axis 3 (Z)
%%%
%%% Output:     dcm    -   Direction cosine matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

st = sin(theta);
ct = cos(theta);

dcm = [ ct st 0;
       -st ct 0;
        0  0  1];

end

