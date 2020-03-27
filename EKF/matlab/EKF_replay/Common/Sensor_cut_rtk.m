start = 26000;
endt = 120000;


k = find(GPS(:,1)>start ,1,'first');
k1 = find(GPS(:,1)> endt ,1,'first');
GPS = GPS(k:end,:);
GPA = GPA(k:end,:);



k = find(BARO(:,1)>start ,1,'first');
k1 = find(BARO(:,1)> endt ,1,'first');
BARO = BARO(k:end,:);

%%IMT2(:,6:11) = IMT2(:,6:11) + (IMT(1,6:11) - IMT2(1,6:11) );
%%IMT2(:,6:8) = IMT2(:,6:8) - (IMT(1,6:8) + IMT2(1,6:8) );
k = find(IMT(:,1)>start ,1,'first');
k1 = find(IMT (:,1)> endt ,1,'first');
IMT = IMT(k:end,:);


%%MAG2(:,3:5) = MAG2(:,3:5) + (MAG(:,3:5) - MAG2(:,3:5) );
k = find(MAG(:,1)>start ,1,'first');
k1 = find(MAG(:,1)> endt ,1,'first');
MAG = MAG(k:end,:);


k = find(RCOU(:,1)>start ,1,'first');
k1 = find(RCOU(:,1)> endt ,1,'first');
RCOU= RCOU(k:end,:);


k = find(ATT(:,1)>start ,1,'first');
k1 = find(ATT(:,1)> endt ,1,'first');
ATT= ATT(k:end,:);

