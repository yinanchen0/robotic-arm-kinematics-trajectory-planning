#include <Servo.h>

Servo joint1, joint2, joint3;

void setup() {
  joint1.attach(3);
  joint2.attach(5);
  joint3.attach(6);
}

void loop() {
  float tf = 5.0;
  int steps = 50;

  float X0 = 0.0, Y0 = 0.18, Z0 = -0.094;
  float Xf = 0.1, Yf = 0.15, Zf = -0.2;

  for (int i = 0; i <= steps; i++) {
    float t = tf * i / steps;

    float s = 3*pow(t/tf,2) - 2*pow(t/tf,3);

    float X = X0 + s*(Xf - X0);
    float Y = Y0 + s*(Yf - Y0);
    float Z = Z0 + s*(Zf - Z0);

    float theta1 = atan2(Y, X) * 180.0 / PI;

    // Placeholder IK (replace with full IK if needed)
    float theta2 = 90;
    float theta3 = 90;

    joint1.write(theta1);
    joint2.write(theta2);
    joint3.write(theta3);

    delay(100);
  }

  delay(5000);
}
