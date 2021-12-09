function [val, X, exitFlag] = simplex(A, b, B, c)
%function [val, X, exitFlag] = simplex(A, b, B, c)
% simplex.m
% �����η�������Թ滮
%    �����������Ϊ��׼�Ͷ�Ӧֵ
%    val ���Ž��ֵ 
%    X   ���Ž�  1*n
%    exitFlag �����
%          1:  succeed
%          0:  unbounded
%          -1: iterate 100 times
%    A   ϵ������  m*n
%    b   ��ʼ�����н�  m*1    
%    B   ��ʼ�����н������  m*1
%    c   �۸�ϵ�� 1*n

[m, n] = size(A);
x = 1:m;
y = 1:n;
d = zeros(m,1);
X = zeros(1,n);
c1 = c;
%�����б���
for kk = 1:m
    c1 = c1 - A(kk,:).*c(B(kk));
end

%������100��
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
    
    %����A,b,c�ĵ�������
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