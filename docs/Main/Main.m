global HIGH LOW;
HIGH = 1;
LOW = 0;

image = snapshot(camera); % webcam

[Xcoordinates, Ycoordinates] = getPixelCoordinates(image);

numberOfPixels = size(Xcoordinates);

for i = 1:numberOfPixels
    
    jointPositions = inverseKinematics(Xcoordinates(i,1), Ycoordinates(i,1));
    fprintf("X: %f | Y: %f\n", Xcoordinates(i,1), Ycoordinates(i,1));
    %fprintf(" %s: %f | %s: %f | %s: %f | %s %f\n", jointPositions(1, 1), jointPositions(1, 2),jointPositions(2, 1), jointPositions(2, 2),jointPositions(3, 1), jointPositions(3, 2), jointPositions(4, 1), jointPositions(4, 2));
end
