clear
close all
clc

S001_front = readtable("S001_1DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S004_front = readtable("S004_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S008_front = readtable("S008_1DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S011_front = readtable("S011_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");
S013_front = readtable("S013_2DLC_resnet50_P_vista_frontaleJul26shuffle1_550000__filtered.csv");


y_elbow_r=table2array(S011_front(:,8));
x_elbow_r=table2array(S011_front(:,7));
pos_elbow_r = sqrt(y_elbow_r.^2+x_elbow_r.^2);

velocity_y_elbow_r = diff(y_elbow_r);
velocity_y_elbow_r = diff(velocity_y_elbow_r);

velocity_elbow_r = diff(pos_elbow_r);
acc_elbow_r = diff(velocity_elbow_r);
figure(13)
plot(acc_elbow_r)

figure(1)
plot(velocity_y_elbow_r)
hold on

% fc = 6;
% fs = 30;
% 
% [b,a] = butter(12,fc/(fs/2));
% velocity_elb_y_r = filtfilt(b,a,velocity_y_elbow_r);
% plot(velocity_elb_y_r)

a = 1;
size=4;
b = ones(1,size)./size;
velocity_elb_y_r = filter(b,a,velocity_y_elbow_r);
plot(velocity_elb_y_r)

abs_velocity_elb_y_r=abs(velocity_elb_y_r);
standard_deviation = std(abs_velocity_elb_y_r);
average = mean(abs_velocity_elb_y_r);
[pks_velocity_elbyr,locs_velocity_elbyr]=findpeaks(abs_velocity_elb_y_r,'MinPeakDistance',17);

locs_velocity_elbyr = locs_velocity_elbyr(pks_velocity_elbyr > 0.6*standard_deviation);
pks_velocity_elbyr = pks_velocity_elbyr(pks_velocity_elbyr > 0.6*standard_deviation);

figure(2)
plot(abs_velocity_elb_y_r)
hold on
plot(locs_velocity_elbyr, pks_velocity_elbyr, 'ro')