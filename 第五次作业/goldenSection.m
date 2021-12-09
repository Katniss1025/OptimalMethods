function xmin = goldenSection(fun,a,b,eps)
 % ---input
 % fun   �����Ŀ�꺯��
 % a     ������½�
 % b     ������Ͻ�
 %eps    �������С��ֵ����
 % ---output
 % xmin ����ȡ��Сֵʱ�Ա�����ֵ
 x1 = a + 0.382*(b-a);
 x2 = a + 0.618*(b-a);
 f1 = fun(x1);
 f2 = fun(x2);
 while abs(b-a)>eps
     if f1>f2
         a = x1;
         x1 = x2;
         x2 = a +0.618*(b-a);
         f1 = f2;
         f2 = fun(x2);
     else
         b = x2;
         x2 = x1;
         x1 = a+0.382*(b-a);
         f2 = f1;
         f1 = fun(x1);
     end
end
xmin=(b+a)/2;
fmin = fun(xmin)