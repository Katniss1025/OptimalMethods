function [X,F,searchdir] = ExteriorPointMethod
clear all
clc
M = 10000;
c = 1;

searchdir = [];
X(1,:) = [0,0];
F(1) =  9.0625;
for iter = 2:25
options = optimoptions(@fminunc,'Display','iter','MaxIteration',iter); %Ä¬ÈÏquasi-newton
% options = optimset('Display','iter');
x0 = [0,0];
[xsol,fval] = fminunc(@fun,x0,options);
X(iter,:) =  xsol;
F(iter) = fval;
end
function g = fun(x)
    M = M*c;
    f = (x(1)-9/4).^2+(x(2)-2).^2;
    g = f + M*(max(0,x(1).^2-x(2)).^2+ max(0,x(1)+x(2)-6).^2+max(0,-x(1)).^2+max(0,-x(2)));
end

end