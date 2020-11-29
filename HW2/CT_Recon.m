clc;
clear;
close all;
load('hw2-parallelBeamdata.mat');
P = parallelBeam; %ͶӰ����
theta = 0.9:0.9:180; %ͶӰ�Ƕ�

rc = iradon(P,theta,'linear','None');%ֱ�ӷ�ͶӰ�ؽ�
rec_RL = iradon(P,theta,'linear','Ram-Lak');% Ĭ���˲���
rec_SL = iradon(P,theta,'linear','Shepp-Logan');

figure;%��ʾͼ��
subplot(1,3,1),imshow(rc,[]),title('ֱ�ӷ�ͶӰ�ؽ�ͼ��');
subplot(1,3,2),imshow(rec_RL,[]),title('R-L�����˲���ͶӰ�ؽ�ͼ��');
subplot(1,3,3),imshow(rec_SL,[]),title('S-L�����˲���ͶӰ�ؽ�ͼ��');

