function [F,X,G] = SpeedestDescent_Modified(f,g,x0,eps)
  % ---input
  % fun   �����Ŀ�꺯��
  % gfun  Ŀ�꺯�����ݶȵ���
  % x0    ��ʼֵ
  % ---output
  % feval ��Сֵ
  % x     ��Сֵ���Ա�����ֵ
  
 syms u % һάѰ����Ŀ�꺯�����Ա���
 G(1,:) = subs(g,{'x1','x2'},x0);
 X(1,:) = x0;
 F(1) = subs(f,{'x1','x2'},x0);
 i = 1;
 while norm(G(i,:))> eps
     i = i+1;
     goldfex = subs(f,{'x1','x2'},X(i-1,:)-u*G(i-1,:)); %���ʽ
     goldf = inline(goldfex); %�����ʽת���ɹ���u����������
     lamda = goldenSection(goldf,0,4,0.1); %Ѱ�����Ų���
     X(i,:) = X(i-1,:)-lamda*G(i-1,:);
     G(i,:) = subs(g,{'x1','x2'},X(i,:));
     norm(G(i,:));
     F(i) = subs(f,{'x1','x2'},X(i,:));
 end
end