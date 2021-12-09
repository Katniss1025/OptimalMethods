clear all;
clc;
f = @(x1,x2)x1^2+x2^2-x1*x2;
H0 = [2 -1;-1 2];
x0 = [2,1];
m = 2;
k = 3;
[X_newtom, H_newton, F_newton, G_newton,HN_newon] = Newton(f,H0,x0,m,k);
% [X, H, F, G,HN] = LM_Newton(f,H0,x0,m,k);
% X迭代过程中的点 H依据公式计算改进海森  F函数值 G每一点出的梯度值 HN为改进海森矩阵的逆
% [X, H, F, G,HN,Q,S] = BFGS_Newton(f,H0,x0,m,k);
[X, D, F, G,DN,S,Q] = DFP_method(f,H0,x0,m,k);%X每次的点 D公式 F目标函数 S公式  Q公式