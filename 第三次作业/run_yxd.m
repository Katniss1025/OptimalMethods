%% Info
% Created by Xiaodan YIN
% 2021/10/9
% ID:202128007329002
%%
clear all;
clc;
% minf(x) = 1/2*x'*H*x + c'*x
A = [-1 2;1 2;1 2];
H = [2 0;0 2];
c = [-2;-5];
b = [2;6;2];
%% 单纯形法
% 将不等式约束转为等式约束后
A1 = [-1,2,1,0,0;
       1,2,0,1,0;
       1,2,0,0,1];
H1 = [2 0 0 0 0;
      0 2 0 0 0;
      0 0 0 0 0;
      0 0 0 0 0;
      0 0 0 0 0];
c1 = [-2;-5;0;0;0];
% A0*x0 = b0
A0 = [A1 zeros(3) zeros(3,5)   eye(3)    zeros(3,5);
      H1    A1'   -eye(5)    zeros(5,3)     eye(5) ];
b0 = [b;-c1];
c0 = [zeros(5+3+5,1);ones(3+5,1)];
% 线性函数求解
lb = zeros(size(c0));
% options1 = optimoptions('linprog','Algorithm','dual-simplex','Display','iter');
% [x fval] = linprog(c0,[],[],A0,b0,lb,[],options1);
%% 内点法
exitflag = 0;
figure(1);
iter = 0;
while iter ~= 6
    options2 = optimoptions('quadprog','Algorithm','interior-point-convex','Display','iter','MaxIteration',iter);
    [x,fval,exitflag,output,lambda] = quadprog(H,c,A,b,[],[],lb,[],[],options2);
    scatter(iter+1,x(1),'r*');
    hold on
    scatter(iter+1,x(2),'b');
    hold on
    iter = iter + 1;
end
xlabel('x1'),ylabel('x2');
title('内点法迭代图');
legend('x1','x2');
%% 有效集法
exitflag = 0;
figure(2);
iter = 0;
while iter ~= 5
    options3 = optimoptions(@fmincon,'Algorithm','active-set',...
                            'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true,...
                            'Display','iter-detailed','MaxIteration',iter);
    [y,fval,exitflag,output,lambda] = quadprog(H,c,A,b,[],[],lb,[],[],options3);
    scatter(iter+1,y(1),'r*');
    hold on
    scatter(iter+1,y(2),'b');
    hold on
    iter = iter + 1
end
xlabel('x1'),ylabel('x2');
title('有效集法迭代图');
legend('x1','x2');
