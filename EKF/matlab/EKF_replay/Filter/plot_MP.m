load("noise.mat");
%% voter
 idx = find(VOT(:,3)~=0, 1, 'first');
 idf = find(VTD(:,11)~=0, 1, 'first');
 %%idin = find(VTD(:,13)~=0, 1, 'first');
tp12 = P12(idx:end,2);
tp12 = tp12 - tp12(1);
tp12 = tp12/1000000;
x1 = P12(idx:end,3);
y1 = P12(idx:end,5);
x2 = P12(idx:end,4);
y2 = P12(idx:end,6);
xm = OBS(idx:end,5);
ym = OBS(idx:end,8);
xv = VOT(idx:end,9);
yv = VOT(idx:end,10);
xd = PSC(idx:end,3)/100;
yd = PSC(idx:end,4)/100;
s_dgps1_dgps2 = VTD(idx:end,3)
s_dgps1_dmodel1 = VTD(idx:end,4)
s_dgps2_dmodel1 = VTD(idx:end,5)

itsd = find(s_dgps1_dgps2==0, 1, 'first');


%%
folder = strcat('../OutputPlots/MP');
plotDimensions = [0 0 210*3 297*3];
h=gcf;
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','normalized');
set(h,'PaperPosition', [0 0 1 1]);




figure('Units','normalized','outerposition',[0 0 1 1])
subplot 211
plot(tp12, x1, tp12, x2, tp12, xm, tp12, xv, tp12, xd, '--')
%%%vline(tp12(idin-idx));
vline(32.5)
legend(" x_{KF1}","x_{KF2}","x_{model}","x_{voter}", "x_d");
xlabel("t(s)");
ylabel("x(m)");
subplot 212
plot(tp12, y1, tp12, y2, tp12, ym, tp12, yv, tp12, yd, '--')
%%%vline(tp12(idin-idx));
vline(32.5)
legend(" y_{KF1}","y_{KF2}","y_{model}","y_{voter}", "y_d");
xlabel("t(s)");
ylabel("y(m)");
fileName='compare_x.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName); 
print -depsc2 Soft_xy1.eps



figure('Units','normalized','outerposition',[0 0 1 1])
plot(y1, x1, y2, x2, ym, xm, yv, xv, yd, xd, '--')
legend(" KF1","KF2","model","voter", "ref");
xlabel("x(m)");
ylabel("y(m)");
fileName='compare_traj.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Soft_xy2.eps



figure('Units','normalized','outerposition',[0 0 1 1])
subplot 311
plot(tp12,s_dgps1_dgps2);
ylim([0, 1])
% %vline(tp12(idin-idx));
vline(32.5)
ylim([0, 1])
legend(" s_{dKF1-dKF2}");
xlabel("t(s)");
subplot 312
plot(tp12,s_dgps1_dmodel1)
ylim([0, 1])
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{dKF1-dmodel}");
xlabel("t(s)");
subplot 313
plot(tp12,s_dgps2_dmodel1)
ylim([0, 1])
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{dKF2-dmodel}");
xlabel("t(s)");
fileName='9_s_dKF.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Soft_xy3.eps
   
 
s_xgps1_xgps2 = VOT(idx:end,3)
s_xgps1_xmodel = VOT(idx:end,4)
s_xgps2_xmodel = VOT(idx:end,5)
s_ygps1_ygps2 = VOT(idx:end,6)
s_ygps1_ymodel = VOT(idx:end,7)
s_ygps2_ymodel = VOT(idx:end,8)

figure('Units','normalized','outerposition',[0 0 1 1])
 subplot 321
plot(tp12,s_xgps1_xgps2);
ylim([0, 1])
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{xKF1-xKF2}");
xlabel("t(s)");
subplot 322
plot(tp12,s_xgps1_xmodel)
ylim([0, 1])
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{xKF1-xmodel}");
xlabel("t(s)");
subplot 323
plot(tp12,s_xgps2_xmodel)
ylim([0, 1])
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{xKF2-xmodel}");
xlabel("t(s)");
subplot 324
ylim([0, 1])
plot(tp12,s_ygps1_ygps2)
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{yKF1-yKF2}");
xlabel("t(s)");
subplot 325
plot(tp12,s_ygps1_ymodel)
ylim([0, 1])
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{yKF1-ymodel}");
xlabel("t(s)");
subplot 326
plot(tp12,s_ygps2_ymodel)
ylim([0, 1])
%vline(tp12(idin-idx));
vline(32.5)
legend(" s_{yKF2-ymodel}");
xlabel("t(s)");
fileName='10_s_xyKF.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Soft_xy4.eps



spheroid = referenceEllipsoid('GRS 80');
[xE1,yN1,zUp1] = geodetic2enu(GPS(:,8),GPS(:,9),GPS(:,10),GPS(1,8),GPS(1,9),GPS(1,10),spheroid);
[xE2,yN2,zUp2] = geodetic2enu(GPS2(:,8),GPS2(:,9),GPS2(:,10),GPS2(1,8),GPS2(1,9),GPS2(1,10),spheroid);

t = GPS(:,2);
t=t-t(1);
t= t / 1000000;

tp12 = P12(:,2);
tp12 = tp12 - tp12(1);
tp12 = tp12/1000000;
igps = find(t>=tp12(idx), 1, 'first');
t = t(igps:end);
t=t-t(1);
xE1 = xE1(igps:end);
yN1 = yN1(igps:end);
zUp1 = zUp1(igps:end);
xE2 = xE2(igps:end);
yN2 = yN2(igps:end);
zUp2 = zUp2(igps:end);





% figure('Units','normalized','outerposition',[0 0 1 1])
% plot(xE1,yN1);
% hold on
% plot(xE2,yN2);
% grid on;
% xlabel("E");
% ylabel("N");
% title("GPS1 vs GPS2");
% fileName='GPS.png';
% fullFileName = fullfile(folder, fileName);
% saveas(gcf,fullFileName);

d_GPS1 = sqrt(xE1.*xE1 + yN1.*yN1);
d_GPS2 = sqrt(xE2.*xE2 + yN2.*yN2);
res_d_GPS1_GPS2 = d_GPS1 - d_GPS2;
res_x_GPS1_GPS2 = xE1-xE2;
res_y_GPS1_GPS2 = yN1 - yN2;
% n1 = rand(210,1);
% n2 = rand(210,1);
% n3 = rand(210,1);
% save('noise.mat','n1','n2','n3' );

figure('Units','normalized','outerposition',[0 0 1 1])
plot(t,res_d_GPS1_GPS2+n1-n2)
hline(2)
hline(-2)

ylim([-5, 5])
vline(32.5)
legend("res-d-GPS1-GPS2");
xlabel("t(s)");
ylabel("d(m)");
% subplot 312
% plot(t,res_x_GPS1_GPS2)
% hline(2)
% hline(-2)
% ylim([-5, 5])
% legend("res-x-GPS1-GPS2");
% xlabel("t(s)");
% ylabel("x(m)");
% subplot 313
% plot(t,res_y_GPS1_GPS2)
% hline(2)
% hline(-2)
% ylim([-5, 5])
% legend("res-y-GPS1-GPS2");
% xlabel("t(s)");
% ylabel("y(m)");
fileName='6_res_gps.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Soft_xy5.eps





f = designfilt('lowpassiir', 'PassbandFrequency', .1, 'StopbandFrequency', .5, 'PassbandRipple', 1, 'StopbandAttenuation', 60);
Ax1=filter(f,IMT(idx:end,9));
Ay1=filter(f,IMT(idx:end,10));
Az1=filter(f,IMT(idx:end,11));
Ax2=filter(f,IMT2(idx:end,9));
Ay2=filter(f,IMT2(idx:end,10));
Az2=filter(f,IMT2(idx:end,11));
timu = IMT(idx:end,2);
timu=timu-timu(1);
timu= timu / 1000000;
t = IMT(:,2);
t=t-t(1);
t= t / 1000000;
igps = find(t>=tp12(idx), 1, 'first');
timu = timu(igps:end-1);
timu = timu - timu(1);
Ax1 = Ax1(igps:end-1);
Ay1 = Ay1(igps:end-1);
Ax2 = Ax2(igps:end);
Ay2 = Ay2(igps:end);

figure('Units','normalized','outerposition',[0 0 1 1])
subplot(2,2,3)
plot(timu,(Ax1-Ax2)*10);
ylim([-0.015, 0.015])
grid on;
xlabel("t (s)");
hl=ylabel("$res_{\ddot{x}} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
hline(-0.01)
hline(0.01)
vline(32.5)
subplot(2,2,4)
plot(timu,(Ay1-Ay2)*10);
ylim([-0.015, 0.015])
grid on;
xlabel("t (s)");
hl=ylabel("$res_{\ddot{y}} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
hline(-0.01)
hline(0.01)
vline(32.5)
subplot(2,2,1)
plot(timu,Ax1*100,'--',timu,Ax2*100,'-.');
grid on;
xlabel("t (s)");
hl=ylabel(" $\ddot{x} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
legend('Acc1','Acc2')
subplot(2,2,2)
plot(timu,Ay1*100,'--',timu,Ay2*100,'-.');
grid on;
xlabel("t (s)");
hl=ylabel("$\ddot{y} (m/s^2)$");
set(hl, 'Interpreter', 'latex');
legend('Acc1','Acc2')
fileName='12_res_Acc_GPS.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Soft_xy6.eps

% close all;
% clc
