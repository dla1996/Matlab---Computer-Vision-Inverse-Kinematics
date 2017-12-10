
%   RRRR robot arm. 4DOF
%   Geometric approach to inverse kinematics.
%
%function [theta1RAD theta2 theta3 theta4] = inverseFunction(x, y, z)
x = 1;
y = 2;
z = 3;

endEffector = [x y z]
L1 = 5; % shoulder to elbow inches
L2 = 5; % elbow to wrist inches
L3 = 3; % wrist to end effector center inches


r = [0 0 1];

Rotation = [0 1 0
            -1 0 0
            0 0 1];
a = (Rotation * transpose(r));

originWrist = transpose(endEffector) - L3*(Rotation * transpose(r)); % Get the wrist center

xWrist = originWrist(1);    %
yWrist = originWrist(2);

theta1RAD = atan2(y, x);
theta1DEG = theta1RAD * 180 / pi;

alphaDegree = acos((L2^2 + sqrt(xWrist^2 + yWrist^2) - L3^2)/(2*L2*sqrt(xWrist^2 + yWrist^2))); % Angle from link 1 to wrist center
theta2RAD = atan2(yWrist, xWrist) - atan2(sqrt(1 - cos(alphaDegree)), cos(alphaDegree));    % Angle from base frame to link 2
theta2DEG = theta2RAD * 180 / pi;

betaDegree = acos((L2^2 + L3^2 - sqrt(L2^2+L3^2))/(2*L2*L3));   % 
theta3RAD = pi - atan2(sqrt(1 - cos(betaDegree)), cos(betaDegree)); % Angle from link 2 to wrist center
theta3DEG = theta3RAD * 180 / pi;
    


%end
