function [theta1, theta2, theta3] = inverse_kinematics(X, Y, Z)

L2 = 0.094;
L3 = 0.180;

theta1 = atan2d(Y, X);

d = sqrt(X^2 + Y^2 + Z^2);
alpha = atan2(Z, sqrt(X^2 + Y^2));

cos_beta = (L2^2 + d^2 - L3^2) / (2 * L2 * d);
beta = atan2(sqrt(1 - cos_beta^2), cos_beta);

theta2 = rad2deg(alpha + beta);

cos_k = (L2^2 + L3^2 - d^2) / (2 * L2 * L3);
k = atan2(sqrt(1 - cos_k^2), cos_k);

theta3 = 180 - rad2deg(k);
end
