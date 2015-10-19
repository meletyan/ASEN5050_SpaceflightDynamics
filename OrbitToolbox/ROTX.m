function dcm = ROTX(theta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Direction cosine matrix rotation about axis 1
%%%
%%% Input:    theta    -   Rotation angle about axis 1 (X)
%%%
%%% Output:     dcm    -   Direction cosine matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

st = sin(theta);
ct = cos(theta);

dcm = [1  0  0;
       0  ct st;
       0 -st ct];

end

