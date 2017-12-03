function [theta1 theta2 theta3] = inverseFunction(x, y, z)
    l1 = 5; % shoulder to elbow inches
    l2 = 5; % elbow to wrist inches
    l3 = 3; % wrist to end effector center inches
    
    Rotation = [0 1 0
                -1 0 0
                0 0 1];
    
    originWrist = [x y z] - l3*Rotation * transpose([ 0 0 1]);
    theta1 = atan2(yWrist, xWrist);
    theta2 = 
    
    
end
