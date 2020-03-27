%% 11
output1 = load( '../TestData/APM/out.mat');
output2 = load( '../TestData/APM2/out2.mat');
rtk = load( '../OutputData/rtk/rtk_P.mat');
control = load( '../OutputData/control/control.mat');
rcou = load( '../OutputData/control/rcou.mat');
% load compulsory data
baro1 = load('../TestData/APM/baro_data.mat');
gps1 = load ('../TestData/APM/gps_data.mat');
imu1 = load ( '../TestData/APM/imu_data.mat');
mag1 = load ( '../TestData/APM/mag_data.mat');
rng = load ( '../TestData/APM/rng_data.mat');
% load compulsory data
baro2 = load('../TestData/APM2/baro_data.mat');
gps2 = load ('../TestData/APM2/gps_data.mat');
imu2 = load ( '../TestData/APM2/imu_data.mat');
mag2 = load ( '../TestData/APM2/mag_data.mat');

%% load compulsory data
%gps_rtk = load ('../TestData/APM_RTK/gps_data.mat');
x1 = output1.output.position_NED(:,1);
y1 = output1.output.position_NED(:,2);
z1 = output1.output.position_NED(:,3);
x2 = output2.output1.position_NED(:,1);
y2 = output2.output1.position_NED(:,2);
z2 = output2.output1.position_NED(:,3);
zrng = rng.rng_data.dist;
roll1  = output1.output.euler_angles(:,1);
pitch1 = output1.output.euler_angles(:,2);
yaw1 =  output1.output.euler_angles(:,3);
roll2 = output2.output1.euler_angles(:,1);
pitch2 = output2.output1.euler_angles(:,2);
yaw2 = output2.output1.euler_angles(:,3);
xgps1 = gps1.gps_data.pos_ned(:,1);
ygps1 = gps1.gps_data.pos_ned(:,2);
xgps2 = gps2.gps_data.pos_ned(:,1);
ygps2 = gps2.gps_data.pos_ned(:,2);


l3 = length(rtk.rtk_P(:,1));
 xrtk= rtk.rtk_P(:,2);
 yrtk= rtk.rtk_P(:,1);
% xrtk = resample(xrtk,300,l3,1);
% yrtk = resample(yrtk,300,l3,1);


%% resampling
l1 = length(x1);
l2 = length(x2);
l3 = length(xrtk);
x1 = resample(x1,l3,l1,1);
y1 = resample(y1,l3,l1,1);
z1 = resample(z1,l3,l1,1);
lrng = length(zrng);
zrng = resample(zrng,l3,lrng,1);

roll1 = resample(roll1,l3,l1,1);
pitch1 = resample(pitch1,l3,l1,1);
yaw1 = resample(yaw1,l3,l1,1);
x2 = resample(x2,l3,l2,1);
y2 = resample(y2,l3,l2,1);
z2 = resample(z2,l3,l2,1);
roll2 = resample(roll2,l3,l2,1);
pitch2 = resample(pitch2,l3,l2,1);
yaw2 = resample(yaw2,l3,l2,1);



%% resample gps
lgps1 = length(xgps1);
lgps2 = length(xgps2);
xgps1 = resample(xgps1,l3,lgps1,1);
ygps1 = resample(ygps1,l3,lgps1,1);
xgps2 = resample(xgps2,l3,lgps2,1);
ygps2 = resample(ygps2,l3,lgps2,1);

uts = control.control.ut;
urs = control.control.ur;
ups = control.control.up;
uys = control.control.uy;
lcontrol = length(control.control.ut);

 uts = resample(uts,l3,lcontrol,1);
 urs = resample(urs,l3,lcontrol,1);
 ups = resample(ups,l3,lcontrol,1);
 uys = resample(uys,l3,lcontrol,1);

u1 = rcou.rcou.u1;
u2 = rcou.rcou.u2;
u3 = rcou.rcou.u3;
u4 = rcou.rcou.u4;
lcontrol = length(rcou.rcou.u1);
 u1 = resample(u1,l3,lcontrol,1);
 u2 = resample(u2,l3,lcontrol,1);
 u3 = resample(u3,l3,lcontrol,1);
 u4 = resample(u4,l3,lcontrol,1);

F1 = -1.473641523595032.*u1.*u1.*u1 + 11.069063228257594.*u1.*u1 -16.707399930105716.*u1 + 7.300711024486214;
F2 = -1.473641523595032.*u4.*u4.*u4 + 11.069063228257594.*u4.*u4 -16.707399930105716.*u4 + 7.300711024486214;
F3 = -1.473641523595032.*u2.*u2.*u2 + 11.069063228257594.*u2.*u2 -16.707399930105716.*u2 + 7.300711024486214;
F4 = -1.473641523595032.*u3.*u3.*u3 + 11.069063228257594.*u3.*u3 -16.707399930105716.*u3 + 7.300711024486214;
Tau1 = -0.090549269717609.*u1.*u1.*u1 + 0.477099764968194.*u1.*u1 -0.679050064467978.*u1 + 0.304521714315383;
Tau2 = -0.090549269717609.*u4.*u4.*u4 + 0.477099764968194.*u4.*u4 -0.679050064467978.*u4 + 0.304521714315383;
Tau3 = -0.090549269717609.*u2.*u2.*u2 + 0.477099764968194.*u2.*u2 -0.679050064467978.*u2 + 0.304521714315383;
Tau4 = -0.090549269717609.*u3.*u3.*u3 + 0.477099764968194.*u3.*u3 -0.679050064467978.*u3 + 0.304521714315383;

uts = F1+F2+F3+F4;
urs = 0.323*cos(pi/4)*(F3+F4-F1-F2);
ups = 0.323*cos(pi/4)*(F1 + F4 - F2 -F3);
uys = Tau1 + Tau3 - Tau4 - Tau2;

t = output1.output.time_lapsed;
t = t - t(1);
l1 = length(t);
t = resample(t,l3,l1,1);
t= t';


 
 x_av = (x1 + x2) / 2;
 y_av = (y1 + y2) / 2;


  sig1 = [t x1 y1 roll1 pitch1 yaw1 -z1];
  sig2 = [t x2 y2 roll2 pitch2 yaw2 -z2];
  sigrtk = [t xrtk yrtk zrng]; 
  siggps1 = [t xgps1 ygps1];
  siggps2 = [t xgps2 ygps2];
  control1 = [t uts urs ups uys];
t(end)

