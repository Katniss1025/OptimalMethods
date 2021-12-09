clear all;
clc;
f = @(x1,x2)x1^2+x2^2-x1*x2;
H0 = [2 -1;-1 2];
x0 = [2,1];
m = 2;
k = 3;
[X_newtom, H_newton, F_newton, G_newton,HN_newon] = Newton(f,H0,x0,m,k);
% [X, H, F, G,HN] = LM_Newton(f,H0,x0,m,k);
% X���������еĵ� H���ݹ�ʽ����Ľ���ɭ  F����ֵ Gÿһ������ݶ�ֵ HNΪ�Ľ���ɭ�������
% [X, H, F, G,HN,Q,S] = BFGS_Newton(f,H0,x0,m,k);
[X, D, F, G,DN,S,Q] = DFP_method(f,H0,x0,m,k);%Xÿ�εĵ� D��ʽ FĿ�꺯�� S��ʽ  Q��ʽ