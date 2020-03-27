spheroid = referenceEllipsoid('GRS 80');
start = 26000;
endt = 220000;
k = find(GPS(:,1)>start ,1,'first')
rtk_P1 = GPS(k:end,:);
rtk_P2 = GPA(k:end,:);
k = find(NKF1(:,1)>start ,1,'first')
Lat = NKF1(k:end,11);
Lng = NKF1(k:end,10);

Lat = Lat - Lat(1);
Lng = Lng - Lng(1);
k = find(BARO(:,1)>start ,1,'first')
alt = BARO(k:end,3);
 [xE1,yN1,zUp1] = geodetic2enu(rtk_P1(:,8),rtk_P1(:,9),rtk_P1(:,10),rtk_P1(1,8),rtk_P1(1,9),rtk_P1(1,10),spheroid);

time= rtk_P1(:,2);
% rtk_P = [Lat Lng time];
rtk_P = [xE1 yN1];
folder = '../OutputData/rtk';
fileName = '../OutputData/rtk/rtk_P.mat';
if ~exist(folder,'dir')
mkdir(folder);
end
save(fileName,'rtk_P');
rng = load ('../TestData/APM2/baro_data.mat');
gps1 = load ('../TestData/APM2/gps_data.mat');

plot(alt);
hold on
l1 = length(alt);
l2 = length(rng.baro_data.height');
 rngres = resample(rng.baro_data.height',l1,l2);
plot(rngres)
figure(2)
plot(xE1, yN1)



% plot(yN1)
% hold on
% l1 = length(xE1);
% l2 = length(gps1.gps_data.pos_ned);
% yNres = resample(gps1.gps_data.pos_ned(:,1),l1,l2);
% plot(yNres)
