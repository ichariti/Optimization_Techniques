function [points,k]=newton_steady(start,accuracy,gradient_f,hessian_f,step)      %this method will run into some problems. hessian_f won't necessarily be invertible at every point.
k=1;
gradf_current=gradient_f(start(1),start(2));
hessianf_current=hessian_f(start(1),start(2));
points(:,k)=start;
iterations=0;
while norm(gradf_current)>=accuracy
    iterations=iterations+1;
    dk=-inv(hessianf_current)*gradf_current;
    points(:,k+1)=points(:,k)+step*dk;
    k=k+1;
    gradf_current = gradient_f(points(1,k),points(2,k));
    hessianf_current=hessian_f(points(1,k),points(2,k));
    if iterations>50
        disp('that is enough')
        break;
    end    
end
disp('newton with steady step');
k
points(:,k)