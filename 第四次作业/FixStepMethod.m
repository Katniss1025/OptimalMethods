clear all
clc
domain = [0,8];
s = 2;
k = 5;
x0 = (domain(1)+domain(2))/2;
f = @(x)-((x>=0&x<2 | x>=4.5&x<=8).*(2-(x-3).^2) + (x>=2&x<4.5).*(2-x/2)) ;
g = @(x)-((x>=0&x<2 | x>=4.5&x<=8).*(6 - 2*x) + (x>=2&x<4.5).*(-1/2)) ;
F = zeros(1,k);
X = zeros(1,k);
D = zeros(1,k);
X(1) = x0;
e = 0.4;
syms x
D(1) = -g(x0);
i=2;
while norm(D(i-1)) > e
    X(i) = X(i-1) + s * D(i-1); 
    D(i) = -g(X(i));
    F(i) = f(X(i));
    i = i+1;
end
ind = find(F==min(F));
X_min = X(ind);
fprintf("在%d处取得最小值为：%f\n",X_min,min(F));
