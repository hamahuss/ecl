lhat = length(xyhat(:,1));
xhat = resample(xyhat(:,1),l3,lhat,1);
yhat = resample(xyhat(:,2),l3,lhat,1);
lhat = length(d_GPS1);
d_GPS1 = resample(d_GPS1,l3,lhat,1);
d_GPS2 = resample(d_GPS2,l3,lhat,1);
d_rtk = resample(d_rtk,l3,lhat,1);
res_d_GPS1_GPS2 = resample(res_d_GPS1_GPS2,l3,lhat,1);
res_x_GPS1_GPS2 = resample(res_x_GPS1_GPS2,l3,lhat,1);
res_y_GPS1_GPS2 = resample(res_y_GPS1_GPS2,l3,lhat,1);
lhat = length(xvoter);
xvoter = resample(xvoter,l3,lhat,1);
yvoter = resample(yvoter,l3,lhat,1);
dvoter = resample(dvoter,l3,lhat,1);
zvoter = resample(zvoter,l3,lhat,1);
folder = strcat('../OutputPlots/RTK');
plotDimensions = [0 0 210*3 297*3];

%%zrng = resample(zrng,l3,lhat,1);

h=gcf;
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','normalized');
set(h,'PaperPosition', [0 0 1 1]);


figure('Units','normalized','outerposition',[0 0 1 1])
subplot 211
plot(t,zrng, t, -z1, t, zvoter);
legend(" rng","zmodel","zvoter");
xlabel("t(s)");
ylabel("z(m)");
subplot 212
plot(t,zrng + z1);
legend(" res-Zrng-Zmodel");
hline(1)
hline(-1)
xlabel("t(s)");
fileName='5_z_resz.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);



figure('Units','normalized','outerposition',[0 0 1 1])

subplot 311
plot(tsim,s_zrng1_zmodel);
ylim([0, 1])
legend(" s_{zrng1-zmodel}");
xlabel("t(s)");
subplot 312
plot(tsim,s_zrng1_zrng2)
ylim([0, 1])
legend(" s_{zrng1-zrng2}");
xlabel("t(s)");
subplot 313
plot(tsim,s_zrng2_zmodel)
ylim([0, 1])
legend(" s_{zrng2-zmodel}");
xlabel("t(s)");
fileName='8_s_rng.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
   
   
figure('Units','normalized','outerposition',[0 0 1 1])

subplot 311
plot(tsim,s_dgps1_dgps2);
ylim([0, 1])
legend(" s_{dKF1-dKF2}");
xlabel("t(s)");
subplot 312
plot(tsim,s_dgps1_dmodel1)
ylim([0, 1])
legend(" s_{dKF1-dmodel}");
xlabel("t(s)");
subplot 313
plot(tsim,s_dgps2_dmodel1)
ylim([0, 1])
legend(" s_{dKF2-dmodel}");
xlabel("t(s)");
fileName='9_s_dKF.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
   
   
figure('Units','normalized','outerposition',[0 0 1 1])

 subplot 321
 plot(tsim,s_ygps1_ygps2)
ylim([0, 1])
legend(" s_{xKF1-xKF2}");
xlabel("t(s)");
subplot 322
plot(tsim,s_ygps1_ymodel)
ylim([0, 1])
legend(" s_{xKF1-xmodel}");
xlabel("t(s)");
subplot 323
plot(tsim,s_ygps2_ymodel)

ylim([0, 1])
legend(" s_{xKF2-xmodel}");
xlabel("t(s)");
subplot 324
plot(tsim,s_xgps1_xgps2);
ylim([0, 1])
legend(" s_{yKF1-yKF2}");
xlabel("t(s)");
subplot 325
plot(tsim,s_xgps1_xmodel)
ylim([0, 1])
legend(" s_{yKF1-ymodel}");
xlabel("t(s)");
subplot 326
plot(tsim,s_xgps2_xmodel)
ylim([0, 1])
legend(" s_{yKF2-ymodel}");
xlabel("t(s)");
fileName='10_s_xyKF.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);

 

% figure('Units','normalized','outerposition',[0 0 1 1])
% plot(yrtk, xrtk);
% hold on
% plot(ygps1,xgps1);
% plot(ygps2,xgps2);
% plot(yhat,xhat);
% plot(yvoter,xvoter);
% ylim([-7, 15])
% xlim([-1, 15])
% legend("RTK","GPS1", "GPS2", "model", "voter");
% xlabel("x(m)");
% ylabel("y(m)");
% fileName='1_pos_rtk_gps.png';
% fullFileName = fullfile(folder, fileName);
% saveas(gcf,fullFileName);

figure('Units','normalized','outerposition',[0 0 1 1])
plot(yrtk, xrtk);
hold on
plot(ygps1,xgps1);
plot(ygps2,xgps2);
ylim([-7, 15])
xlim([-1, 15])
legend("RTK","GPS1", "GPS2");
xlabel("x(m)");
ylabel("y(m)");
fileName='1_pos_rtk_gps.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);


figure('Units','normalized','outerposition',[0 0 1 1])

plot(yrtk, xrtk);
hold on
plot(y1,x1);
plot(y2,x2);
plot(yhat,xhat);
plot(yvoter,xvoter);
ylim([-7, 15])
xlim([-1, 15])
legend("RTK","KF1", "KF2", "model", "voter");
xlabel("x(m)");
ylabel("y(m)");
fileName='2_pos_rtk_kf.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);



% figure('Units','normalized','outerposition',[0 0 1 1])
% 
% subplot 331
% plot(t,xrtk-x1);
% legend(" RTK-GPS1");
% xlabel("t(s)");
% ylabel("x(m)");
% subplot 332
% plot(t,yrtk-y1)
% legend(" RTK-GPS1");
% xlabel("t(s)");
% ylabel("y(m)");
% subplot 333
% plot(t,xrtk-x2)
% legend(" RTK-GPS2");
% xlabel("t(s)");
% ylabel("x(m)");
% subplot 334
% plot(t,yrtk-y2)
% legend(" RTK-GPS2");
% xlabel("t(s)");
% ylabel("y(m)");
% subplot 335
% plot(t,xrtk-xhat)
% legend(" RTK-model");
% xlabel("t(s)");
% ylabel("x(m)");
% subplot 336
% plot(t,yrtk-yhat)
% legend(" RTK-model");
% xlabel("t(s)");
% ylabel("y(m)");
% subplot 337
% plot(t,xrtk-xvoter)
% legend(" RTK-voter");
% xlabel("t(s)");
% ylabel("x(m)");
% subplot 338
% plot(t,yrtk-yvoter)
% legend(" RTK-voter");
% xlabel("t(s)");
% ylabel("y(m)");
% fileName='res_rtk_gps_model.png';
% fullFileName = fullfile(folder, fileName);
% saveas(gcf,fullFileName);
% 





% figure(3)
% subplot 211
% plot(t,x_av)
% hold on
% plot(t,xhat)
% legend("moyenne GPS", "xmodel");
% xlabel("t(s)");
% ylabel("x(m)");
% subplot 212
% plot(t,y_av)
% hold on
% plot(t,yhat)
% legend("moyenne GPS", "ymodel");
% xlabel("t(s)");
% ylabel("y(m)");

% lgps = length(res_d_GPS1_GPS2);
% ltf = length(res_d_GPS1_tf);
% if (length(res_d_GPS1_GPS2) ~= lt)
% res_d_GPS1_GPS2 = resample(res_d_GPS1_GPS2, lt, lgps);
% res_x_GPS1_GPS2 = resample(res_x_GPS1_GPS2, lt, lgps);
% res_y_GPS1_GPS2 = resample(res_y_GPS1_GPS2, lt, lgps);
% d_GPS1 = resample(d_GPS1, lt, lgps);
% d_GPS2 = resample(d_GPS2, lt, lgps);
% d_rtk = resample(d_rtk, lt, lgps);
% end
% 
% if (length(res_d_GPS1_tf) ~= lt)
% res_d_GPS1_tf = resample(res_d_GPS1_tf, lt, ltf);
% res_d_GPS2_tf = resample(res_d_GPS2_tf, lt, ltf);
% res_d_rtk_tf = resample(res_d_rtk_tf, lt, ltf);
% res_x_GPS1_tf = resample(res_x_GPS1_tf, lt, ltf);
% res_x_GPS2_tf = resample(res_x_GPS2_tf, lt, ltf);
% res_x_rtk_tf = resample(res_x_rtk_tf, lt, ltf);
% res_y_GPS1_tf = resample(res_y_GPS1_tf, lt, ltf);
% res_y_GPS2_tf = resample(res_y_GPS2_tf, lt, ltf);
% res_y_rtk_tf = resample(res_y_rtk_tf, lt, ltf);
% x_tf = resample(x_tf, lt, ltf);
% y_tf = resample(y_tf, lt, ltf);
% d_tf = resample(d_tf, lt, ltf);
% end
% 
% 
figure('Units','normalized','outerposition',[0 0 1 1])

subplot 311
plot(t,d_rtk,t,d_GPS1,t,d_GPS2)
ylim([-5, 15])
legend("dRTK", "dGPS1","dGPS2");
xlabel("t(s)");
ylabel("d(m)");
subplot 312
plot(t,xrtk,t,xgps1,t,xgps2)
ylim([-5, 15])
legend("xRTK", "xGPS1","xGPS2");
xlabel("t(s)");
ylabel("y(m)");
subplot 313
plot(t,yrtk,t,ygps1,t,ygps2)
ylim([-5, 15])
legend("yRTK", "yGPS1","yGPS2");
xlabel("t(s)");
ylabel("x(m)");
fileName='3_d_rtk_gps.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);

figure('Units','normalized','outerposition',[0 0 1 1])

subplot 311
plot(t,res_d_GPS1_GPS2)
hline(2)
hline(-2)
ylim([-5, 10])
legend("res-d-GPS1-GPS2");
xlabel("t(s)");
ylabel("d(m)");
subplot 312
plot(t,res_x_GPS1_GPS2)
% hline(2)
% hline(-2)
ylim([-5, 10])
legend("res-x-GPS1-GPS2");
xlabel("t(s)");
ylabel("x(m)");
subplot 313
plot(t,res_y_GPS1_GPS2)
% hline(2)
% hline(-2)
ylim([-5, 10])
legend("res-y-GPS1-GPS2");
xlabel("t(s)");
ylabel("y(m)");
fileName='6_res_gps.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);


figure('Units','normalized','outerposition',[0 0 1 1])

subplot 311
plot(t,d_GPS1-d_rtk,t,d_GPS2-d_rtk)
hline(3)
hline(-3)
ylim([-5, 10])
legend("res-d-GPS1-rtk", "res-d-GPS2-rtk");
xlabel("t(s)");
ylabel("d(m)");
subplot 312
plot(t,xgps1-xrtk,t,xgps2-xrtk)
hline(3)
hline(-3)
ylim([-5, 10])
legend("res-x-GPS1-rtk", "res-x-GPS2-rtk");
xlabel("t(s)");
ylabel("x(m)");
subplot 313
plot(t,ygps1-yrtk,t,ygps2-yrtk)
hline(3)
hline(-3)
ylim([-5, 10])
legend("res-y-GPS1-rtk", "res-y-GPS2-rtk");
xlabel("t(s)");
ylabel("y(m)");
fileName='7_res_xy_gps.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);


figure('Units','normalized','outerposition',[0 0 1 1])
subplot 211
plot(t,yrtk,t,y1,t,y2,t,yhat,t,yvoter)
legend("xrtk","xkf1","xkf2","xmodel","xvoter");
xlabel("t(s)");
ylabel("x(m)");
subplot 212
plot(t,xrtk,t,x1,t,x2,t,xhat,t,xvoter)
legend("yrtk","ykf1","ykf2","ymodel","yvoter");
xlabel("t(s)");
ylabel("y(m)");
fileName='4_xy_gps.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);

close all;