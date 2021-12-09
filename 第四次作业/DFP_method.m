function[X, D, F, G,DN,S,Q] = DFP_method(f,H0,x0,m,k)
    x = sym('x',[1,m]); % m = 2, x1 = [x1, x2]
    % f = (x1(1) - 3)^4 + (x1(1) - 3*x1(2))^2; % f = (x1 - 3*x2)^2 + (x1 - 3)^4
    c = num2cell(x);
    g = sym('x',[m,1]);% g = [x1;x2]
    X = zeros(m, k+1); % 记录每次找到的点
    F = zeros(1, k+1); % 目标函数
    G = zeros(m, k+1); % 梯度
    D = zeros( m, m, k+1); 
    DN = zeros( m, m, k+1); 
    D(:,:,1) = inv(H0); %初始D取H0的逆
    DN(:,:,1) = inv(H0);
    X(:,1) = x0; % 记录初始点
    F(1,1) = subs(f,c,{X(:,1)'}); % 求初始点函数值
    % h = hessian(f,x);%%求海森矩阵
    for n = 1:m
        g(n) = diff(f,x(n));
    end
    G(:,1) = subs(g,c,{X(:,1)'});
    for n = 1:k
        X(:,n+1) = X(:,n) - D(:,:,n)*G(:,n);
        F(1,n+1) = subs(f,c,{X(:,n+1)'}); 
        G(:,n+1) = subs(g,c,{X(:,n+1)'});
        S(:,n+1) = X(:,n+1) - X(:,n);
        Q(:,n+1) = G(:,n+1) - G(:,n);
        D(:,:,n+1) = D(:,:,n) + (S(:,n+1) * S(:,n+1)') / (Q(:,n+1)' * S(:,n+1)) - (D(:,:,n) * Q(:,n+1) * Q(:,n+1)' * D(:,:,n)') /  (Q(:,n+1)' * D(:,:,n) * Q(:,n+1));
        DN(:,:,n+1) = inv(D(:,:,n+1));
    end
end