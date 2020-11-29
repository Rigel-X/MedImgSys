
clear;
close all
clc;

addpath('T1_value\');

%% data processing and const definition
m = 168; n = 180; num = 5;
kdata = zeros(m,n,num);
img = zeros(m,n,num);
for i=1:num
    filename = ['kdata',num2str(i),'.mat'];
    kdata(:,:,i) = importdata(filename);
    img(:,:,i) = fftshift(ifft2(kdata(:,:,i)));
end
TI=400:200:1200;

%% task1-figure of s
figure;
for i=1:num
    subplot(2,3,i);
    imshow(abs(img(:,:,i)),[]);
    title(['TI=' num2str(TI(i)) 'ms']);
end
figure;
for i=1:num
    subplot(2,3,i);imshow(angle(img(:,:,i)),[]);
    title(['TI=' num2str(TI(i)) 'ms']);
end

%% task2-compute T1
T1map = zeros(m,n);
MMM = zeros(m,n);
for i = 1:m
    i
    for j = 1:n
        s = zeros(1,num);
        ii = ones(1,num);
        for k = 1:num
            s(1,k) = abs(img(i,j,k));
            if real(img(i,j,k))+imag(img(i,j,k))<0
                s(1,k) = -s(1,k);
            end
        end
        if max(abs(s))>0.035
            s = s/(s(5)-s(1));
            func=@(beta,s)beta(1)*(1-2*exp(-TI/beta(2)));
            beta0 = [1,1000];
            beta = lsqcurvefit(func,beta0,TI,s,[0,0],[5,4000]);
            T1map(i,j) = beta(2);
            MMM(i,j) = beta(1);
        end
    end
end
aha = max(max(MMM));
ahaha = max(max(T1map));
T1map_m = move_zero(T1map);
figure;
set(gca,'position',[0.1,0.1,0.9,0.9])
imagesc(T1map_m,[0 2500]);
axis off;
axis equal;
colorbar;
truesize;
colormap parula;
title('T1 map');
