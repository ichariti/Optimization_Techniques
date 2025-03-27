function [points,k]=Lev_Mar_steady(start,accuracy,gradient_f,hessian_f,step)
k=1;
gradf_current=gradient_f(start(1),start(2));
hessianf_current=hessian_f(start(1),start(2));
points(:,k)=start;
while norm(gradf_current)>=accuracy
    eigenvalues=double(eig(hessianf_current));
    max_eig=double(abs(max(eigenvalues)));
    M=max_eig+1;
    v=[1,1];
    A=hessianf_current+M*diag(v);
    dk=-inv(A)*gradf_current;
    
    points(:,k+1)=points(:,k)+step*dk;
    k=k+1;
    gradf_current = gradient_f(points(1,k),points(2,k));
    hessianf_current=hessian_f(points(1,k),points(2,k));
   
end

disp('Levenberg-Marquardt with steady step')
k
points(:,k)
