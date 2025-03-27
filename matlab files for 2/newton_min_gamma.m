function [points,k]=newton_min_gamma(start,accuracy,f,gradient_f,hessian_f)      %this method will run into some problems. hessian_f won't necessarily be invertible at every point.
k=1;
gradf_current=gradient_f(start(1),start(2));
hessianf_current=hessian_f(start(1),start(2));
points(:,k)=start;
iterations=0;
while norm(gradf_current)>=accuracy
    iterations=iterations+1;
    dk=-inv(hessianf_current)*gradf_current;
    step=min_gamma(points(:,k),gradf_current,f);
    points(:,k+1)=points(:,k)+step*dk;
    k=k+1;
    gradf_current = gradient_f(points(1,k),points(2,k));
    hessianf_current=hessian_f(points(1,k),points(2,k));
    if iterations>50
        disp('that is enough')
        break;
    end    
end
disp('newton with min gamma');
k
points(:,k)

%it ends up geting stuck at [0.9554,5.5625]. 
%gradient_f(0.9554,5.5625)=
%                              (20663105575763511542511*exp(-3185419541/100000000))/7812500000000000000000
%                             -(221394186669052341473*exp(-3185419541/100000000))/25000000000000000000
%non zero gradient. This is not a critical point, so the issue isn't the
%termination condition.

%eig(hessian_f(0.9554,5.5625))
 
%ans =
 
%-(109009845433*exp(-3185419541/100000000)*(3*702906902893906098452780824780369^(1/2) - 71498573276924389))/156250000000000000000000000
% (109009845433*exp(-3185419541/100000000)*(3*702906902893906098452780824780369^(1/2) + 71498573276924389))/156250000000000000000000000
%one of the eigenvalues is negative and the other is positive. Therefore
%this is not a positive definite matrix, and so the Newton method can not
%be applied.
