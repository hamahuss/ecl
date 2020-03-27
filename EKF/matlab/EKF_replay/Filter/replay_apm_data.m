%%
clearvars  out*;
%close all;

% add required paths
addpath('../Common');

% load compulsory data
load '../TestData/APM/baro_data.mat';
load '../TestData/APM/gps_data.mat';
load '../TestData/APM/imu_data.mat';
load '../TestData/APM/mag_data.mat';

% load optional data required for optical flow replay
if exist('../TestData/APM/rng_data.mat','file') && exist('../TestData/APM/flow_data.mat','file')
    load '../TestData/APM/rng_data.mat';
    load '../TestData/APM/flow_data.mat';
else 
    rng_data = [];
    flow_data = [];
end
    load '../TestData/APM/rng_data.mat';

% load optional data required for ZED camera replay
if exist('../TestData/APM/viso_data.mat','file')
    load '../TestData/APM/viso_data.mat';
else
    viso_data = [];
end

% load default parameters
run('SetParameters.m');

% run the filter replay 
output = RunFilter(param,imu_data,mag_data,baro_data,gps_data,rng_data,flow_data,viso_data);

% generate and save output plots
runIdentifier = ' : APM data replay ';
folder = strcat('../OutputPlots/APM');
%%PlotData(output,folder,runIdentifier);
%%f1=PlotData2D(output,folder,runIdentifier);

% save output data
folder = '../OutputData/APM';
fileName = '../OutputData/APM/out.mat';
if ~exist(folder,'dir')
    mkdir(folder);
end
save(fileName,'output');

fileName = '../TestData/APM/out.mat';
save(fileName,'output');

%%
%%clearvars -except out* f*;
%close all;
clearvars clearvars baro_data imu_data mag_data gps_data rng_data flow_data viso_data;


% load compulsory data
load '../TestData/APM2/baro_data.mat';
load '../TestData/APM2/gps_data.mat';
load '../TestData/APM2/imu_data.mat';
load '../TestData/APM2/mag_data.mat';

% load optional data required for optical flow replay
if exist('../TestData/APM2/rng_data.mat','file') && exist('../TestData/APM2/flow_data.mat','file')
    load '../TestData/APM2/rng_data.mat';
    load '../TestData/APM2/flow_data.mat';
else 
    rng_data = [];
    flow_data = [];
end
load '../TestData/APM2/rng_data.mat';

% load optional data required for ZED camera replay
if exist('../TestData/APM2/viso_data.mat','file')
    load '../TestData/APM2/viso_data.mat';
else
    viso_data = [];
end

% load default parameters
run('SetParameters.m');

% run the filter replay 
output1 = RunFilter(param,imu_data,mag_data,baro_data,gps_data,rng_data,flow_data,viso_data);

% generate and save output plots
runIdentifier = ' : APM data replay ';
folder = strcat('../OutputPlots/APM2');
%%PlotData(output1,folder,runIdentifier);
%%PlotData2D2(output1,folder,runIdentifier,f1);

% save output data
folder = '../OutputData/APM2';
fileName = '../OutputData/APM2/out2.mat';
if ~exist(folder,'dir')
    mkdir(folder);
end
save(fileName,'output1');

fileName = '../TestData/APM2/out2.mat';
save(fileName,'output1');
%%close all;
clearvars baro_data imu_data mag_data gps_data rng_data flow_data viso_data;