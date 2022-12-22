
clear;clc
x = xlsread('红理化.xlsx',1,'B63:AD89')  % 读数据

[n,p] = size(x);  % n是样本个数，p是指标个数
                  % n返回的是行数，p返回的是列数
                  
% 第一步：数据x标准化
X=zscore(x);      % zscore()：matlab内置的标准化函数（x-mean(x)）/std(x)

% 第二步：计算样本协方差矩阵
C = cov(X);

% 其实以上两步可合并为下面的一步：直接计算样本相关系数矩阵
C = corrcoef(x);

disp('样本相关系数矩阵为：')
disp(C);

% 第三步：计算C的特征值和特征向量
% 注意：C是半正定矩阵，所以其特征值不为负数
% C同时是对称矩阵，Matlab在处理对称矩阵时，会将特征值按照从小到大排列
[V,D] = eig(C);  % eig()：计算特征值和特征向量
                 % V 特征向量矩阵  D是由特征值构成的对角矩阵
                 

% 第四步：计算主成分贡献率和累计贡献率
lambda = diag(D);           % diag()：用于得到一个矩阵的主对角线元素值(返回的是列向量)

lambda = lambda(end:-1:1);  % 因为lambda向量是从小大到排序的，我们将其调个顺序

contribution_rate = lambda / sum(lambda);              % 计算贡献率

cum_contribution_rate = cumsum(lambda)/ sum(lambda);   % 计算累计贡献率  cumsum()：求累加值的函数

disp('特征值为：')
disp(lambda')        


disp('贡献率为：')
disp(contribution_rate')


disp('累计贡献率为：')
disp(cum_contribution_rate')


disp('与特征值对应的特征向量矩阵为：')   % 注意：这里的特征向量要和特征值一一对应，之前特征值相当于颠倒过来了，因此特征向量的各列需要颠倒过来
V=rot90(V)';                          % rot90()：可以使一个矩阵逆时针旋转90度，然后再转置，就可以实现将矩阵的列颠倒的效果
disp(V)

xlswrite('红理化.xlsx',lambda,2);   % 把特征值写入当前文件的 脚本2 里面
xlswrite('红理化.xlsx',V,3);        % 把特征向量写入当前文件的 脚本3 里面

