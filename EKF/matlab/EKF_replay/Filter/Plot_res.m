function Plot_res(GPS1,GPS2,Baro1,Baro2,IMU1,IMU2,Mag1,Mag2,RFND, out,out1 )
rad2deg = 180/pi;
plotDimensions = [0 0 210*3 297*3];
f = designfilt('lowpassiir', 'PassbandFrequency', .01, 'StopbandFrequency', .1, 'PassbandRipple', 1, 'StopbandAttenuation', 60);


%% Plot 2D pos
figure(1);
t = GPS1.time_us;
t=t-t(1);
t= t / 1000000;

subplot(2,1,1)

plot(t,GPS1.pos_ned(:,1)-GPS2.pos_ned(:,1));
grid on;
xlabel("t (s)");
ylabel("Res GPS N (m)");
title("GPS residue");
subplot(2,1,2)
plot(t,GPS1.pos_ned(:,2)-GPS2.pos_ned(:,2));
grid on;
xlabel("t (s)");
ylabel("Res GPS E (m)");

figure(2)
plot(GPS1.pos_ned(:,2),GPS1.pos_ned(:,1));
hold on
plot(GPS2.pos_ned(:,2),GPS2.pos_ned(:,1));
grid on;
xlabel("E");
ylabel("N");
title("GPS1 vs GPS2");


%% Plot RES GYRO
figure(3);
t = IMU1.time_us;
t=t-t(1);
t= t / 1000000;

subplot(3,1,1)

plot(t,IMU1.del_ang(:,1)-IMU2.del_ang(:,1));
grid on;
xlabel("t (s)");
ylabel("Res Gx (rad/s)");
title("Gyro Residue");
subplot(3,1,2)
plot(t,IMU1.del_ang(:,2)-IMU2.del_ang(:,2));
grid on;
xlabel("t (s)");
ylabel("Res Gy (rad/s)");
subplot(3,1,3)
plot(t,IMU1.del_ang(:,3)-IMU2.del_ang(:,3));
grid on;
xlabel("t (s)");
ylabel("Res Gz (rad/s)");

%% Plot RES ACC
figure(4);
subplot(3,1,1)
plot(t,IMU1.del_vel(:,1)-IMU2.del_vel(:,1));
grid on;
xlabel("t (s)");
ylabel("Res Ax (m/s^2)");
title("Acc Residue");
subplot(3,1,2)
plot(t,IMU1.del_vel(:,2)-IMU2.del_vel(:,2));
grid on;
xlabel("t (s)");
ylabel("Res Ay (m/s^2)");
subplot(3,1,3)
plot(t,IMU1.del_vel(:,3)-IMU2.del_vel(:,3));
grid on;
xlabel("t (s)");
ylabel("Res Az (m/s^2)");


%% Plot RES BARO
figure(5);

t = Baro1.time_us;
t=t-t(1);
t= t / 1000000;

subplot(2,2,1)
plot(t,Baro1.height(1,:),t,Baro2.height(1,:),t,RFND.dist(:,1));
grid on;
xlabel("t (s)");
ylabel("alt (m)");
legend('BARO1','BARO2','RNFND')
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,2,2)
plot(t,Baro1.height(1,:)-Baro2.height(1,:));
grid on;
xlabel("t (s)");
ylabel("RES BARO1 vs BARO2 (m)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,2,3)
plot(t,Baro1.height(1,:)-RFND.dist(:,1)');
grid on;
xlabel("t (s)");
ylabel("RES BARO1 vs RFND (m)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,2,4)
plot(t,Baro2.height(1,:)-RFND.dist(:,1)');
grid on;
xlabel("t (s)");
ylabel("RES BARO2 vs RFND (m)");
ylim([-inf, inf])
xlim([-inf, inf])

%% MAG residues

figure(6);

t = Mag1.time_us;
t=t-t(1);
t= t / 1000000;

subplot(2,2,1)
plot(t,Mag1.field_ga(:,1),t,Mag2.field_ga(:,1) - (Mag2.field_ga(1,1)-Mag1.field_ga(1,1)));
grid on;
xlabel("t (s)");
ylabel("MAGx (gausse)");
legend('MAG1x','MAG2x')
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,2,2)
plot(t,Mag1.field_ga(:,2),t,Mag2.field_ga(:,2)- (Mag2.field_ga(1,2)-Mag1.field_ga(1,2)));
grid on;
xlabel("t (s)");
ylabel("MAGy (gausse)");
legend('MAG1y','MAG2y')
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,2,3)
plot(t,Mag1.field_ga(:,1)-(Mag2.field_ga(:,1) - (Mag2.field_ga(1,1)-Mag1.field_ga(1,1))));
grid on;
xlabel("t (s)");
ylabel("RES MAG vs MAG2 (gausse)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,2,4)
plot(t,Mag1.field_ga(:,2)-(Mag2.field_ga(:,2)- (Mag2.field_ga(1,2)-Mag1.field_ga(1,2))));
grid on;
xlabel("t (s)");
ylabel("RES MAG vs MAG2 (gausse)");
ylim([-inf, inf])
xlim([-inf, inf])


%% Plot  Fus Roll Pitch Yaw
figure(9);


t = out.time_lapsed;
subplot(2,3,1)
plot(t,out.euler_angles(:,1)*rad2deg,t,(resample(out1.euler_angles(:,1),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)))-(out1.euler_angles(1,1) - out.euler_angles(1,1)))*rad2deg);
grid on;
xlabel("t (s)");
ylabel(" Roll (deg)");
legend('KF1','KF2')
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,2)
plot(t,out.euler_angles(:,2)*rad2deg,t,(resample(out1.euler_angles(:,2),length(out.euler_angles(:,2)),length(out1.euler_angles(:,2)))-(out1.euler_angles(1,2) - out.euler_angles(1,2)))*rad2deg);
grid on;
xlabel("t (s)");
ylabel(" Pitch (deg)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,3)
plot(t,out.euler_angles(:,3)*rad2deg,t,(resample(out1.euler_angles(:,3),length(out.euler_angles(:,3)),length(out1.euler_angles(:,3)))-(out1.euler_angles(1,3) - out.euler_angles(1,3)))*rad2deg);
grid on;
xlabel("t (s)");
ylabel(" Yaw (deg)");
ylim([-inf, inf])
xlim([-inf, inf])

subplot(2,3,4)
plot(t,out.euler_angles(:,1)*rad2deg-(resample(out1.euler_angles(:,1),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)))-(out1.euler_angles(1,1) - out.euler_angles(1,1)))*rad2deg);
grid on;
xlabel("t (s)");
ylabel("Res Roll (deg)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,5)
plot(t,out.euler_angles(:,2)*rad2deg-(resample(out1.euler_angles(:,2),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)))-(out1.euler_angles(1,2) - out.euler_angles(1,2)))*rad2deg);
grid on;
xlabel("t (s)");
ylabel("Res Pitch (deg)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,6)
plot(t,out.euler_angles(:,3)*rad2deg-(resample(out1.euler_angles(:,3),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)))-(out1.euler_angles(1,3) - out.euler_angles(1,3)))*rad2deg);
grid on;
xlabel("t (s)");
ylabel("Res Yaw (deg)");
ylim([-15, 15])
xlim([-inf, inf])


%% plot 2d kalman
figure(10)
plot(filter(f,out.position_NED(:,2)),filter(f,out.position_NED(:,1)));
hold on
plot(filter(f,out1.position_NED(:,2)),filter(f,out1.position_NED(:,1)));
grid on;
xlabel("N (m)");
ylabel("E (m)");
title("Data fusions blocks output")
legend('KF1','KF2')


figure(11)
plot3(filter(f,out.position_NED(:,2)),filter(f,out.position_NED(:,1)),-out.position_NED(:,3));
hold on
plot3(filter(f,out1.position_NED(:,2)),filter(f,out1.position_NED(:,1)),-(out1.position_NED(:,3)- (out1.position_NED(1,3) - out.position_NED(1,3))));
grid on;
xlabel("N (m)");
ylabel("E (m)");
title("Data fusions blocks output")
legend('KF1','KF2')





