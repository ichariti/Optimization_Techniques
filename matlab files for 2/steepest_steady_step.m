function [min,k]=steepest_steady_step(gradient_f,start,e,step)
k=1;
min(:,k)=start;     %initialize
grad(:,k)=gradient_f(double(min(1,k)),double(min(2,k)));   %gradient at a specific point 
accuracy=e;

while norm(grad(:,k))>=accuracy %termination condition
    min(:,k+1)=min(:,k)-(step*grad(:,k));  %main step of algorithm
    grad(:,k+1)=gradient_f(double(min(1,k+1)),double(min(2,k+1)));     %compute gradient at next step
    k=k+1;      %next step
end
disp('max descend with steady step');
k
min(:,k)        %print the result
end
%typecasting to double was an effort to make the script faster