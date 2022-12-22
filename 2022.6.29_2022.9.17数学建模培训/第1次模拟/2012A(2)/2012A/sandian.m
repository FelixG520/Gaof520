clear all
clc
A=xlsread('红白综合得分.xlsx','Sheet1','G2:H29');
x=A(:,1);
y=A(:,2);
plot(x,'bo');
plot(y,'ro');