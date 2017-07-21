global key;
InitKeyboard();

% ************** KEYBOARD CONTROL ***********
while 1 
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotor('AB', -30); %move forward
        case 'downarrow'
            brick.MoveMotor('AB', 30); %move backwards
        case 'b'
            brick.beep();
        case 'leftarrow'
            brick.MoveMotor('A', -15); %move left
        case 'rightarrow'
            brick.MoveMotor('B', -15); %move right
        case 'a'
            brick.MoveMotor('D', 20); %move scoop up
        case 'd'
            brick.MoveMotor('D', -1); %move scoop down
        case 's'
            brick.StopAllMotors();
        case 'q'
            break; %exits the while loop
    end
end

CloseKeyboard();