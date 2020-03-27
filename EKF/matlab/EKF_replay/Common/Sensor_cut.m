
start = 170000;
endt = 220000;

k  = find(GPS(:,1)> start ,1,'first');
k1 = find(GPS(:,1)> endt ,1,'first');
GPS = GPS(k:end,:);
GPA = GPA(k:end,:);
k = find(GPS2(:,1)>start ,1,'first');
k1 = find(GPS2(:,1)> endt ,1,'first');
GPS2 = GPS2(k:end,:);
GPA2 = GPA2(k:end,:);
k = find(POS(:,1)>start ,1,'first');
k1 = find(POS(:,1)> endt ,1,'first');
POS = POS(k:end,:);


k = find(BARO(:,1)>start ,1,'first');
k1 = find(BARO(:,1)> endt ,1,'first');
BARO = BARO(k:end,:);
k = find(BAR2(:,1)>start ,1,'first');
k1 = find(BAR2(:,1)> endt ,1,'first');
BAR2= BAR2(k:end,:);

%%IMT2(:,6:11) = IMT2(:,6:11) + (IMT(1,6:11) - IMT2(1,6:11) );
%%IMT2(:,6:8) = IMT2(:,6:8) - (IMT(1,6:8) + IMT2(1,6:8) );
k = find(IMT(:,1)>start ,1,'first');
k1 = find(IMT (:,1)> endt ,1,'first');
IMT = IMT(k:end,:);
k = find(IMT2(:,1)>start ,1,'first');
k1 = find(IMT2 (:,1)> endt ,1,'first');
IMT2= IMT2(k:end,:);

%%MAG2(:,3:5) = MAG2(:,3:5) + (MAG(:,3:5) - MAG2(:,3:5) );
k = find(MAG(:,1)>start ,1,'first');
k1 = find(MAG(:,1)> endt ,1,'first');
MAG = MAG(k:end,:);
k = find(MAG2(:,1)>start ,1,'first');
k1 = find(MAG2(:,1)> endt ,1,'first');
MAG2= MAG2(k:end,:);
k = find(MAG3(:,1)>start ,1,'first');
k1 = find(MAG3(:,1)> endt ,1,'first');
MAG3= MAG3(k:end,:);



k = find(RFND(:,1)>start ,1,'first');
k1 = find(RFND(:,1)> endt ,1,'first');
RFND= RFND(k:end,:);

k = min(length(IMT(:,1) ), length(IMT2(:,1) ));
IMT = IMT(1:k,:);
IMT2 = IMT2(1:k,:);

k = min(length(GPS(:,1) ), length(GPS2(:,1) ));
GPS = GPS(1:k,:);
GPS2= GPS2(1:k,:);
GPA = GPA (1:k,:);
GPA2= GPA2(1:k,:);

k = min(length(BARO(:,1) ), length(BAR2(:,1)));
k=min(k, length(RFND(:,1)));
BARO = BARO (1:k,:);
BAR2= BAR2(1:k,:);
RFND = RFND(1:k,:);

k = min(length(MAG (:,1) ), length(MAG2(:,1) ));
k = min (k,length(MAG3(:,1)));
MAG = MAG(1:k,:);
MAG2 = MAG2(1:k,:);
MAG3 = MAG3(1:k,:);

BARO(:,3)=BARO(:,3)-BARO(1,3)+RFND(1,3);
BAR2(:,3)=BAR2(:,3)-BAR2(1,3)+RFND(1,3);


k = find(RCOU(:,1)>start ,1,'first');
k1 = find(RCOU(:,1)> endt ,1,'first');
RCOU= RCOU(k:end,:);

k = find(PSC(:,1)>start ,1,'first');
k1 = find(PSC(:,1)> endt ,1,'first');
PSC= PSC(k:end,:);

k = find(ATT(:,1)>start ,1,'first');
k1 = find(ATT(:,1)> endt ,1,'first');
ATT= ATT(k:end,:);

k = find(IN(:,1)>start ,1,'first');
k1 = find(IN(:,1)> endt ,1,'first');
IN= IN(k:end,:);

k = find(RCOU(:,1)>start ,1,'first');
k1 = find(RCOU(:,1)> endt ,1,'first');
RCOU= RCOU(k:end,:);


folder = strcat('../OutputPlots/RTK');
plotDimensions = [0 0 210*3 297*3];
k = find(VIBE(:,1)>start ,1,'first');
t = VIBE(k:end,2);
t = t / 1000000;
t = t - t(1);
f = designfilt('lowpassiir', 'PassbandFrequency', .1, 'StopbandFrequency', .5, 'PassbandRipple', 1, 'StopbandAttenuation', 60);
IMTf = VIBE(k:end,3);
fx = filter(f,IMTf);
IMTf = VIBE(k:end,4);
fy = filter(f,IMTf);
figure('Units','normalized','outerposition',[0 0 1 1])
plot(t,fx/2, t, fy/2)
ylim([-inf, .3])
xlim([-inf, 23])
xlabel('t(s)');
ylabel('F(N)');
legend('Fy','Fx');
fileName='11_wind.png';
fullFileName = fullfile(folder, fileName);
saveas(gcf,fullFileName);


