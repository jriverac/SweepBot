// These constants may be different for your servo
const SERVO_MIN = 0.03;
const SERVO_MAX = 0.1;

// Create global variable for the pin to which the servo is connected
// then configure the pin for PWM
servo <- hardware.pin7;
servo.configure(PWM_OUT, 0.02, SERVO_MIN);

// Define a function to control the servo.
// It expects a value between 0.0 and 1.0 to be passed to it
function setServo(value) {
    local scaledValue = value * (SERVO_MAX - SERVO_MIN) + SERVO_MIN;
    servo.write(scaledValue);
}

// Define a function to control the servo.
// It expects an angle value between -80.0 and 80.0

function setServoDegrees(value) {
    local scaledValue = (value + 81) / 161.0 * (SERVO_MAX - SERVO_MIN) + SERVO_MIN;
    servo.write(scaledValue);
}

// Set the initial position (we'll flip between 0 and 1)
position <- 0;

// Define a function to loop through the servo position values
function sweep() {
    // Write the current position
    setServo(position);

    // Invert the position
    position = 1.0 - position;

    // Call the function again (ie. loop) in half a second:
    imp.wakeup(1.0, sweep);
    server.log(position);
}

// Start the ball rolling by calling the loop function

// sweep();

// setServoDegrees(-80);

//setServoDegrees(80);

// setServoDegrees(80);