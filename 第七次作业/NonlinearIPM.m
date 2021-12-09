function [xsol,fval,history] = NonlinearIPM(x0)

% Set up shared variables with outfun
history.x = [];
history.fval = [];
searchdir = [];
 
% Call optimization
% x0 = [-0.1 -0.1];
options = optimoptions(@fmincon,'OutputFcn',@outfun,... 
    'Display','iter','Algorithm','interior-point'); 
[xsol,fval] = fmincon(@objfun,x0,[],[],[],[],[],[],@confun,options);
 
 function stop = outfun(x,optimValues,state)
     stop = false;
 
     switch state
         case 'init'
             hold on
         case 'iter'
        
           history.fval = [history.fval; optimValues.fval];
           history.x = [history.x; x];
      
%            plot(x(1),x(2),'o');
%        
%            text(x(1),x(2),... 
%                 num2str(optimValues.iteration));
%            title('Sequence of Points Computed by fmincon');
         case 'done'
%              hold off
         otherwise
     end
 end
 
 function f = objfun(x) % TO-DO
     f = -x(1)*x(2);
 end
 
 function [c, ceq] = confun(x) % TO-DO
     % Nonlinear inequality constraints
     % <=0
     c = x(1)^2 + x(2)^2 - 1;
     % Nonlinear equality constraints
     ceq = [];
 end
end