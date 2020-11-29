function fh_RL=RLfilter(N,d)
% R-L filter function
% ----------------------
% ���������
% N:ͼ���С��̽����ͨ��������
% d:ƽ�Ʋ���
% ���������
%fh_RL:R-L�˲�����
fh_RL = zeros(1,N);
for k1 = 1:N
    fh_RL(k1) = -1/(pi*pi*((k1-N/2-1)*d)^2);
    if mod(k1-N/2-1,2) ==0
        fh_RL(k1) = 0;
    end
end
fh_RL(N/2+1) = 1/(4*d^2);