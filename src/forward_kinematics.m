function P0 = forward_kinematics(theta1, theta2, theta3)
% Joint angles in degrees

L2 = 0.094;   % link length (m)
L3 = 0.180;

T01 = [cosd(theta1) -sind(theta1) 0 0;
       sind(theta1)  cosd(theta1) 0 0;
       0             0            1 0;
       0             0            0 1];

T12 = [cosd(theta2) -sind(theta2) 0 0;
       0             0            1 0;
      -sind(theta2) -cosd(theta2) 0 0;
       0             0            0 1];

T23 = [cosd(theta3) -sind(theta3) 0 L2;
      -sind(theta3) -cosd(theta3) 0 0;
       0             0           -1 0;
       0             0            0 1];

P3 = [L3; 0; 0; 1];
P0 = T01 * T12 * T23 * P3;
end
