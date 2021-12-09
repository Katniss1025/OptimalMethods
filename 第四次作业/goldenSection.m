function [X,F,a,d,B,C,fb,fc] = goldenSection(f,domain,k)
    X = zeros(1,k+1); %solution
    F = zeros(1,k+1); %f
    a = zeros(1,k+1);
    d = zeros(1,k+1);
    lambda = 0.618;
    a(1) = domain(1);
    d(1) = domain(2);
    fb = zeros(1,k+1);
    fc = zeros(1,k+1);
    B = zeros(1,k+1);
    C = zeros(1,k+1);
    b = lambda * a(1) + (1-lambda) * d(1);
    c = (1-lambda) * a(1) + lambda * d(1);
    B(1) = b; C(1) = c;
    y1 = -min(subs(f,b));
    y2 = -min(subs(f,c));
    fb(1) = y1; fc(1) = y2;
    if y1 < y2
        F(1) = y1;
        X(1) = b;
    else
        F(1) = y2;
        X(1) = c;
    end
    
    for i = 2:k+1
        if y1> y2
            a(i) = b;
            d(i) = d(i-1);
            b = lambda * a(i) + (1-lambda) * d(i);
            c = (1-lambda) * a(i) + lambda * d(i);
            B(i) = b; C(i) = c;
        else
            a(i) = a(i-1);
            d(i) = c;
            b = lambda * a(i) + (1-lambda) * d(i);
            c = (1-lambda) * a(i) + lambda * d(i);
            B(i) = b; C(i) = c;
        end
        y1 = -min(subs(f,b));
        y2 = -min(subs(f,c));
        fb(i) = y1; fc(i) = y2;
        if y1 < y2
            F(i) = y1;
            X(i) = b;
        else
            F(i) = y2;
            X(i) = c;
        end
    end
end