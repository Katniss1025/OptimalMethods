clc
clear all

options = optimoptions('ga','PlotFcn', @gaplotbestf);
[x1, fval1] = ga(@obj,2,[],[],[],[],[0,0],[6,6],[],1,options);
[x2, fval2] = ga(@obj,2,[],[],[],[],[-6,0],[0,6],[],1,options);
[x3, fval3] = ga(@obj,2,[],[],[],[],[-6,-6],[0,0],[],1,options);
[x4, fval4] = ga(@obj,2,[],[],[],[],[0,-6],[6,0],[],1,options);

function y = obj(x)
    y = -( 2186 - (x(1).^2+x(2)-11).^2 - (x(1)+x(2).^2-7).^2 ) ./ 2186;
end