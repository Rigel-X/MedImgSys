clc;
clear;
close all;
load('hw2-parallelBeamdata.mat');
P = parallelBeam; %投影数据
theta = 0.9:0.9:180; %投影角度

rc = iradon(P,theta,'linear','None');%直接反投影重建
rec_RL = iradon(P,theta,'linear','Ram-Lak');% 默认滤波器
rec_SL = iradon(P,theta,'linear','Shepp-Logan');

figure;%显示图像
subplot(1,3,1),imshow(rc,[]),title('直接反投影重建图像');
subplot(1,3,2),imshow(rec_RL,[]),title('R-L函数滤波反投影重建图像');
subplot(1,3,3),imshow(rec_SL,[]),title('S-L函数滤波反投影重建图像');

