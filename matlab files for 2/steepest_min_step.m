function [points,k]=steepest_min_step(gradient_f,start,e,f)
%initialize
k=1;
points(:,k)=start;
accuracy=e;
grad(:,k)=gradient_f(points(1,1),points(2,1));
%termination condition
while norm(grad(:,k))>=accuracy
    step=min_gamma(points(:,k),grad(:,k),f);
    points(:,k+1)=points(:,k)-(step*grad(:,k));  %main step of algorithm
    grad(:,k+1)=gradient_f(double(points(1,k+1)),double(points(2,k+1)));     %compute gradient at next step
    k=k+1;      %next step
end    
disp('max descend with min step:');
k
points(:,k)