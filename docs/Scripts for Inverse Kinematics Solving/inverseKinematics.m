function [theta1 theta2 theta3] = inverseFunction(x, y, z)
    L1 = 5; % shoulder to elbow inches
    lL2 = 5; % elbow to wrist inches
    L3 = 3; % wrist to end effector center inches
    
    Rotation = [0 1 0
                -1 0 0
                0 0 1];
    
    originWrist = [x y z] - L3*Rotation * transpose([0 0 1]);
    theta1 = atan2(yWrist, xWrist);
    theta2 = 
    
    
end
