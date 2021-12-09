% options = optimoptions('linprog','Display','iter','MaxIter',50,'Algorithm','simplex');
H = [2 0; 0 2]; 
f = [-2; -5];
A = [-1 2 ; 1 2; 1 2];
b = [2; 6; 2];
A1= [A eye(3)];
H1= [2 0 0 0 0 ; 0 2 0 0 0 ; 0 0  0 0 0; 0 0 0 0 0; 0 0 0 0 0];
c1=[f;zeros(3,1)];
A0=[A1 zeros(3) zeros(3,5) eye(3) zeros(3,5);H1 A1' -eye(5) zeros(5,3) eye(5)];
b0=[b;-c1];
c0=[zeros(13,1);ones(8,1)];
A2=[];
b2=[];
Aeq =A0;
beq = b0;
lb = [zeros(21,1)];
ub = [];
x0 = [];
[x,fval] =linprog(c0,A2,b2,Aeq,beq,lb,ub,x0,options)










    

