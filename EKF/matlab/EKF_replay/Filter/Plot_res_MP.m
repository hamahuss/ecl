function Plot_res_MP(GPS,GPS2,BARO,BAR2,IMT,IMT2,MAG,MAG2,RFND,out,out1 )
rad2deg = 180/pi;

%% Plot 2D pos
spheroid = referenceEllipsoid('GRS 80');
[xE1,yN1,zUp1] = geodetic2enu(GPS(:,8),GPS(:,9),GPS(:,10),GPS(1,8),GPS(1,9),GPS(1,10),spheroid);
[xE2,yN2,zUp2] = geodetic2enu(GPS2(:,8),GPS2(:,9),GPS2(:,10),GPS2(1,8),GPS2(1,9),GPS2(1,10),spheroid);

t = GPS(:,2);
t=t-t(1);
t= t / 1000000;


figure(2)
subplot(3,1,1)
plot(t,xE1-xE2);
grid on;
xlabel("t (s)");
ylabel("Res GPS E (m)");
title("GPS residue");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(3,1,2)
plot(t,yN1-yN2);
grid on;
xlabel("t (s)");
ylabel("Res GPS N (m)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(3,1,3)
plot(t,-(zUp1-zUp2));
grid on;
xlabel("t (s)");
ylabel("Res GPS Up (m)");
ylim([-inf, inf])
xlim([-inf, inf])


figure(1)
plot(xE1,yN1);
hold on
plot(xE2,yN2);
grid on;
xlabel("E");
ylabel("N");
title("GPS1 vs GPS2");

%% PLOT residue GYRO

% a = 1;
% b = [1/4 1/4 1/4 1/4];
% Gx1=filter(b,a,IMT(:,6));
% Gy1=filter(b,a,IMT(:,7));
% Gz1=filter(b,a,IMT(:,8));
% 
% Gx2=filter(b,a,IMT2(:,6));
% Gy2=filter(b,a,IMT2(:,7));
% Gz2=filter(b,a,IMT2(:,8));
% a = 1;
% b = [0.001 0.001 0.001 0.001];
% Ax1=filter(b,a,IMT(:,9));
% Ay1=filter(b,a,IMT(:,10));
% Az1=filter(b,a,IMT(:,11));
% Ax2=filter(b,a,IMT2(:,9));
% Ay2=filter(b,a,IMT2(:,10));
% Az2=filter(b,a,IMT2(:,11));

f = designfilt('lowpassiir', 'PassbandFrequency', .1, 'StopbandFrequency', .5, 'PassbandRipple', 1, 'StopbandAttenuation', 60);
% f = designfilt();

Gx1=filter(f,IMT(:,6));
Gy1=filter(f,IMT(:,7));
Gz1=filter(f,IMT(:,8));
Gx2=filter(f,IMT2(:,6));
Gy2=filter(f,IMT2(:,7));
Gz2=filter(f,IMT2(:,8));
Ax1=filter(f,IMT(:,9));
Ay1=filter(f,IMT(:,10));
Az1=filter(f,IMT(:,11));
Ax2=filter(f,IMT2(:,9));
Ay2=filter(f,IMT2(:,10));
Az2=filter(f,IMT2(:,11));


figure(3);
t = IMT(:,2);
t=t-t(1);
t= t / 1000000;

subplot(2,3,1)
plot(t,IMT(:,6)-IMT2(:,6));
grid on;
xlabel("t (s)");
ylabel("Res Gx (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,2)
plot(t,IMT(:,7)-IMT2(:,7));
grid on;
xlabel("t (s)");
ylabel("Res Gy (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,3)
plot(t,IMT(:,8)-IMT2(:,8));
grid on;
xlabel("t (s)");
ylabel("Res Gz (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])

subplot(2,3,4)
plot(t,IMT(:,6),t,IMT2(:,6));
grid on;
xlabel("t (s)");
ylabel(" Gx1 vs Gx2 (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,5)
plot(t,IMT(:,7),t,IMT2(:,7));
grid on;
xlabel("t (s)");
ylabel("Gy1 vs Gy2 (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,6)
plot(t,IMT(:,8),t,IMT2(:,8));
grid on;
xlabel("t (s)");
ylabel("Gz1 vs Gz2 (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])

figure(4)
subplot(2,3,1)
plot(t,Gx1-Gx2);
grid on;
xlabel("t (s)");
ylabel("Res Gxf (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,2)
plot(t,Gy1-Gy2);
grid on;
xlabel("t (s)");
ylabel("Res Gyf (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,3)
plot(t,Gz1-Gz2);
grid on;
xlabel("t (s)");
ylabel("Res Gzf (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])

subplot(2,3,4)
plot(t,Gx1,t,Gx2);
grid on;
xlabel("t (s)");
ylabel(" Gx1f vs Gx2f (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,5)
plot(t,Gy1,t,Gy2);
grid on;
xlabel("t (s)");
ylabel("Gy1f vs Gy2f (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,6)
plot(t,Gz1,t,Gz2);
grid on;
xlabel("t (s)");
ylabel("Gz1f vs Gz2f (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])

%% PLOT residue Acc

figure(5);

subplot(2,3,1)
plot(t,IMT(:,9)-IMT2(:,9));
grid on;
xlabel("t (s)");
ylabel("Res Ax (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,2)
plot(t,IMT(:,10)-IMT2(:,10));
grid on;
xlabel("t (s)");
ylabel("Res Ay (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,3)
plot(t,IMT(:,11)-IMT2(:,11));
grid on;
xlabel("t (s)");
ylabel("Res Az (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])

subplot(2,3,4)
plot(t,IMT(:,9),t,IMT2(:,9));
grid on;
xlabel("t (s)");
ylabel(" Ax1 vs Ax2 (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,5)
plot(t,IMT(:,10),t,IMT2(:,10));
grid on;
xlabel("t (s)");
ylabel("Ay1 vs Ay2 (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])
subplot(2,3,6)
plot(t,IMT(:,11),t,IMT2(:,11));
grid on;
xlabel("t (s)");
ylabel("Az1 vs Az2 (rad/s)");
ylim([-inf, inf])
xlim([-inf, inf])

%% filtered
folder = strcat('../OutputPlots/RTK');
plotDimensions = [0 0 210*3 297*3];
h=gcf;
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','normalized');
set(h,'PaperPosition', [0 0 1 1]);

figure('Units','normalized','outerposition',[0 0 1 1])

subplot(2,2,3)
plot(t,(Ax1-Ax2)*10);
grid on;
xlabel("t (s)");
hl=ylabel("$res_{\ddot{x}} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
hline(-0.01)
hline(0.01)
ylim([-0.015, 0.015])
xlim([-inf, 25])
vline(7,'k','--')

subplot(2,2,4)
plot(t,(Ay1-Ay2)*10);
grid on;
xlabel("t (s)");
hl=ylabel("$res_{\ddot{y}} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
hline(-0.01)
hline(0.01)
ylim([-0.015, 0.015])
xlim([-inf, 25])
vline(7,'k','--')

subplot(2,2,1)
plot(t,Ax1*10,t,Ax2*10);
vline(7,'k','--')
grid on;
xlabel("t (s)");
hl=ylabel(" $\ddot{x} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
legend('Acc1','Acc2')
ylim([-inf, inf])
xlim([-inf, 25])
subplot(2,2,2)
plot(t,Ay1*10,t,Ay2*10);
vline(7,'k','--')
grid on;
xlabel("t (s)");
hl=ylabel("$\ddot{y} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
legend('Acc1','Acc2')
ylim([-inf, inf])
xlim([-inf, 25])
fileName='12_res_gps.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);



%% Res Baro
% 
% figure(7);
% 
% t = BARO(:,2);
% t=t-t(1);
% t= t / 1000000;
% 
% subplot(2,2,1)
% plot(t,BARO(:,3),t,BAR2(:,3),t,RFND(:,3));
% grid on;
% xlabel("t (s)");
% ylabel("alt (m)");
% legend('BARO1','BARO2','RNFND')
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,2,2)
% plot(t,BARO(:,3)-BAR2(:,3));
% grid on;
% xlabel("t (s)");
% ylabel("RES BARO1 vs BARO2 (m)");
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,2,3)
% plot(t,BARO(:,3)-RFND(:,3));
% grid on;
% xlabel("t (s)");
% ylabel("RES BARO1 vs RFND (m)");
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,2,4)
% plot(t,BAR2(:,3)-RFND(:,3));
% grid on;
% xlabel("t (s)");
% ylabel("RES BARO2 vs RFND (m)");
% ylim([-inf, inf])
% xlim([-inf, inf])
% 
% %% MAG residues
% 
% figure(8);
% 
% t = MAG(:,2);
% t=t-t(1);
% t= t / 1000000;
% 
% subplot(2,2,1)
% plot(t,MAG(:,3),t,MAG2(:,3) - (MAG2(1,3)-MAG(1,3)));
% grid on;
% xlabel("t (s)");
% ylabel("MAGx (gausse)");
% legend('MAG1x','MAG2x')
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,2,2)
% plot(t,MAG(:,4),t,MAG2(:,4)- (MAG2(1,4)-MAG(1,4)));
% grid on;
% xlabel("t (s)");
% ylabel("MAGy (gausse)");
% legend('MAG1y','MAG2y')
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,2,3)
% plot(t,MAG(:,3)-(MAG2(:,3) - (MAG2(1,3)-MAG(1,3))));
% grid on;
% xlabel("t (s)");
% ylabel("RES MAG vs MAG2 (gausse)");
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,2,4)
% plot(t,MAG(:,4)-(MAG2(:,4)- (MAG2(1,4)-MAG(1,4))));
% grid on;
% xlabel("t (s)");
% ylabel("RES MAG vs MAG2 (gausse)");
% ylim([-inf, inf])
% xlim([-inf, inf])
% 
% %% Plot  Fus Roll Pitch Yaw
% figure(9);
% 
% out1r = resample(out1.euler_angles(:,1:3),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)));
% t = out.time_lapsed;
% t=t-t(1)
% subplot(2,3,1)
% plot(t,out.euler_angles(:,1)*rad2deg,t,(out1r(:,1)-(out1.euler_angles(1,1) - out.euler_angles(1,1)))*rad2deg);
% grid on;
% xlabel("t (s)");
% ylabel(" \phi (deg)");
% legend('KF1','KF2')
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,3,2)
% plot(t,out.euler_angles(:,2)*rad2deg,t,(out1r(:,2)-(out1.euler_angles(1,2) - out.euler_angles(1,2)))*rad2deg);
% grid on;
% xlabel("t (s)");
% ylabel(" \theta (deg)");
% ylim([-inf, inf])
% xlim([-inf, inf])
% subplot(2,3,3)
% plot(t,out.euler_angles(:,3)*rad2deg,t,(out1r(:,3)-(out1.euler_angles(1,3) - out.euler_angles(1,3)))*rad2deg);
% grid on;
% xlabel("t (s)");
% ylabel(" \psi (deg)");
% ylim([-inf, inf])
% xlim([-inf, inf])
% 
% subplot(2,3,4)
% plot(t,out.euler_angles(:,1)*rad2deg-(resample(out1.euler_angles(:,1),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)))-(out1.euler_angles(1,1) - out.euler_angles(1,1)))*rad2deg);
% grid on;
% xlabel("t (s)");
% ylabel("res_{\phi} (deg)");
% ylim([-4, 4])
% hline(3)
% hline(-3)
% xlim([-inf, inf])
% subplot(2,3,5)
% plot(t,out.euler_angles(:,2)*rad2deg-(resample(out1.euler_angles(:,2),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)))-(out1.euler_angles(1,2) - out.euler_angles(1,2)))*rad2deg);
% grid on;
% xlabel("t (s)");
% ylabel("res_{\theta} (deg)");
% ylim([-4, 4])
% xlim([-inf, inf])
% hline(3)
% hline(-3)
% subplot(2,3,6)
% plot(t,out.euler_angles(:,3)*rad2deg-(resample(out1.euler_angles(:,3),length(out.euler_angles(:,1)),length(out1.euler_angles(:,1)))-(out1.euler_angles(1,3) - out.euler_angles(1,3)))*rad2deg);
% grid on;
% xlabel("t (s)");
% ylabel("res_{\psi} (deg)");
% ylim([-7, 7])
% xlim([-inf, inf])
% hline(3)
% hline(-3)
% 
% 
% % %% plot 2d kalman
% % figure(10)
% % plot(filter(f,out.position_NED(:,2)),filter(f,out.position_NED(:,1)));
% % hold on
% % plot(filter(f,out1.position_NED(:,2)),filter(f,out1.position_NED(:,1)));
% % grid on;
% % xlabel("N (m)");
% % ylabel("E (m)");
% % title("Data fusions blocks output")
% % legend('KF1','KF2')
% % 
% % 
% % figure(11)
% % plot3(filter(f,out.position_NED(:,2)),filter(f,out.position_NED(:,1)),-out.position_NED(:,3));
% % hold on
% % plot3(filter(f,out1.position_NED(:,2)),filter(f,out1.position_NED(:,1)),-(out1.position_NED(:,3)- (out1.position_NED(1,3) - out.position_NED(1,3))));
% % grid on;
% % xlabel("N (m)");
% % ylabel("E (m)");
% % title("Data fusions blocks output")
% % legend('KF1','KF2')
% 
% 
% 
% 
% 
