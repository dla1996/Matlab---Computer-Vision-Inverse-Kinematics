dumbass = arduino();

%----------------- Grip stuff --------------------
gripPot = 0;
gripEnable = 43;        % Digital Pin number for grip enable % Blue
gripDirPin = 30;        % Pin number for grip direction pin  % Blue % HIGH = OPEN, LOW = CLOSE

%----------------- Wrist stuff -------------------
m1Pot = 4;        % Green wire
wristEnable = 42;       % Digital Pin number for wrist enable % Green
wristDirPin = 28;       % Pin number for wrist direction pin % Purple % HIGH = UP , LOW = DOWN
wristMax = 856;                 % Going down
wristMin = 0;                   % Goin up


%------------------ Elbow stuff ------------------
m2Pot = 1;        % Red wire
elbowEnable = 41;       % Digital Pin for elbow enable % Gray
elbowDirPin = 26;       % Pin number for elbow direction pin % Gray % 
elbowMax = 994;                 % Going down
elbowMin = 124;                 % Going up

%------------------ Shoulder stuff ------------------
m3Pot = 3;        % Yellow wire
shoulderEnable = 40;    % Digital Pin for shoulder enable % Purple
shoulderDirPin = 24;    % Pin number for shoulder direction pin % White
shoulderMax = 782;              % Going up
shoulderMin = 176;              % Going down

%------------------- Waist stuff -------------------
m4Pot = 2;        % Orange wire
waistEnable = 39;       % Digital Pin for waist enable % Orange
waistDirPin = 22;       % Pin number for waist direction pin % Black
waistMax = 825;                 % Going left
waistMin = 90;                  % Going right

%------------------- LED stuff ----------------------
LEDEnable = 38;         % Choose 1 or 0 to turn on or off  % Yellow

% Raw Analog values
gripVal = 0;
m1Val = 0;
m2Val = 0;
m3Val = 0;
m4Val = 0;




function [t4 t3 t2 t1] = inverseKinematics(x, y, z) 
    
    
end






















































