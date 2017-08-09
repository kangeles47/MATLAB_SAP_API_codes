%Initialization Script for HazardAPI

%Input variables to execute HazardAPI:
%Input
%FilePath: string with path to file
FilePath = 'D:\Users\Karen\Documents\Revit 2017\RC_FRAME';

%units: double with value 1 to 16
%lb,in,F=1  lb,ft,F=2   kip,in,F=3  kip,ft,F=4
%kN,mm,C=5  kN,m,C=6    kgf,mm,C=7  kgf,m,C=8
%N,mm,C=9   N,m,C=10    Ton,mm,C=11 Ton,m,C=12
%kN,cm,C=13 kgf,cm,C=14 N,cm,C=15   Ton,cm,C=16
units=3;

%elev: vector of floor elevations **Make sure that these are in the same
%units as specified in the variable units**
elev=[0;10;20]*12;
%-------------------------------------------------------------------------%
%Call the function for the respective SAP model:
[JointCoords,FrameJointConn,FloorConn,WallConn,T,mass_floor]=HazardSapAPI(FilePath,units,elev)

%Output
%JointCoords: nx4 matrix - Col1==Joint Number, Col2to4==(x,y,z) in GCS

%FrameJointConn: nx9 matrix - Col1==FrameName, Col2==iend joint number, Col3to5 (x,y,z) of
%iend joint in GCS (Global Coordinate System), Col6==jend joint number, Col7to9 (x,y,z) of jend joint
%in GCS

%Floor Conn: matrix - Col1==FloorName Col2:n --> joint numbers which
%correspond to that floor

%WallConn: matrix - Col1==WallName Col2:n --> joint numbers which
%correspond to that wall

%T: 1x2 vector with entries [Tx Ty]

%mass: total mass of structure for 1.0DL+0.3LL load case (used for modal
%analysis as well)