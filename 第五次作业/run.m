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
title('����ֵ�仯');

subplot(132)
plot(x-1,X(1,:));
xlabel('iteration');
ylabel('x1');
title('x1�仯');

subplot(133)
plot(x-1,X(2,:));
xlabel('iteration');
ylabel('x2');
title('x2�仯');

figure(2)
subplot(121)
xn1 = linspace(0,4) ;% �� �� x1 �� �� �� Ĭ �� �� 100 �� 0 4 �� �� �� �� ��
xn2 = linspace(0,4) ;% �� �� x2 �� �� ��
[X1 ,X2] = meshgrid(xn1,xn2) ;% �� �� �� �� �� ��
z = (X1 - 2).^2 + 4*(X2 - 3).^2; % ע �� �� .^
surf(X1,X2,z);
title('����ͼ');

subplot(122)
contour (X1,X2,z,100);
hold on,
plot(X(1,:),X(2,:),'r');
title('�ȸ���ͼ����ʾ�������');
