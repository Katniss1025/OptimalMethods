function [val, X, exitFlag] = simplex(A, b, B, c)
%function [val, X, exitFlag] = simplex(A, b, B, c)
% simplex.m
% 单纯形法求解线性规划
%    函数输入各项为标准型对应值
%    val 最优解的值 
%    X   最优解  1*n
%    exitFlag 求解结果
%          1:  succeed
%          0:  unbounded
%          -1: iterate 100 times
%    A   系数矩阵  m*n
%    b   初始基可行解  m*1    
%    B   初始基可行解的索引  m*1
%    c   价格系数 1*n

[m, n] = size(A);
x = 1:m;
y = 1:n;
d = zeros(m,1);
X = zeros(1,n);
c1 = c;
%计算判别数
for kk = 1:m
    c1 = c1 - A(kk,:).*c(B(kk));
end

%最多迭代100次
for count=1:100
    [cMin, cIndex] = min(c1);
    if (cMin >= 0)
        exitFlag = 1;
        break;              
    end

    [dMin, dIndex] = minD(b, A(:,cIndex));
    if (isinf(dMin))
        exitFlag = 0;
        break;
    end
    
    B(dIndex) = cIndex;
    major = A(dIndex, cIndex);
    
    %矩阵A,b,c的迭代更新
    A(dIndex,:) = A(dIndex,:)./major;
    b(dIndex) = b(dIndex)/major;
    
    temp = b(dIndex);
    b(x) = b(x) - A(x,cIndex)*b(dIndex);
    b(dIndex) = temp;

    temp = A(dIndex,:);
    A(x,y) = A(x,y) - A(x,cIndex)*A(dIndex,y);
    A(dIndex,:) = temp;
                
    c1 = c1 - c1(cIndex)*A(dIndex,:);
end

if count==100
    exitFlag = -1;
end
X(B(x)) = b(x);
val = sum(X.*c);