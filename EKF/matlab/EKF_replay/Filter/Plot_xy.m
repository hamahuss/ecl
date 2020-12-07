% Unused
idx = find(PSC(:,3)~=0, 1, 'first');
 idf = find(VTD(:,10)~=0, 1, 'first');
 idimu = find(IMT(:,1)>PSC(idx,1), 1, 'first');
 idGPS = find(GPS(:,1)>PSC(idx,1), 1, 'first');
 rad2deg = 180/pi;
spheroid = referenceEllipsoid('GRS 80');
[xE1,yN1,zUp1] = geodetic2enu(GPS(idGPS:end,8),GPS(idGPS:end,9),GPS(idGPS:end,10),GPS(1,8),GPS(1,9),GPS(1,10),spheroid);
[xE2,yN2,zUp2] = geodetic2enu(GPS2(idGPS:end,8),GPS2(idGPS:end,9),GPS2(idGPS:end,10),GPS2(1,8),GPS2(1,9),GPS2(1,10),spheroid);
tgps = GPS(idGPS:end,2);
tgps=tgps-tgps(1);
tgps= tgps / 1000000;


tp12 = P12(idx:end,2);
tp12 = tp12 - tp12(1);
tp12 = tp12/1000000;
x1 = P12(idx:end,3);
x2 = P12(idx:end,4);
y1 = P12(idx:end,5);
y2 = P12(idx:end,6);
xm = OBS(idx:end,5);
ym = OBS(idx:end,8);
xv = VOT(idx:end,9);
yv = VOT(idx:end,10);
timu = IMT(idimu:end,2);
timu = timu - timu(1);
timu = timu/1000000;
xi1= RFND(idimu:end,3);
xi2=  RFND(idimu:end,6);

 
sz1 = VOT(idx:end,11);
sz2 = VOT(idx:end,12);
sz3 = VOT(idx:end,13);
 
folder = strcat('../OutputPlots/MP');
plotDimensions = [0 0 210*3 297*3];
h=gcf;
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','normalized');
set(h,'PaperPosition', [0 0 1 1]);
 
 
figure('Units','normalized','outerposition',[0 0 1 1])
plot(xE1,yN1);
hold on 
plot(xE2,yN2);
grid on;
xlabel("t (s)");
ylabel("Res GPS E (m)");
title("GPS residue");
ylim([-inf, inf])
xlim([-inf, inf])
fileName='GPS.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
 
figure('Units','normalized','outerposition',[0 0 1 1])
subplot 211
plot(timu, zr1, timu, zr2)
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
legend(" zr1","zr2");
xlabel("t(s)");
ylabel("z(m)");
subplot 212
plot(timu, zr1 - zr2)
hline(-.5,'k','--')
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
legend(" Res-zr1-zr2");
xlabel("t(s)");
ylabel("z(m)");
fileName='Hover_2.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
 
 
figure('Units','normalized','outerposition',[0 0 1 1])
subplot 311
plot(tp12,sz1);
ylim([0, 1])
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
ylim([0, 1])
legend(" s_{zKF1-zKF2}");
xlabel("t(s)")
subplot 312
plot(tp12,sz2);
ylim([0, 1])
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
ylim([0, 1])
legend(" s_{zKF1-zmodel}");
xlabel("t(s)")
subplot 313
plot(tp12,sz3);
ylim([0, 1])
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
ylim([0, 1])
legend(" s_{zKF2-zmodel}");
xlabel("t(s)")
fileName='Hover_3.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
 
 
figure('Units','normalized','outerposition',[0 0 1 1])
subplot 311
plot(tp12,ez1);

hline(1,'k','--')
hline(-1,'k','--')
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
legend(" res-zKF1-zKF2");
xlabel("t(s)")
subplot 312
plot(tp12,ez2);

hline(1,'k','--')
hline(-1,'k','--')
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
legend(" res-zKF1-zmodel");
xlabel("t(s)")
subplot 313
plot(tp12,ez3);

hline(1,'k','--')
hline(-1,'k','--')
vline(17.8)
if exist(idf)
vline(tp12(idf - idx))
end
legend(" res-zKF2-zmodel");
xlabel("t(s)")
fileName='Hover_4.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
 
 
 
 

