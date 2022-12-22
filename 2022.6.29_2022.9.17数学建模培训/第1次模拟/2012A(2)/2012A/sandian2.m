clear all
clc
A=xlsread('红白综合得分.xlsx','Sheet1','B2:C28');
x=A(:,1);
y=A(:,2);
plot(x,'bo');
plot(y,'ro');