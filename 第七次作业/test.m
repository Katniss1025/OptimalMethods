%û�и���t�����ڵ������ǲ���ϵ��t�����ϰ�������ϵ��ȡʲô����ʼ��ȡʲô��������������0��0��
%�����ڵ㷨����˼��ÿ�ε���Ҳֻ����t=t*10����ʼ��x0=������Ľ�X����������
%����������ÿ�ζ�����������0��0�������¾�û��������
%��ô���������������Ĵ���϶������������⣬�ҿ������Ͻ������ⲿ�־�����׼ţ�ٷ�������
%˼������.jpg
clear
m = 2;%����ά��
k1 = 15;%LM��������
x0 = [0.1;0.1];
lamda = 1;
I = ones(m,m);%��λ��
  
[X,F] =  LM_method(x0,m,k1,lamda,I);
%��ͼ
pic(X)
function[X, H, F, G] = LM_method(x0,m,k,lamda,I)
%%����ռ�      
    X = zeros(m, k+1);
    F = zeros(1, k+1);
    G = zeros(m, k+1);
    H = zeros( m, m, k+1);
%% ��ʼ��
    X(:,1) = x0;
    [F(1),H(:,:,1),G(:,1)] = barrir(X(:,1),m,lamda,I);
%% ����
    for n = 1:k
        X(:,n+1) = X(:,n) - (H(:,:,n))\G(:,n)
        [F(1,n+1),H(:,:,n+1),G(:,n+1)] = barrir(X(:,n+1),m,lamda,I) ;     
    end
end

function [fun0,h0,G0] = barrir(x0,m,lamda,I)
%Ŀ�꺯������
    x1 = sym('x',[1,m]);
    c = num2cell(x1);
    %�ϰ�����
    if (x0(1)^2 + x0(2)^2 - 1<= 0)
        barr = -log(1 - x1(1)^2 - x1(2)^2);
    else
        barr = 10^17;
    end
    t = 1;
    f = -x1(1)*x1(2);%Ŀ�꺯��  
    fun = t*f + barr;%Ŀ�꺯��+�ϰ�����
    fun0 = subs(fun,c,x0');
    h = hessian(fun,x1);     
    h0 = subs(h,c,x0') + lamda*I;%��ɭ����+��λ��  
    g = sym('x',[m,1]);
    for n = 1:m
        g(n) = diff(fun,x1(n));%��ʼ���ݶȱ��ʽ
    end
     G0 = subs(g,c,x0');%��ʼ�ݶ�ֵ
end
function []=pic(X)
    xn1 = linspace(-1,1,100);
xn2 = linspace(-1,1,100);
[X1,X2] = meshgrid(xn1,xn2);
z = zeros(100,100);
for i = 1:100
    for j = 1:100
        if(X1(i,j)^2+X2(i,j)^2-1<=0)
            z(i,j) = -X1(i,j)*X2(i,j);
        else
            z(i,j) = nan;
        end
    end
end

figure(1)
surf(X1,X2,z);
grid on;
title('����ͼ��')
figure(2)
contour(X1,X2,z,100);
hold on
plot(X(1,:),X(2,:),'r','linewidth',1.5)
xlabel('x1')
ylabel('x2')
title('��������')
    
end