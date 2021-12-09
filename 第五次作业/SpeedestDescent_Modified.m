function [F,X,G] = SpeedestDescent_Modified(f,g,x0,eps)
  % ---input
  % fun   所求的目标函数
  % gfun  目标函数的梯度导数
  % x0    初始值
  % ---output
  % feval 极小值
  % x     极小值处自变量的值
  
 syms u % 一维寻优中目标函数的自变量
 G(1,:) = subs(g,{'x1','x2'},x0);
 X(1,:) = x0;
 F(1) = subs(f,{'x1','x2'},x0);
 i = 1;
 while norm(G(i,:))> eps
     i = i+1;
     goldfex = subs(f,{'x1','x2'},X(i-1,:)-u*G(i-1,:)); %表达式
     goldf = inline(goldfex); %将表达式转换成关于u的匿名函数
     lamda = goldenSection(goldf,0,4,0.1); %寻找最优步长
     X(i,:) = X(i-1,:)-lamda*G(i-1,:);
     G(i,:) = subs(g,{'x1','x2'},X(i,:));
     norm(G(i,:));
     F(i) = subs(f,{'x1','x2'},X(i,:));
 end
end