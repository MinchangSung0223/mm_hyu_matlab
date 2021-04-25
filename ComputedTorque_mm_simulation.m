load parameter_mm.mat
dt = 0.001
Tf = 5
N = Tf/dt
ddthetalist=[0;0;0;0;0;0;0;0;0];
theta_list = []
dtheta_list = []
ddthet_list= []
time_list =[]
n = 0;
% Kp= 10,Ki =300,Kd =20
thetalistd = [pi/2;0.1;0.1;0;pi/3;0;pi/3;0;0];
dthetalistd = [0;0;0;0;0;0;0;0;0];
ddthetalistd = [0;0;0;0;0;0;0;0;0];
eint = [0;0;0;0;0;0;0;0;0];
for t = linspace(0,Tf,N)
 e = thetalistd - thetalist;
 taulist = ComputedTorque(thetalist, dthetalist,eint, g, Mlist_, Glist, Slist,thetalistd,dthetalistd,ddthetalistd,10,300,20);
ddthetalist = ForwardDynamics(thetalist, dthetalist, taulist, g, Ftip, Mlist_, Glist, Slist);   
[thetalistNext, dthetalistNext]  = EulerStep(thetalist, dthetalist, ddthetalist, dt);
thetalist = thetalistNext;
 dthetalist = dthetalistNext;
 if mod(n,10)==0
 drawFK_mm(Slist,Mlist,thetalist,0,fv);
 set(gcf, 'OuterPosition', [0, 0, 1920, 1080])
 end
 n = n+1;
  eint = eint+e*dt;
 time_list = [time_list ,t];
 theta_list=[theta_list,thetalist];
 dtheta_list=[dtheta_list,dthetalist];
 ddthet_list=[ddthet_list,ddthetalist];
end

figure(2);
plot(time_list,theta_list(1,:));
hold on;
plot(time_list,theta_list(2,:));
plot(time_list,theta_list(3,:));
plot(time_list,theta_list(4,:));
plot(time_list,theta_list(5,:));
plot(time_list,theta_list(6,:));
plot(time_list,theta_list(7,:));
plot(time_list,theta_list(8,:));
