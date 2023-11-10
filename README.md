# fuzzy-cruise-controller-

Background 
One of the main applications of fuzzy systems is to control systems. In this module, we developed a controller for an inverted pendulum. In this workshop, you will implement a cruise control system. If you get stuck, you could take a look at the inverted pendulum controller solution. 
On Blackboard attached to the Workshop plan item in , you will find a set of MATLAB m-files (in the zip file CruiseControl.zip) that simulate a vehicle travelling over a hilly terrain, using a cruise control system to maintain constant speed. The diagram below shows how this scenario is modelled.

The vehicle (the red dot) is travelling from left to right. The forces acting on it are a drag force (air resistance, friction, etc.) that tend to slow the vehicle, gravity, which tends to slow down (uphill) or speed up the vehicle (downhill), and the force being applied by the engine and brakes of the vehicle.
The cruise control system tries to keep the speed of the car at a constant value of 20 m/s. While other choices are possible, these are the fuzzy variables that you will use:

Inputs (sensors):
speederror: this is the actual speed minus the target speed. For example, if the actual speed is 25 m/s, then the speed error is 5 m/s. If the actual speed is 15 m/s, then the speed error is -5 m/s. Thus, speed error can be positive or negative! An advantage to using speed error instead of speed, is that the target speed can be changed without having to change the fuzzy rules. speederror is computed as
speedError= current_speed - target_speed;
acceleration: notice that this is a measurement - it measures how fast the car is speeding up or slowing down – and not a control action– i.e. it is not how hard the control system is pushing on the car’s accelerator!
Outputs (controls):
orcechange: the control system will already be applying some force, which could be either pressing on the accelerator, or pressing on the brake. This output variable determines whether more force or less force needs to be applied. This is not the same thing as how much force is applied. If it is positive, this means “apply more force”. That could mean pressing harder on the accelerator, or easing off on the brake, or switching from the brake to the accelerator. If it is negative, this means “apply less force”. An advantage to using force change instead of force is that the rules will be easier to construct – e.g. “If the car is going too fast, apply lessforce
