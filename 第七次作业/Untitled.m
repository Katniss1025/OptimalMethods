clear all
clc
[x1, x2] = meshgrid(-2:0.01:2, -2:0.01:2);
F = - x1.*x2;
F(1 - x1.^2 - x2.^2 < 0) = nan;
mesh(x1, x2, F);