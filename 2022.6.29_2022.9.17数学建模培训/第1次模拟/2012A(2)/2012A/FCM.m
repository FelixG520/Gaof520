clear;clc;close all;
%FCM--模糊c均值聚类--Fuzzy C-means--实例

%% 1.数据与参数输入
iris=load('红理化.txt');
rawiris=iris(:,1:42);
c=3;                %聚类数
m=1.5;              %模糊指标
Max=1000;           %最大迭代次数
tol=1e-3;           %精度

%% 2.数据归一化
[nrow,ncol]=size(rawiris);
normdata=zeros(nrow,ncol);
for i=1:ncol
    for j=1:nrow
        normdata(j,i)=(rawiris(j,i)-std(rawiris(:,i)))/mean(rawiris(:,i));
    end
end

%% 3.FCM聚类分析
%   3.1 初始化隶属度矩阵
u=rand(c,nrow);
for j=1:nrow
    u(:,j) = u(:,j)./sum(u(:,j));    %每个点的隶属度和为1
end
%   3.2 初始化聚类中心
v=repmat(max(normdata,[],1),c,1).*rand(c,ncol);
for i=1:c
    v(i,:)=sum((normdata(:,:).*repmat(u(i,:)'.^m,1,ncol)),1)./sum(u(i,:).^m);  %聚类中心更新公式
end
%   3.3 聚类
v_old=v;
delta=1e4;
k=0;
while  (k<Max && delta>tol)
    for i = 1:c
        for j = 1:nrow
            u(i, j) = 1/sum((euclidean(normdata(j, :), v(i, :))./euclidean(normdata(j, :), v)).^(2/(m-1)));
        end
    end
    for i = 1:c
        v(i, :) = sum((normdata(:, :).*repmat(u(i, :)'.^m, 1, ncol)), 1)./sum(u(i, :).^m);
    end
    v_new = v;
    delta = max(max(abs(v_new-v_old)));
    v_old = v;
    k = k+1;
end
prediction = zeros(1, nrow);
for i=1:nrow
    [M,prediction(i)]=max(u(:,i));
end

function [d] = euclidean(x, Y)
S = size(Y);
d = sum((repmat(x, [S(1),1])-Y).^2, 2);
d = sqrt(d);
end

