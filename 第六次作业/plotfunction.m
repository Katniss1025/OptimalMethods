%% plot
figure(1)
subplot(131)
[k,~] = size(history.fval);
x = 1:k; 
plot(x-1,history.fval,'-');
xlabel('iteration');
ylabel('f');
title('����ֵ�仯');

subplot(132)
plot(x-1,history.x(:,1));
xlabel('iteration');
ylabel('x1');
title('x1�仯');

subplot(133)
plot(x-1,history.x(:,2));
xlabel('iteration');
ylabel('x2');
title('x2�仯');

figure(2)
subplot(121)
xn1 = linspace(0,2) ;% �� �� x1 �� �� �� Ĭ �� �� 100 �� 0 4 �� �� �� �� ��
xn2 = linspace(0,6) ;% �� �� x2 �� �� ��
[X1 ,X2] = meshgrid(xn1,xn2) ;% �� �� �� �� �� ��
z = (X1 - 9/4).^2 + (X2 - 2).^2; % ע �� �� .^
surf(X1,X2,z);
title('����ͼ');

subplot(122)
contour(X1,X2,z,100);
hold on,
plot(history.x(:,1),history.x(:,2),'r');
title('�ȸ���ͼ����ʾ�������');