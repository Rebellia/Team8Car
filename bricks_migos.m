%***** CONNECT THE BRICK ******

%global key;
%InitKeyboard();

while 1
    % ************** KEYBOARD CONTROL ***********
    
    MoveForward;
    distance = brick.UltrasonicDist(3);
    
    if distance <= 80
        
        if distance <= 8
                display(distance);
                display('Too close');
                brick.MoveMotor('B', -20);%move away
       else
            display(distance);
            display('Too far');
            brick.StopAllMotors();
            brick.MoveMotor('B',-60); %move towards
            
        end
    else
        %MoveForward;
        display(distance);
        display('Turn here');
        pause(1);
        RightTurn;
        MoveForward;
        pause(2);
    end
       

 
 
    %******* Check if touch sensor is enabled *******
    touch = brick.TouchPressed(4);
    if touch
      brick.beep();
      brick.StopAllMotors();
      pause(1);
      Reverse;
      %Use ultrasonic to catch distance
      %distance = brick.UltrasonicDist(3);
      %display(distance);
      if distance > 80 %if distance is greater than 2-ish feet
         RightTurn;
         MoveForward;
         pause(2);
      else
          LeftTurn;
          MoveForward;
          pause(2);
      end
    end
    
    %Use color sensor to check if red light
    color = brick.ColorColor(2);
    %display(color);
    if color == 5 % 5 means red
        brick.StopAllMotors();
        pause(2);
    end
    
    %if color == 3 %GREEN FOR TESTING PURPOSES
        %ManualControl;
    %end
        
end


%DISCONNECT THE BRICK
%Disconnect;