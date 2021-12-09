function [X,F,G,N] = SteepestDescent(f,x0,m,k)
    x1 = sym('x',[1,m]);
    c = num2cell(x1);
    g = sym('x',[m,1]);
    X = zeros(m, k+1);
    F = zeros(1, k+1);
    G = zeros(m, k+1);
    N = zeros(1,k+1);%范数
    X(:,1) = x0;%解
    F(1,1) = subs(f,c,{X(:,1)'});%函数值
    for n = 1:m
        g(n) = diff(f,x1(n));
    end
     G(:,1) = subs(g,c,{X(:,1)'});
    for n = 1:k
        X(:,n+1) = X(:,n) - G(:,n)/norm(G(:,n)); %求x_{n+1}
        F(1,n+1) = subs(f,c,{X(:,n+1)'}); %求在x_{n+1}处的函数值
        G(:,n+1) = subs(g,c,{X(:,n+1)'}); %求在x_{n+1}点处的梯度
    end
    for i = 1:k+1
        N(i) = norm(G(:,1:i)); 
    end
end