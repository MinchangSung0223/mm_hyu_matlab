addpath("mr")
addpath("mesh")
robot = importrobot('mm_hyu.urdf')
conf = homeConfiguration(robot);

conf(1).JointPosition=0
conf(2).JointPosition=0
conf(3).JointPosition=0
conf(4).JointPosition=0
conf(5).JointPosition=0
conf(6).JointPosition=0



show(robot,conf,'visuals','on','collision','off');
transform = getTransform(robot,conf,"SPA_Link_06")

