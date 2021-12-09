clear,clc
x0 = [0,0];
syms x1 x2
f = (x1-2).^2 + 4*(x2-3).^2;
x1 = sym('x',[1,2]);
for n = 1:2
    g(n) = diff(f,x1(n));
end
[F,X,G] = SpeedestDescent_Modified(f,g,x0,0.1);
X = double(X);
F = double(F)';
G = double(G);
[k,~] = size(X);
GN = zeros(k,1);
for i = 1:5
    GN(i) = norm(G(i,:));
end
%% plot
figure(1)
subplot(131)
x = 1:k;
plot(x-1,F,'-');
xlabel('iteration');
ylabel('f');
title('����ֵ�仯');

subplot(132)
plot(x-1,X(:,1));
xlabel('iteration');
ylabel('x1');
title('x1�仯');

subplot(133)
plot(x-1,X(:,2));
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

subplot(122)
contour (X1,X2,z,100);
hold on,
plot(X(:,1),X(:,2),'r');
title('�ȸ���ͼ����ʾ�������');