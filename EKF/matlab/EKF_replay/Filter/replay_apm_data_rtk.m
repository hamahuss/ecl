%%
clearvars  out*;
%close all;

% add required paths
addpath('../Common');

% load compulsory data
load '../TestData/APM_RTK/baro_data.mat';
load '../TestData/APM_RTK/gps_data.mat';
load '../TestData/APM_RTK/imu_data.mat';
load '../TestData/APM_RTK/mag_data.mat';

% load optional data required for optical flow replay
if exist('../TestData/APM_RTK/rng_data.mat','file') && exist('../TestData/APM/flow_data.mat','file')
    load '../TestData/APM_RTK/rng_data.mat';
    load '../TestData/APM_RTK/flow_data.mat';
else 
    rng_data = [];
    flow_data = [];
end


% load optional data required for ZED camera replay
if exist('../TestData/APM_RTK/viso_data.mat','file')
    load '../TestData/APM_RTK/viso_data.mat';
else
    viso_data = [];
end

% load default parameters
run('SetParameters.m');

% run the filter replay 
output_rtk = RunFilter(param,imu_data,mag_data,baro_data,gps_data,rng_data,flow_data,viso_data);

% generate and save output plots
runIdentifier = ' : APM data replay ';
folder = strcat('../OutputPlots/APM_RTK');
%%PlotData(output,folder,runIdentifier);
%%f1=PlotData2D(output,folder,runIdentifier);

% save output data
folder = '../OutputData/APM_RTK';
fileName = '../OutputData/APM_RTK/out.mat';
if ~exist(folder,'dir')
    mkdir(folder);
end
save(fileName,'output_rtk');

fileName = '../TestData/APM_RTK/out.mat';
save(fileName,'output_rtk');

