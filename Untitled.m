s = tf('s');
Kp = 300;Ki = 0;Kd = 0;
C = Kp+Ki*1/s+Kd*s;
P = 1/(s^2 + 10*s + 20);
t = 0:0.01:2;
T = feedback(C*P,1);
step(T,t)