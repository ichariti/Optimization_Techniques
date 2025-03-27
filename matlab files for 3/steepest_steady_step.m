function [points,k]=steepest_steady_step(gradient_f,start,accuracy,step)
k=1;
points(:,k)=start;     %initialize
grad(:,k)=gradient_f(double(points(1,k)),double(points(2,k)));   %gradient at a specific point 

while norm(grad(:,k))>=accuracy %termination condition
    points(:,k+1)=points(:,k)-(step*grad(:,k));  %main step of algorithm
    grad(:,k+1)=gradient_f(double(points(1,k+1)),double(points(2,k+1)));     %compute gradient at next step
    k=k+1;      %next step
end
disp('max descend with steady step');
k
points(:,k)        %print the result
end
%typecasting to double was an effort to make the script faster