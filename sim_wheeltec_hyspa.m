addpath("mr")
addpath("mesh")
robot = importrobot('mm_hyu.urdf')
conf = homeConfiguration(robot);
show(robot,conf,'visuals','on','collision','off');