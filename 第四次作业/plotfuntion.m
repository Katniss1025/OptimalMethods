syms x
f1 = x/2;
f2 = 2-(x-3)^2;
f3 = 2-x/2;
f={f1,f2,f3};
figure(1)
x = 0:8;
% plot(x,subs(f1,x));
% hold on
% plot(x,subs(f2,x));
% hold on
% plot(x,subs(f3,x));
% legend('x1','x2','x3')
f4 = f2-f3;
