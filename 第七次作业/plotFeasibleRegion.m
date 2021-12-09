clear all
clc
% ��������Լ���µ�ͼ��
figure(1)
[x1, x2] = meshgrid(-1:0.001:1, -1:0.001:1);
F = - x1.*x2;
F(1 - x1.^2 - x2.^2 < 0) = nan;
mesh(x1, x2, F);
% ��������Լ���µĵȸ���ͼ
figure(2)
contour(x1, x2, F,50,'ShowText','on');
aaa=findobj(gca,'type','text');
set(aaa(:),'rotation',0,'fontsize',5)
