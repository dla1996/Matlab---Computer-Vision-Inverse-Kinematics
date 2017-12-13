%%CREATES AN ANIMATION OF INVERSE KINEMATICS FOLLOWING A CIRCLE
%NEED TO EDIT IT TO FOLLOW OUR FACE, AND ADD A LINE TO MOVE UP IN Z-AXIS
%WHEN PIXEL VALUE == 0
%sets position of pen based on input trace array

     
%create blank robot
%function position(numberOfPixels, Xcoordinates, Ycoordinates)
robot = robotics.RigidBodyTree('DataFormat','column','MaxNumBodies',3);

%define lengths
L2=4;
L3=2.75;
L4=5.5;
%Lpen=4.8125;
Lpen = 2.5;
%set dh parameters of robot
dhparams = [0   -pi/2   2 0;
            L2   0       0   0;
            L3   0       0   0;
            L4 0   0   0;
            Lpen -pi/2 0 0;];%pen

%setup waist
body = robotics.RigidBody('waist'); 
joint = robotics.Joint('waist', 'revolute');
joint.PositionLimits=[-pi/2,pi/2];
setFixedTransform(joint,dhparams(1,:),'dh');
body.Joint = joint;
addBody(robot, body, 'base');

%setup shoulder
body = robotics.RigidBody('shoulder');
joint = robotics.Joint('shoulder','revolute');
%joint.PositionLimits=[-3*pi/4,3*pi/4];
joint.PositionLimits=[-pi,pi];
setFixedTransform(joint, dhparams(2,:),'dh');
body.Joint = joint;
addBody(robot, body, 'waist');

%setup elbow
body = robotics.RigidBody('elbow');
joint = robotics.Joint('elbow','revolute');
joint.PositionLimits=[-5*pi/6,5*pi/6];
setFixedTransform(joint, dhparams(3,:),'dh');
body.Joint = joint;
addBody(robot, body, 'shoulder');

%setup wrist
body = robotics.RigidBody('wrist');
joint = robotics.Joint('wrist','revolute');
%joint = robotics.Joint('wrist','fixed');
joint.PositionLimits=[-pi/3,pi/3];
setFixedTransform(joint, dhparams(4,:),'dh');
body.Joint = joint;
addBody(robot, body, 'elbow');

% %setpen as end effector
%MAY NOT HAVE ACCURATE DIMENSIONS/DH PARAMETERS
 body = robotics.RigidBody('pen');
 joint = robotics.Joint('fix1','fixed');
 setFixedTransform(joint, dhparams(5,:),'dh');
 body.Joint = joint;
 addBody(robot, body, 'wrist');

 
 limitJointChange = robotics.JointPositionBounds(robot);
 
%create theta variables
theta1=0;
theta2=0;
theta3=0;
theta4=0;
numberOfPixels = length(convertArrayX);
% We may not have to use this part, but it may help
t = (0:0.2:10)'; % Time
count = numberOfPixels;
%count = length(t);
%count = length(Xcoordinates);
center = [4 4 0];
radius = 1;
theta = t*(2*pi/t(end));
points = center + radius*[cos(theta) sin(theta) zeros(size(theta))];

q0 = homeConfiguration(robot);
ndof = length(q0);
qs = zeros(count, ndof);

gik = robotics.GeneralizedInverseKinematics('RigidBodyTree',robot);
gik.ConstraintInputs = {'joint', 'position'};
%weights = [0, 0, 0, 1, 1, 0];

endEffector = 'pen';
posTgt = robotics.PositionTarget(endEffector);

Ycoordinates = convertArrayY;
Xcoordinates = convertArrayX;
% pixelArray = [Xcoordinates; Ycoordinates];
%pixelArray = edges;
qInitial = q0; % Use home configuration as the initial guess

z = 0;
for i = 5:(numberOfPixels - 10) % start from 5 because the first 5 points are weird and the last 10 are weird.
    %j = 1;
    %while j < columns
        i
        
        
        % Solve for the configuration satisfying the desired end effector
        % position
        
        
        %point = [((i-(rows/2)) * 5 / (rows/2)), (j * 3 / columns + 2), z];  % With j, if j = columns, then 3 is the max + 2, 5.
                                                                            % If j = 1; Point will start at 2.
        point = [Xcoordinates(i,1), Ycoordinates(i,1), z];
      
        %point = points(i,:);
        posTgt.TargetPosition = point;
        %qSol = gik(endEffector,trvec2tform(point),weights,qInitial);
        qSol = gik(qInitial, limitJointChange,posTgt);
        % Store the configuration
        qs(i,:) = qSol;
        % Start from prior solution
        qInitial = qSol;
        z = 0;
%         if i ~= numberOfPixels
%             if(abs(Ycoordinates(i+1) - Ycoordinates(i)) > 20*pixelPerInchY)
%                 z = 0.2;
%             end
%         end
%         
%         if (abs((Ycoordinates(i) - Ycoordinates(i + 1))) > 0.1)
%             z=.2;
%         end
%         
%         if ()==1
%             z=0; 
%         end
        
        %j = j + 3;
    %end
    
end

figure
show(robot,qs(1,:)');
view(2)
ax = gca;
ax.Projection = 'orthographic';
hold on

scatter(Xcoordinates,Ycoordinates);
%axis([-0.1 0.7 -0.3 0.5]);

framesPerSecond = 15;
r = robotics.Rate(framesPerSecond);
    for i = 1:count
        i
        show(robot,qs(i,:)','PreservePlot',false);
        drawnow
        waitfor(r);
    end

%end
