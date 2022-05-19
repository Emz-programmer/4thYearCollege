# Sensors

## Types of Sensor
- **Propriocpetive:** Measures internal state of system. (Eg. Gyroscope)
- **Exteroceptive:** Measures external environment. (Eg. GPS)

- **Passive:** Measures ambient environment. (Eg. Camera)
- **Active:** Measures response of environment to energy emitted from a sensor. (Eg. Ultrasonic sensor)

## Sensor Performance
Remember SCEAP!
- **Sensitivity:** Degree to which change in target input results in a sensor output.
- **Cross-Sensitivity:** Sensitivity to external disturbance from environment.
- **Error:** Deviation between actual and measured value
	2 main types of error:
	- Systematic: Errors that can be modeled and compensated for.
	- Random: Error that can be modeled probabilistically.
	````
	Error = m - v

	m = measured value
	v = actual value
	````


- **Accuracy:** Conformity between actual value and measured value.
	````
	accuracy = 1 - (|error|/v)
	````
- **Precision:** Degree of agreement between multiple measurements of the same environment state.
	![[Pasted image 20220519170550.png]]
	![[Pasted image 20220519170645.png]]
	
## Sensors 
### Wheel Encoders
#### Optical Encoder
Disk attached to the wheel shaft with periodic pattern of opaque and transparent regions. Light source on one side of disk with a sensor on the other. Wheel rotation produces a series of pulses proportional to the rate of rotation. To get direction a Quadrature incremental encoder is used. This has 2 patterns that are 90 degrees out of phase.
![[Pasted image 20220519200157.png]]
![[Pasted image 20220519200900.png]]
	
### Digital Compass
Uses Hall effect or Flux gate. 
Hall effect:
	- Voltage induces current across semiconductor.
	- Magnetic field perturbs electrons, inducing a second voltage difference perpendicular to the flow.
	
![[Pasted image 20220519195043.png]]	 
	 

### Gyroscopes
Provides orientation or angular velocity (Rate Gyro).
#### Mechanical
- Spinning proof mass.
- Maintains orientation due to conservation of angular momentum.
![[Pasted image 20220519200943.png]]
#### Fibre Optic
- Based off Sagnac effect.
- Coherent laser is passed simultaneously though opposite ends of a fibre optic.
- Rotation causes path shortening opposite to direction of rotation.
- Path shortening causes a phase shift.
![[Pasted image 20220519200955.png]]
#### MEMS
MicroElectroMechanical System are small scale IC based angular velocity sensing gyros.
- Vibrating mass to sense Coriolis acceleration in direction of rotation.
- **Coriolis sense fingers** measure the capacitive transduction do to deflection of the inner frame relative to the outer frame
![[Pasted image 20220519201010.png]]
### Accelerometers
Measure linear accelerations using something similar to a spring-mass-damper.
````
k = spring constant
x = displacement of mass
a = acceleration of accelerometer
g = acceleration due to gravity
m = mass of proof mass

a + g = kx/m
````
![[Pasted image 20220519201029.png]]
### Intertial Measurement Units
IMU's (aka INS) combines 3 gyros and 3 axes accelerometers to calculate relative position, velocity, and acceleration. Can also contain GPS to combine several mesurements for better results. Can be used in a GPS outage.
![[Pasted image 20220519201048.png]]
### Global Navigation Satelite System
System of satellites that transmit positioning and timing data to recievers.
- Satellites transmit synchronised signals based on accurate clocks
- Signal is a 1023 pseudo random number (PRN)
- Reciever computers propagation time by evaluating shift of PRN  relative to time t=0
````
d = ct

computing d for multiple satellites allows trilateration of position
````
- 3 satellites for position plus one for time sync
### Ultrasonic Sensors
Emits ultrasonic waves and computes distance based on RTT. Low frequency = higher range. Can have poor angular resolution and low bandwidth.
````
d = (ct)/2
c = 343m/s
t = time
````
![[Pasted image 20220519201115.png]]
### Lidar
Calculates distance based on a ToF sensor. 
- Emits laser pulse
- Laser pulses reflect from the scene
- High speed system measures RTT
Rotating a 2D lidar system or combining multiple lasers can achieve a 3D scan.
![[Pasted image 20220519201134.png]]
### RGBD
Red Green Blue Distance. Used to enable depth sensing with cameras. 
#### Structured Light
Image data combined with IR camera data. Based on optical triangulation. Bypasses feature maching though projecting a known pattern. Depth is determined by:
````
d = (bf)/m
b = baseline
f = focal length
m = desparity
````
- Low cost, high FPS
- Sunlight causes interferance. ToF limited to spatial resolution.
- Used in Kinect V1
![[Pasted image 20220519201228.png]]
#### ToF
Uses high speed near infrared (NIR) light source. Sensor measures reflected illumination. Light is pulsed at period $\Delta$t. Every pixel samples in 2 out of phase time windows C1 and C2. 
![[Pasted image 20220519205234.png]]
![[Pasted image 20220519201241.png]]