clear all
clc;
syms x1
syms x2
f = (x1-2).^2 + 4*(x2-3).^2;
x0 = [0,0];
m = 2;
k = 20;
[X,F,G,N] = SteepestDescent(f,x0,m,k);
%% plot
figure(1)
subplot(131)
x = 1:k+1;
plot(x-1,F,'-');
xlabel('iteration');
ylabel('f');
title('函数值变化');

subplot(132)
plot(x-1,X(1,:));
xlabel('iteration');
ylabel('x1');
title('x1变化');

subplot(133)
plot(x-1,X(2,:));
xlabel('iteration');
ylabel('x2');
title('x2变化');

figure(2)
subplot(121)
xn1 = linspace(0,4) ;% 定 义 x1 的 点 列 默 认 是 100 个 0 4 代 表 上 下 界
xn2 = linspace(0,4) ;% 定 义 x2 的 点 列
[X1 ,X2] = meshgrid(xn1,xn2) ;% 生 成 坐 标 矩 阵
z = (X1 - 2).^2 + 4*(X2 - 3).^2; % 注 意 是 .^
surf(X1,X2,z);
title('函数图');

subplot(122)
contour (X1,X2,z,100);
hold on,
plot(X(1,:),X(2,:),'r');
title('等高线图中显示锯齿现象');
