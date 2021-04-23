import pybullet as p
import pybullet_data
import time
import math
pi = math.pi

if __name__ == "__main__":
	clid = p.connect(p.SHARED_MEMORY)
	if (clid < 0):
		p.connect(p.GUI)
		#p.connect(p.SHARED_MEMORY_GUI)
	p.setGravity(0, 0, -10)
	p.setAdditionalSearchPath(pybullet_data.getDataPath())
	plane=p.loadURDF("plane.urdf", [0, 0, 0.0])
	mmo_500 = p.loadURDF("right_sim.urdf", [0, 0, 0.00],p.getQuaternionFromEuler([0, 0, 0]))
	numJoints = p.getNumJoints(mmo_500) 


	while(1):
		time.sleep(0.01);
		p.stepSimulation()
