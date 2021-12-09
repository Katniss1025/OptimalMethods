clear all,
clc
[xsol1,fval1,history1] = NonlinearIPM([0.1 0.1]);
[xsol2,fval2,history2] = NonlinearIPM([-0.1 -0.1]);
%% plot
% ��������µ�x1�������
subplot(221),
iter1 = size(history1.fval);
iter2 = size(history2.fval);
plot(0:iter1-1,history1.x(:,1),'r');
hold on,
plot(0:iter2-1,history2.x(:,1),'b');
title('��������µ�x1�������');
% ��������µ�x2�������
subplot(222),
iter1 = size(history1.fval);
iter2 = size(history2.fval);
plot(0:iter1-1,history1.x(:,2),'r');
hold on,
plot(0:iter2-1,history2.x(:,2),'b');
title('��������µ�x2�������');
% ��������µ�Fval�������
subplot(223);
iter1 = size(history1.fval);
iter2 = size(history2.fval);
plot(0:iter1-1,history1.fval,'r');
hold on,
plot(0:iter2-1,history2.fval,'b');
legend('[0.1 0.1]','[-0.1 -0.1]');
title('��������µ�Fval�������');
%�ȸ����е���
subplot(224);
[x1, x2] = meshgrid(-1:0.001:1, -1:0.001:1);
F = - x1.*x2;
F(1 - x1.^2 - x2.^2 < 0) = nan;
contour(x1, x2, F,50);
title('��ֵ���µ����������x�ĵ������');
hold on,
plot(history1.x(:,1),history1.x(:,2),'r--'); %�������켣
hold on,
plot(history2.x(:,1),history2.x(:,2),'b--');
hold on,
scatter(history1.x(:,1),history1.x(:,2),'r*'); %����
hold on,
scatter(history2.x(:,1),history2.x(:,2),'b*');