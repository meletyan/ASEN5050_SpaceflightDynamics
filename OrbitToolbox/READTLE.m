function OE = READTLE(tleFilename)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Read TLE text file with the following format example:
%%% 19-32	04236.56031392	Element Set Epoch (UTC)
%%% 3-7     25544           Satellite Catalog Number
%%% 9-16	51.6335         Orbit Inclination (degrees)
%%% 18-25	344.7760        Right Ascension of Ascending Node (degrees)
%%% 27-33	0007976         Eccentricity (decimal point assumed)
%%% 35-42	126.2523        Argument of Perigee (degrees)
%%% 44-51	325.9359        Mean Anomaly (degrees)
%%% 53-63	15.70406856     Mean Motion (revolutions/day)
%%% 64-68	32890           Revolution Number at Epoch 
%%%
%%% Input:   tleFilename    -   Text file containing TLE
%%%
%%% Output:           oe    -   Orbital elements;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mu  = 398600.4418;  % Standard gravitational parameter for the earth
fid = fopen(tleFilename, 'r');

while 1
    
    % Read first line
    tline  = fgetl(fid);
    if ~ischar(tline), break, end
    epochY = str2double(tline(19:20));                      % Epoch year
    epochD = str2double(tline(21:32));                      % Epoch day
    
    % read second line
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    inc   = str2double(tline(9:16));                        % Orbit Inclination (degrees)
    raan  = str2double(tline(18:25));                       % Right Ascension of Ascending Node (degrees)
    ecc   = str2double(strcat('0.',tline(27:33)));          % Eccentricity
    w     = str2double(tline(35:42));                       % Argument of Perigee (degrees)
    M     = str2double(tline(44:51));                       % Mean Anomaly (degrees)
    a     = (mu / (str2double(tline(53:63)) * 2 * pi / ...
           86400)^2 )^(1 / 3);                              % semi major axis
    rNo   = str2double(tline(64:68));                       % Revolution Number at Epoch 
    
    % Orbit elements data 8 dimension
    OE = [epochY epochD a ecc inc raan w M rNo];
    
end
fclose(fid);

end

