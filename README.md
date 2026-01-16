# Robotic Arm Kinematics & Trajectory Planning

## Description
This repository implements a complete motion-control pipeline for a **3-DOF robotic arm**, covering **forward kinematics**, **analytical inverse kinematics**, and **Cartesian-space trajectory planning**.  
The system enables smooth, repeatable **pick-and-place operations**, with validation in MATLAB and real-time execution on Arduino hardware.

## Demonstrations

<p align="center">
  <img src="gif/ezgif.com-speed.gif" width="450">
</p>

<p align="center">
  <img src="gif/robotic_arm-ezgif.com-optimize.gif" width="450">
</p>


---

## Project Scope
- Forward kinematics using Denavit–Hartenberg parameters  
- Closed-form geometric inverse kinematics (elbow-up configuration)  
- Cartesian trajectory planning using cubic polynomials  
- Real-time joint control on Arduino  
- Experimental validation against physical measurements  

---

## Robot Configuration
- **Degrees of Freedom:** 3 (revolute joints)  
- **End Effector:** Gripper  
- **Link Lengths:**  
  - L1 = 0.094 m  
  - L2 = 0.180 m  

The robot operates in full 3D Cartesian space.

---

## Forward Kinematics
Forward kinematics computes the end-effector position from joint angles using homogeneous transformation matrices derived from the **Denavit–Hartenberg convention**.

Validation was performed by comparing MATLAB predictions with measured physical positions of the gripper.

**File:**  
`MATLAB/forward_kinematics.m`

---

## Inverse Kinematics
Inverse kinematics is solved analytically using a **geometric approach**.  
The solution supports both elbow-up and elbow-down configurations; the elbow-up solution is used for hardware execution due to improved workspace stability.

Joint angles are derived from trigonometric relationships and the cosine rule.

**File:**  
`MATLAB/inverse_kinematics.m`

---

## Trajectory Planning
To avoid abrupt motion, Cartesian trajectories are generated using **cubic polynomial interpolation** with zero velocity boundary conditions.

Key properties:
- Continuous position and velocity  
- Reduced mechanical stress  
- Straight-line Cartesian motion  

Trajectories are generated independently in X, Y, and Z axes and sampled at fixed time intervals.

**File:**  
`MATLAB/trajectory_planning.m`

---

## Embedded Implementation (Arduino)
The Arduino implementation executes Cartesian trajectories in real time by:
1. Generating Cartesian waypoints  
2. Applying inverse kinematics at each timestep  
3. Driving servo motors with computed joint angles  

Memory usage was optimised to ensure stable execution on constrained hardware.

**File:**  
`Arduino/trajectory_control.ino`

---

## Results
- Accurate agreement between analytical models and physical measurements  
- Smooth pick-and-place motion within the robot workspace  
- Reduced jerky motion compared to linear time interpolation  

Limitations identified include gravity-induced deflection and residual jerk inherent to cubic trajectories.

---

## Future Work
- Quintic polynomial trajectory planning (zero jerk)  
- Gravity compensation  
- Closed-loop feedback (encoders / vision)  
- Collision avoidance and workspace optimisation  

---

## Technologies
- MATLAB (kinematics, simulation, validation)  
- Arduino (real-time control)  
- Servo motor actuation  

---

## License
This project is provided for **educational and portfolio purposes**.
