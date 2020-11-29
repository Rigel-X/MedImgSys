%% Homework_2 of medical imaging system
   ... Jie Xiang, 2020/10/2

%% generate the white round with black background
clear
close all
A=zeros(256,256);
for i=1:128
    for j=1:128
        r=(128.5-i)^2+(128.5-j)^2;
        r=sqrt(r);
        if r<=48
            A(i,j)=255;
            A(257-i,j)=255;
            A(i,257-j)=255;
            A(257-i,257-j)=255;
        end
    end
end
%figure,imshow(A);

%% 2D fourier transform
B=fft2c(A);
%figure,imshow(abs(B));
%C=ifft2c(B);
%figure,imshow(C);

%% translate the white round 30 voxel along x
D=zeros(256,256);
for i=1:256
    for j=1:226
        if A(i,j)==255
            D(i,j+30)=255;
        end
    end
end
%figure,imshow(D);

E=fft2c(D);
%figure,imshow(abs(E));
%figure,imshow(abs(B)-abs(E))

%% subplot
subplot(2,3,1)
imshow(A)
title('figure1.white round')

subplot(2,3,2)
imshow(angle(B))
title('figure2.phase map')

subplot(2,3,3)
imshow(abs(B))
title('figure3.magnitude map')

subplot(2,3,4)
imshow(D)
title('figure4. translated white round')

subplot(2,3,5)
imshow(angle(E))
title('figure5.phase map')

subplot(2,3,6)
imshow(abs(E))
title('figure6.magnitude map')


