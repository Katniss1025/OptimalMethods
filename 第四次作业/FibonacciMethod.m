function [X,F,a,d,lambda] = FibonacciMethod(f,domain,delta)
    u=[1 1];      %斐波那契数列数列的第一项和第二项
    n=3;
    while u(end)<(domain(2)-domain(1))/delta    %产生斐波那契数列
        u(n)=u(n-1)+u(n-2);    
        n=n+1;
    end
    n = n-1;
    X = zeros(1,n-2); %solution
    F = zeros(1,n-2); %f
    a = zeros(1,n-2);
    d = zeros(1,n-2);
    lambda(1) = u(n-1)/u(n+1-1);
    a(1) = domain(1);
    d(1) = domain(2);
    b = lambda(1) * a(1) + (1-lambda(1)) * d(1);
    c = (1-lambda(1)) * a(1) + lambda(1) * d(1);
    y1 = -min(subs(f,b));
    y2 = -min(subs(f,c));
    if y1 < y2
        F(1) = y1;
        X(1) = b;
    else
        F(1) = y2;
        X(1) = c;
    end
    i = 2;
    while n-i >= 2
        lambda(i) = u(n-i)/u(n+1-i);
        if y1 > y2
            a(i) = b;
            d(i) = d(i-1);
            b = lambda(i) * a(i) + (1-lambda(i)) * d(i);
            c = (1-lambda(i)) * a(i) + lambda(i) * d(i);
        else
            a(i) = a(i-1);
            d(i) = c;
            b = lambda(i) * a(i) + (1-lambda(i)) * d(i);
            c = (1-lambda(i)) * a(i) + lambda(i) * d(i);
        end
        y1 = -min(subs(f,b));
        y2 = -min(subs(f,c));
        if y1 < y2
            F(i) = y1;
            X(i) = b;
        else
            F(i) = y2;
            X(i) = c;
        end
        i = i+1;
    end
    
end