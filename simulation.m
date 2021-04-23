addpath("meshes")
addpath("mr")

S1 = [0; 0;  0; 1; 0; 0];
S2 = [0; 0;  0; 0; 1; 0];
S3 = [0; 0;  1; 0; 0; 0];
thetalist = [1 1 pi/2 ]
matS1 = MatrixExp6(VecTose3(S1)*thetalist(1));
matS2 = MatrixExp6(VecTose3(S2)*thetalist(2));
matS3 = MatrixExp6(VecTose3(S3)*thetalist(3));

M = [1 0 0 0;...
    0 1 0 0;...
    0 0 1 0;
    0 0 0 1 ];
Slist = [S1,S2,S3];
T =matS1*matS2*matS3*M;



