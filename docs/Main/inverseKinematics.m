function q = inverseKinematics(x, y);

% x = 3;
% y = 4;
% r alpha d theta
dhparams = [0   -pi/2   2 0;
            4   0       0   0;
            2.75   0       0   0;
            5.5   0       0   0;];

robot = robotics.RigidBodyTree;



body1 = robotics.RigidBody('body1');        % This is the waist m5
jnt1 = robotics.Joint('waist','revolute');
%jnt1.PositionLimits = [0, 3*pi/2];
jnt1.PositionLimits = [-pi/2, pi/2];

setFixedTransform(jnt1,dhparams(1,:),'dh');
body1.Joint = jnt1;

addBody(robot,body1, 'base');

body2 = robotics.RigidBody('body2');        % This is shoulder m4
jnt2 = robotics.Joint('shoulder','revolute');
%jnt2.PositionLimits = [0, pi];
jnt2.PositionLimits = [-3*pi/4, 3*pi/4];

body3 = robotics.RigidBody('body3');        % This is elbow m3
jnt3 = robotics.Joint('elbow','revolute');
%jnt3.PositionLimits = [0, 5*pi/3];
jnt3.PositionLimits = [-5*pi/6, 5*pi/6];

body4 = robotics.RigidBody('body4');        % This is wrist m2
jnt4 = robotics.Joint('wrist','revolute');
jnt4.PositionLimits = [-pi/3, pi/3];

body5 = robotics.RigidBody('body5');        % This is grip m1
tool0 = robotics.Joint('endeffector','fixed');



setFixedTransform(jnt2,dhparams(2,:),'dh');
setFixedTransform(jnt3,dhparams(3,:),'dh');
setFixedTransform(jnt4,dhparams(4,:),'dh');

body2.Joint = jnt2;
body3.Joint = jnt3;
body4.Joint = jnt4;
body5.Joint = tool0;

addBody(robot,body2,'body1')
addBody(robot,body3,'body2')
addBody(robot,body4,'body3')
addBody(robot,body5,'body4');

%showdetails(robot)

gik = robotics.GeneralizedInverseKinematics;    
gik.RigidBodyTree = robot;

limitJointChange = robotics.JointPositionBounds(robot);

gik.ConstraintInputs = {'position','joint'};

posTgt = robotics.PositionTarget('body5');
posTgt.TargetPosition = [x y 0];

% aimCon = robotics.AimingConstraint('body5');
% aimCon.TargetPoint = [x y 0];

q0 = homeConfiguration(robot); % Initial guess for solver
[q,solutionInfo] = gik(q0,posTgt, limitJointChange);

f = show(robot,q);
title(['Solver status: ' solutionInfo.Status])
axis([-7,7,-11,11,-10,10])
%show(robot);
%axis([-5,5,-5,5,-5,5])
axis on

clickedPt = get(f,'CurrentPoint');
VMtx = view(f);
point2d = VMtx * [clickedPt(1,:) 1]';
disp(point2d(1:3)')
end
