data = importdata('红主成分.txt');%保存好的文本数据
a = data.data;%所有的参数
b = data.textdata;%所有的字母变量
a = string(a);%转换为字符串格式
b = string(b);
[m,n] = size(a);%m为每个公式中的变量个数，n为公式个数
c = [];
for i=1:n
    d = '';
    for j=1:m
        if contains(a(j,i),'-')%判断是否含有减号
            d = strcat(d,a(j,i),b(j));
        else
            d = strcat(d,'+',a(j,i),b(j));%添加加号
        end
    end
    c = [c;d]
end
