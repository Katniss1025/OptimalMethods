%没有更新t，现在的问题是不管系数t还是障碍函数的系数取什么，起始点取什么，都会收敛到（0，0）
%按照内点法的意思，每次迭代也只是令t=t*10，初始点x0=子问题的解X，这样更新
%但是子问题每次都会收敛到（0，0），更新就没有意义了
%那么下面这个求子问题的代码肯定是哪里有问题，我看讲义上讲的是这部分就是用准牛顿法来求解的
%思考人生.jpg
clear
m = 2;%变量维度
k1 = 15;%LM迭代次数
x0 = [0.1;0.1];
lamda = 1;
I = ones(m,m);%单位阵
  
[X,F] =  LM_method(x0,m,k1,lamda,I);
%画图
pic(X)
function[X, H, F, G] = LM_method(x0,m,k,lamda,I)
%%分配空间      
    X = zeros(m, k+1);
    F = zeros(1, k+1);
    G = zeros(m, k+1);
    H = zeros( m, m, k+1);
%% 初始化
    X(:,1) = x0;
    [F(1),H(:,:,1),G(:,1)] = barrir(X(:,1),m,lamda,I);
%% 迭代
    for n = 1:k
        X(:,n+1) = X(:,n) - (H(:,:,n))\G(:,n)
        [F(1,n+1),H(:,:,n+1),G(:,n+1)] = barrir(X(:,n+1),m,lamda,I) ;     
    end
end

function [fun0,h0,G0] = barrir(x0,m,lamda,I)
%目标函数定义
    x1 = sym('x',[1,m]);
    c = num2cell(x1);
    %障碍函数
    if (x0(1)^2 + x0(2)^2 - 1<= 0)
        barr = -log(1 - x1(1)^2 - x1(2)^2);
    else
        barr = 10^17;
    end
    t = 1;
    f = -x1(1)*x1(2);%目标函数  
    fun = t*f + barr;%目标函数+障碍函数
    fun0 = subs(fun,c,x0');
    h = hessian(fun,x1);     
    h0 = subs(h,c,x0') + lamda*I;%海森矩阵+单位阵  
    g = sym('x',[m,1]);
    for n = 1:m
        g(n) = diff(fun,x1(n));%初始化梯度表达式
    end
     G0 = subs(g,c,x0');%初始梯度值
end
function []=pic(X)
    xn1 = linspace(-1,1,100);
xn2 = linspace(-1,1,100);
[X1,X2] = meshgrid(xn1,xn2);
z = zeros(100,100);
for i = 1:100
    for j = 1:100
        if(X1(i,j)^2+X2(i,j)^2-1<=0)
            z(i,j) = -X1(i,j)*X2(i,j);
        else
            z(i,j) = nan;
        end
    end
end

figure(1)
surf(X1,X2,z);
grid on;
title('函数图像')
figure(2)
contour(X1,X2,z,100);
hold on
plot(X(1,:),X(2,:),'r','linewidth',1.5)
xlabel('x1')
ylabel('x2')
title('迭代过程')
    
end