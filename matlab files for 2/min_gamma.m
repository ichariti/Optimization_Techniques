function step=min_gamma(current_x,current_grad,f)
syms gama;
syms phi(gama)
phi(gama)=f((current_x(1)-gama*current_grad(1,1)),(current_x(2)-gama*current_grad(2,1)));
[step,~]=methodosDichotomou(0.01,0.03,phi,0,1); % 0<gamma<1, with an accuracy of 0.03
end