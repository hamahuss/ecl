% clear all;
% add required paths
addpath('../Common');

% load compulsory data
load '../TestData/APM/baro_data.mat';
load '../TestData/APM/gps_data.mat';
load '../TestData/APM/imu_data.mat';
load '../TestData/APM/mag_data.mat';
load '../TestData/APM/out.mat';

% load optional data required for optical flow replay
if exist('../TestData/APM/rng_data.mat','file') && exist('../TestData/APM/flow_data.mat','file')
    load '../TestData/APM/rng_data.mat';
    load '../TestData/APM/flow_data.mat';
else 
    rng_data = [];
    flow_data = [];
end

    GPS1_Data = gps_data;
    Baro1_Data = baro_data;
    IMU1_Data = imu_data;
    Mag1_Data = mag_data;
    out = output;
% clearvars -except GPS1 Baro1 IMU1 Mag1 out*;
clearvars clearvars baro_data imu_data mag_data gps_data rng_data flow_data viso_data;


% load compulsory data
load '../TestData/APM2/baro_data.mat';
load '../TestData/APM2/gps_data.mat';
load '../TestData/APM2/imu_data.mat';
load '../TestData/APM2/mag_data.mat';
load '../TestData/APM2/out2.mat';

% load optional data required for optical flow replay
% if exist('../TestData/APM2/rng_data.mat','file') && exist('../TestData/APM2/flow_data.mat','file')
%     load '../TestData/APM2/rng_data.mat';
%     load '../TestData/APM2/flow_data.mat';
% else 
%     rng_data = [];
%     flow_data = [];
% end
load '../TestData/APM2/rng_data.mat';

    GPS2_Data = gps_data;
    Baro2_Data = baro_data;
    IMU2_Data = imu_data;
    Mag2_Data = mag_data;
     out1 = output1;
     rng = rng_data;
     
%load '../OutputData/rtk/rtk.mat';
    
% clearvars -except GPS* Baro* IM* Mag* out*;
folder = '../OutputData/APM2';

hold on

% Plot_res(GPS1_Data,GPS2_Data,Baro1_Data,Baro2_Data,IMU1_Data,IMU2_Data,Mag1_Data,Mag2_Data,rng_data, output,output1 );
Plot_res_MP(GPS,GPS2,BARO,BAR2,IMT,IMT2,MAG,MAG2,RFND,output,output1);

