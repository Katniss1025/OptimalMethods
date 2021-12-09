function xmin = goldenSection(fun,a,b,eps)
 % ---input
 % fun   所求的目标函数
 % a     区间的下界
 % b     区间的上界
 %eps    区间的最小阀值长度
 % ---output
 % xmin 函数取极小值时自变量的值
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