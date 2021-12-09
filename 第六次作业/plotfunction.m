%% plot
figure(1)
subplot(131)
[k,~] = size(history.fval);
x = 1:k; 
plot(x-1,history.fval,'-');
xlabel('iteration');
ylabel('f');
title('函数值变化');

subplot(132)
plot(x-1,history.x(:,1));
xlabel('iteration');
ylabel('x1');
title('x1变化');

subplot(133)
plot(x-1,history.x(:,2));
xlabel('iteration');
ylabel('x2');
title('x2变化');

figure(2)
subplot(121)
xn1 = linspace(0,2) ;% 定 义 x1 的 点 列 默 认 是 100 个 0 4 代 表 上 下 界
xn2 = linspace(0,6) ;% 定 义 x2 的 点 列
[X1 ,X2] = meshgrid(xn1,xn2) ;% 生 成 坐 标 矩 阵
z = (X1 - 9/4).^2 + (X2 - 2).^2; % 注 意 是 .^
surf(X1,X2,z);
title('函数图');

subplot(122)
contour(X1,X2,z,100);
hold on,
plot(history.x(:,1),history.x(:,2),'r');
title('等高线图中显示锯齿现象');