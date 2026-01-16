function [X, Y, Z, t] = trajectory_planning(p0, pf, tf)

t = linspace(0, tf, 50)';

a2 = 3*(pf - p0)/tf^2;
a3 = -2*(pf - p0)/tf^3;

X = p0(1) + a2(1)*t.^2 + a3(1)*t.^3;
Y = p0(2) + a2(2)*t.^2 + a3(2)*t.^3;
Z = p0(3) + a2(3)*t.^2 + a3(3)*t.^3;
end
