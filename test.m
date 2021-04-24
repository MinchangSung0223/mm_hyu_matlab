clc;
clear;
addpath("mesh","mr")
load parameter.mat

thetalist =[0;0;0;0;0;0];
Td = FKinSpace(M, Slist, thetalist)
show_mesh = 1;
for i = -pi/2:0.01:pi/2
    tic
    thetalist =[i;i;i;i;i;i];
    drawFK(Slist,Mlist,thetalist,show_mesh,fv)
    toc
    
end
