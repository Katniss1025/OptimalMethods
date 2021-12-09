clear all;
clc;
f1 = @(x)x/2;
f2 = @(x)2-(x-3)^2;
f3 = @(x)2-x/2;
f = {f1,f2,f3}; % objective functions
domain = [0,8]; 
m = 1;
k = 5; % k denotes itertaion
[X,F,a,d,b,c,fb,fc] = goldenSection(f,domain,k);
% [X,F,a,d,lambda] = FibonacciMethod(f,domain,0.05);
disp('每次迭代区间为：');
disp([a;d]);
