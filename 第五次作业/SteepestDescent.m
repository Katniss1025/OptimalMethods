function [X,F,G,N] = SteepestDescent(f,x0,m,k)
    x1 = sym('x',[1,m]);
    c = num2cell(x1);
    g = sym('x',[m,1]);
    X = zeros(m, k+1);
    F = zeros(1, k+1);
    G = zeros(m, k+1);
    N = zeros(1,k+1);%����
    X(:,1) = x0;%��
    F(1,1) = subs(f,c,{X(:,1)'});%����ֵ
    for n = 1:m
        g(n) = diff(f,x1(n));
    end
     G(:,1) = subs(g,c,{X(:,1)'});
    for n = 1:k
        X(:,n+1) = X(:,n) - G(:,n)/norm(G(:,n)); %��x_{n+1}
        F(1,n+1) = subs(f,c,{X(:,n+1)'}); %����x_{n+1}���ĺ���ֵ
        G(:,n+1) = subs(g,c,{X(:,n+1)'}); %����x_{n+1}�㴦���ݶ�
    end
    for i = 1:k+1
        N(i) = norm(G(:,1:i)); 
    end
end