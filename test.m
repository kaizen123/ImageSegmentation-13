%����ͼ��
I = imread('pic.jpg');
%��rgbͼ��ת���ɻҶ�ͼ��
I = rgb2gray(I);
%ѡȡͼ���һ����
% I = I(128+1:128+256,256+1:256+256);
[m,n] = size(I);
%����άͼ��ѹ����һάͼ�񣬾���ת��
I1 = double(reshape(I,[1,m*n]));
%����kmeans�����㷨
[rst,iter] = kmeans1(I1,3,0.0001);
%ͼ��ָ�
for i=1:3
    I1(I1>=min(rst{i})&I1<=max(rst{i})) = i;
end
%�ָ�ԭͼ��
I2 = reshape(I1,[m,n]);