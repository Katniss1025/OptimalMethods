clear all,
clc
[xsol1,fval1,history1] = NonlinearIPM([0.1 0.1]);
[xsol2,fval2,history2] = NonlinearIPM([-0.1 -0.1]);
%% plot
% 两种情况下的x1迭代结果
subplot(221),
iter1 = size(history1.fval);
iter2 = size(history2.fval);
plot(0:iter1-1,history1.x(:,1),'r');
hold on,
plot(0:iter2-1,history2.x(:,1),'b');
title('两种情况下的x1迭代结果');
% 两种情况下的x2迭代结果
subplot(222),
iter1 = size(history1.fval);
iter2 = size(history2.fval);
plot(0:iter1-1,history1.x(:,2),'r');
hold on,
plot(0:iter2-1,history2.x(:,2),'b');
title('两种情况下的x2迭代结果');
% 两种情况下的Fval迭代结果
subplot(223);
iter1 = size(history1.fval);
iter2 = size(history2.fval);
plot(0:iter1-1,history1.fval,'r');
hold on,
plot(0:iter2-1,history2.fval,'b');
legend('[0.1 0.1]','[-0.1 -0.1]');
title('两种情况下的Fval迭代结果');
%等高线中迭代
subplot(224);
[x1, x2] = meshgrid(-1:0.001:1, -1:0.001:1);
F = - x1.*x2;
F(1 - x1.^2 - x2.^2 < 0) = nan;
contour(x1, x2, F,50);
title('等值线下的两种情况的x的迭代情况');
hold on,
plot(history1.x(:,1),history1.x(:,2),'r--'); %画搜索轨迹
hold on,
plot(history2.x(:,1),history2.x(:,2),'b--');
hold on,
scatter(history1.x(:,1),history1.x(:,2),'r*'); %画点
hold on,
scatter(history2.x(:,1),history2.x(:,2),'b*');