idx = find(PSC(:,3)~=0, 1, 'first');
 idf = find(VTD(:,12)~=0, 1, 'first');
 idr = find(RFND(:,1)>PSC(idx,1), 1, 'first');
idb = find(BARO(:,1)>PSC(idx,1), 1, 'first');
 % idf = 0;
% idr=0;
tp12 = P12(idx:end,2);
tp12 = tp12 - tp12(1);
tp12 = tp12/1000000;
z1 = P1Z(idx:end,3);
z2 = P1Z(idx:end,4);
zm = OBS(idx:end,11);
zv = VOT(idx:end,14);
tpr = RFND(idr:end,2);
tpr = tpr - tpr(1);
tpr = tpr/1000000;
zr1= RFND(idr:end,3);
zr2=  RFND(idr:end,6);
zb1= BARO(idb:end,3);
ez1 = -z1 + z2;
ez2 = -z1 + zm;
ez3 = -z2 + zm;
 
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
plot(tp12, -z1+2.5, tp12, -z2+2.5, tp12, -zm+2.5, tp12, -zv+2.5)
legend({"zkf1","zkf2","zmod","zvot"},'Location','southwest')
legend('boxoff')
xlabel("t(s)");
ylabel("z(m)");
ylim([-5,5]);
xlim([4.6,36]);
vline(tp12(idf-idx));
fileName='Hover_1.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
 print -depsc2 Hover_1.eps

figure('Units','normalized','outerposition',[0 0 1 1])
subplot 211
plot(tpr, zr1, '--', tpr, zr2, ':')
legend({" zr1","zr2"},'Location','southwest')
legend('boxoff')
xlabel("t(s)");
ylabel("z(m)");
xlim([4.6,36]);
ylim([0,5]);
yticks(0:5)
vline(tp12(idf-idx));
subplot 212
plot(tpr, zr1 - zr2)
hline(-.5,'k','--')
hline(.5,'k','--')
legend({" Res-zr1-zr2"},'Location','southwest')
legend('boxoff')
xlabel("t(s)");
ylabel("z(m)");
xlim([4.6,36]);
ylim([-5,5]);
vline(tp12(idf-idx));
fileName='Hover_2.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
 print -depsc2 Hover_2.eps
 
figure('Units','normalized','outerposition',[0 0 1 1])
subplot 311
plot(tp12,sz1);
ylim([0, 1])
xlim([4.6,36]);
vline(tp12(idf-idx));
legend(" s_{zKF1-zKF2}");
xlabel("t(s)")
subplot 312
plot(tp12,sz2);
ylim([0, 1])
xlim([4.6,36]);
vline(tp12(idf-idx));
legend(" s_{zKF1-zmodel}");
xlabel("t(s)")
subplot 313
plot(tp12,sz3);
ylim([0, 1])
xlim([4.6,36]);
vline(tp12(idf-idx));
legend(" s_{zKF2-zmodel}");
xlabel("t(s)")
fileName='Hover_3.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Hover_3.eps
 
 
figure('Units','normalized','outerposition',[0 0 1 1])
subplot 311
plot(tp12,ez1);
hline(1,'k','--')
hline(-1,'k','--')
vline(tp12(idf-idx));
legend({" res-zKF1-zKF2"},'Location','southwest')
legend('boxoff')
xlabel("t(s)")
ylim([-5,5]);
xlim([4.6,36]);
subplot 312
plot(tp12,ez2);
hline(1,'k','--')
hline(-1,'k','--')
legend({"res-zKF1-zmodel"},'Location','southwest')
legend('boxoff')
xlabel("t(s)")
ylim([-5,5]);
xlim([4.6,36]);
vline(tp12(idf-idx));
subplot 313
plot(tp12,ez3);
hline(1,'k','--')
hline(-1,'k','--')
legend({"res-zKF2-zmodel"},'Location','southwest')
legend('boxoff')
xlabel("t(s)")
ylim([-5,5]);
xlim([4.6,36]);
vline(tp12(idf-idx));
fileName='Hover_4.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Hover_4.eps


zrr = resample(zr1, length(zb1), length(zr1))
tprr = resample(tpr, length(zb1), length(zr1))


figure('Units','normalized','outerposition',[0 0 1 1])
subplot 211
plot(tprr, zrr, '--', tprr, zb1-0.5, ':')
legend({" zr1","zr2"},'Location','southwest')
legend('boxoff')
xlabel("t(s)");
ylabel("z(m)");
xlim([4.6,36]);
ylim([0,5]);
yticks(0:5)
vline(tp12(idf-idx));
subplot 212
plot(tprr, zrr - zb1 +0.5)
hline(-.5,'k','--')
hline(.5,'k','--')
legend({" Res-zr1-zr2"},'Location','southwest')
legend('boxoff')
xlabel("t(s)");
ylabel("z(m)");
xlim([4.6,36]);
ylim([-1,1]);
vline(tp12(idf-idx));
fileName='Hover_5.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);
print -depsc2 Hover_5.eps
 
 
