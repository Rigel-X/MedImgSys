%% Copyright by shaoxin, BME, Tsinghua University.
%% suzhisanlian & path definition
clear;
close all
clc;

addpath('T2_value\');

%% data processing and const definition
m = 180; n = 180; num = 5;
kdata = zeros(m,n,num);
img = zeros(m,n,num);
for i=1:num
    filename = ['kdata',num2str(i),'.mat'];
    kdata(:,:,i) = importdata(filename);
    img(:,:,i) = fftshift(ifft2(kdata(:,:,i)));
end
TE=[15,30,45,60,75];

%% task1-figure of s
figure;
for i=1:num
    subplot(2,3,i);
    imshow(abs(img(:,:,i)),[]);%尽量注意使用“[]”参数，因为这个图像不是标准的8bit数值图像
    title(['TE=' num2str(TE(i)) 'ms']);
end
figure;
for i=1:num
    subplot(2,3,i);imshow(angle(img(:,:,i)),[]);
    title(['TE=' num2str(TE(i)) 'ms']);
end

%% task2-compute T2
T2map = zeros(m,n);
MMM = zeros(m,n);
A = [15,1;30,1;45,1;60,1;75,1];
for i = 1:m
    i
    for j = 1:n
        s = zeros(1,num);
        ii = ones(1,num);
        for k = 1:num
            s(1,k) = abs(img(i,j,k));
        end
        judge = abs(s);
%         if s(1)>s(2)>s(3)>s(4)>s(5)>0 && max(judge)>0.35
        if max(judge)>0.06
            s = log(s);
            reverse_t2 = (A'*A)\(A'*s');
            t2 = -1/reverse_t2(1);
            T2map(i,j) = t2;
        end
    end
end
aha = max(max(MMM));
ahaha = max(max(T2map));
T2map = move_zero(T2map);
figure;
set(gca,'position',[0.1,0.1,0.9,0.9])
imagesc(T2map,[0 300]);
axis off;
axis equal;
colorbar;
truesize;
colormap parula;
title('T2 map');