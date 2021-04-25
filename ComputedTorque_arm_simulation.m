load parameter.mat
dt = 0.001
Tf = 2
N = Tf/dt
ddthetalist=[0;0;0;0;0;0];
theta_list = []
dtheta_list = []
ddthet_list= []
time_list =[]
n = 0;
% Kp= 10,Ki =300,Kd =20
for t = linspace(0,Tf,N)

taulist = ComputedTorque(thetalist, dthetalist,[pi/2;pi/2;pi/2;pi/2;pi/2;pi/2], g, Mlist_, Glist, Slist,[0;0;0;0;0;0],[0;0;0;0;0;0],[0;0;0;0;0;0],10,300,20);
ddthetalist = ForwardDynamics(thetalist, dthetalist, taulist, g, Ftip, Mlist_, Glist, Slist);   
[thetalistNext, dthetalistNext]  = EulerStep(thetalist, dthetalist, ddthetalist, dt);
thetalist = thetalistNext;
 dthetalist = dthetalistNext;
 if mod(n,20)==0
 drawFK(Slist,Mlist,thetalist,1,fv);
 set(gcf, 'OuterPosition', [0, 0, 1920, 1080])
 end
 n = n+1;
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
