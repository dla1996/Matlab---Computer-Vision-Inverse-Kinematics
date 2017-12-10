function moveWristDown(robot, wristDirPin, wristEnable)
    global HIGH LOW
    fprintf("Wrist | DOWN\n\r");
    writeDigitalPin(robot, wristDirPin, LOW);
    writeDigitalPin(robot, wristEnable,HIGH);
    pause(0.1);
    writeDigitalPin(robot, wristEnable, LOW);
    
end

function moveWristUp(robot, wristDirPin, wristEnable)
    global HIGH LOW
    fprintf("Wrist | UP\n\r");
    writeDigitalPin(robot, wristDirPin, HIGH);
    writeDigitalPin(robot, wristEnable,HIGH);
    pause(0.1);
    writeDigitalPin(robot, wristEnable, LOW);
    
end

function moveShoulderDown(robot, shoulderDirPin, shoulderEnable)
        global HIGH LOW 
        fprintf("Shoulder | Down\n\r");
        writeDigitalPin(robot, shoulderDirPin,LOW);
        writeDigitalPin(robot, shoulderEnable,HIGH);
        pause(0.1);
        writeDigitalPin(robot, shoulderEnable, LOW);
        
end

function moveShoulderUp(robot, shoulderDirPin, shoulderEnable)
        global HIGH LOW 
        fprintf("Shoulder | Up\n\r");
        writeDigitalPin(robot, shoulderDirPin,HIGH);
        writeDigitalPin(robot, shoulderEnable,HIGH);
        pause(0.1);
        writeDigitalPin(robot, shoulderEnable, LOW);
        
end

function moveElbowUp(robot, elbowDirPin, elbowEnable)
        global HIGH LOW
        fprintf("Elbow | UP\n\r");
        writeDigitalPin(robot, elbowDirPin,HIGH);
        writeDigitalPin(robot, elbowEnable,HIGH);
        pause(0.1);
        writeDigitalPin(robot, elbowEnable, LOW);
end
 
function moveElbowDown(robot, elbowDirPin, elbowEnable)
        global HIGH LOW 
        fprintf("Elbow | DOWN");
        writeDigitalPin(robot, elbowDirPin,LOW);
        writeDigitalPin(robot, elbowEnable,HIGH);
        pause(0.1);
        writeDigitalPin(robot, elbowEnable, LOW);
end

function moveWaistRight(robot, waistDirPin, waistEnable)
       
        global HIGH LOW
        fprintf("Waist | RIGHT");
        writeDigitalPin(robot, waistDirPin, HIGH);
        writeDigitalPin(robot, waistEnable, HIGH);
        pause(0.1);
        writeDigitalPin(robot, waistEnable, LOW);
end

function moveWaistLeft(robot, waistDirPin, waistEnable)
       
        global HIGH LOW
        fprintf("Waist | LEFT\n\r");
        writeDigitalPin(robot, waistDirPin, LOW);
        writeDigitalPin(robot, waistEnable, HIGH);
        
        pause(0.1);
        writeDigitalPin(robot, waistEnable, LOW);
end
