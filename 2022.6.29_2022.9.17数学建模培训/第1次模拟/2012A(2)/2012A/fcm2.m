
clc
% （1）导入样本数据
load('红理化.txt');
disp('【1】模糊C均值聚类分析:')
% （2）设置类的数量为3
num_cluster = 5;
% （3）进行模糊C均值聚类分析
% num_cluster为类的数量；gyzb_data为样本数据；center是一个表示聚类中心的坐标矩阵；
% u是类组成函数矩阵，包括每类中包含的样本数据的等级，0表示空类，1表示满员，介于0~1表示部分填充的类。在每次循环中，目标函数被最小化以搜索类别的最佳位置。
% obj_fcn是最佳位置的值；
disp('(1)Iteration count为迭代次数，obj. fcn为最佳位置的值：')
[center, u, obj_fcn] = fcm(gyzb_data, num_cluster);
disp('(2)聚类中心的坐标矩阵：')
disp(center)
disp('(3)类组成函数矩阵：')
disp(u)
% （4）查找并输出隶属矩阵u每列最大值的行标，确定每个样本的类
id1 = find(u(1, :) == max(u));
id2 = find(u(2, :) == max(u));
id3 = find(u(3, :) == max(u));
disp('(4)聚类结果：')
disp('(4.1)属于第一类[id1]的样本数据行号：')
disp(id1)
disp('(4.2)属于第二类[id2]的样本数据行号：')
disp(id2)
disp('(4.3)属于第三类[id3]的样本数据行号：')
disp(id3)
% （5）选取样本数据的前两列（属性）进行绘图，来可视化。
figure(1);
plot(gyzb_data(:,1),gyzb_data(:,2),'r.','MarkerSize',12)
title('样本数据的前两列的散点图：')
xlabel('样本数据的前第一列值');
ylabel('样本数据的前第二列值');
figure(2);
plot(gyzb_data(id1, 1), gyzb_data(id1, 2), 'marker', '*', 'color', 'r');
hold on
plot(gyzb_data(id2, 1), gyzb_data(id2, 2), 'marker', '*', 'color', 'g');
hold on
plot(gyzb_data(id3, 1), gyzb_data(id3, 2), 'marker', '*', 'color', 'b');
title('样本的模糊C均值聚类示意图：')
xlabel('样本数据的前第一列值');
ylabel('样本数据的前第二列值');
