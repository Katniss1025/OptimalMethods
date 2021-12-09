%f表示f表达式
%H0表示初始的海森矩阵
%x0表示初始的迭代点 为列向量
%m表示变量的个数
%k表示迭代次数
%X存储每次迭代的x,F为函数值，G为每次的梯度，H为海森阵，HN为海森矩阵的逆
function[X, H, F, G,HN,Q,S] = BFGS_Newton(f,H0,x0,m,k)
    x1 = sym('x',[1,m]);
    %f = (x1(1) - 3)^4 + (x1(1) - 3*x1(2))^2;
    c = num2cell(x1);
    g = sym('x',[m,1]);
    X = zeros(m, k+1);
    F = zeros(1, k+1);
    G = zeros(m, k+1);
    H = zeros( m, m, k+1);
    HN = zeros( m, m, k+1);
    H(:,:,1) = H0;
    HN(:,:,1) = inv(H0);
    X(:,1) = x0;
    F(1,1) = subs(f,c,{X(:,1)'});
    h = hessian(f,x1);%求海森矩阵
    for n = 1:m
        g(n) = diff(f,x1(n));
    end
     G(:,1) = subs(g,c,{X(:,1)'});
    for n = 1:k
        X(:,n+1) = X(:,n) - (H(:,:,n))\G(:,n); %求x_{n+1}
        F(1,n+1) = subs(f,c,{X(:,n+1)'}); %求在x_{n+1}处的函数值
        G(:,n+1) = subs(g,c,{X(:,n+1)'}); %求在x_{n+1}点处的梯度
        s = X(:,n+1) - X(:,n);
        q = G(:,n+1) - G(:,n);
        S(:,n+1) = s;
        Q(:,n+1) = q;
        H(:,:,n+1) = H(:,:,n) + (q*q')/(q'*s) - (H(:,:,n)'*s*s'*H(:,:,n))/(s'*H(:,:,n)*s); %求x_{n+1}的海森矩阵
        HN(:,:,n+1) = inv(H(:,:,n+1)); %求逆
    end
end