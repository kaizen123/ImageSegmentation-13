function [rst,iter] = kmeans1(data,k,pr)
%kmeans �����㷨����ͼ��ָ�
%������������ά��
tmp = size(data);
dim = tmp(1);
%�����������ݸ���
num = tmp(2);
%����������������ĵľ���
cache = zeros(1,k);
%����������ݵ����ֵ����Сֵ
maxnum = max(data(:));
minnum = min(data(:));
%��ʼ����������
initPos = rand(dim,k);
%�޶��������ĵķ�Χ
initPos = initPos+minnum;
initPos = (initPos-min(initPos(:)))*maxnum/(max(initPos(:))-min(initPos(:)));
%������������м����������жϳ����Ƿ��˳�
tmp1 = zeros(dim,k);
%�����������
iter = 0;
while sum((tmp1(:)-initPos(:)).^2)>pr || iter>100000
    for i=1:k
        rst{i} = [];
    end
    for i=1:num
        for j=1:k
            cache(j) = sum((initPos(:,j)-data(:,i)).^2);
        end
        [~,idx] = min(cache);
        rst{idx} = [rst{idx} data(:,i)];
    end
    tmp1 = initPos;
    for l=1:k
        initPos(:,l) = mean(rst{l}')';
    end
    iter = iter+1;
end
    