load 红理化.txt %把原始数据保存在纯文本文件gj.txt中
gc1=zscore(gc1); %数据标准化
r=corrcoef(gc1); %计算相关系数矩阵
[x,y,z]=pcacov(r); 
f=repmat(sign(sum(x)),size(x,1),1); 
x=x.*f; 
df=gc1*x(:,1:4) 
tf=df*z(1:4)/100; 
[stf,ind]=sort(tf,'descend')
 
