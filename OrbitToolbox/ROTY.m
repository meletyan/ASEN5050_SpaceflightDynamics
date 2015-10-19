function dcm = ROTY(theta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Direction cosine matrix rotation about axis 2
%%%
%%% Input:    theta    -   Rotation angle about axis 2 (X)
%%%
%%% Output:     dcm    -   Direction cosine matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

st = sin(theta);
ct = cos(theta);

dcm = [ ct 0 st;
        0  1 0;
       -st 0 ct];

end

