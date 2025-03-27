function [points,k]=steepest_armijo_step(gradient_f,start,e,f)
k=1;
points(:,k)=start;     %initialize
grad(:,k)=double ( gradient_f(double( points(1,k) ), double( points(2,k)) ) );   %gradient at a specific point 
accuracy=e;

while norm(grad(:,k))>=accuracy %termination condition
    step=armijo(0.1,0.1,1,gradient_f,f,points(:,k));
    points(:,k+1)=points(:,k)-(step*grad(:,k));  %main step of algorithm
    grad(:,k+1)= double( gradient_f( double( points(1,k+1) ) , double( points(2,k+1) ) ) );     %compute gradient at next step
    k=k+1;      %next step
end
disp('max descend with armijo step');
k
points(:,k)        %print the result
end
