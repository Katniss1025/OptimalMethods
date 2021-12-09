clc
clear all 

x0 = 1;
lb = 0;
ub = 1;
options = optimoptions('simulannealbnd','OutputFcn', @myoutSA);
global saprocess
x = simulannealbnd(@obj, x0, lb, ub, options);

x=0:0.01:1;
y = obj(x);
figure
plot(x,y);
title('function');

figure
plot(1:length(saprocess.x), saprocess.x);
xlabel('iteration');
ylabel('x')

figure
plot(1:length(saprocess.fval), saprocess.fval);
xlabel('iteration');
ylabel('function value')

figure
plot(1:length(saprocess.temp), saprocess.temp);
xlabel('iteration');
ylabel('temperature')

function y = obj(x)
    y = -exp( -2 * log(2) .* ((x-0.008)./0.854) .* (sin(5*pi*( x.^0.75-0.05 ))).^6 );
end

function [stop, options, optchanged] = myoutSA(options, optimvalues, flag)
    global saprocess
    optchanged = false;
    stop = false;
    if flag == 'iter'
        saprocess.x(optimvalues.iteration) = optimvalues.x;
        saprocess.fval(optimvalues.iteration) = optimvalues.fval;
        saprocess.temp(optimvalues.iteration) = optimvalues.temperature;
    end
end