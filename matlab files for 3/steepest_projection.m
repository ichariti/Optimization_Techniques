function [points,k]=steepest_projection(gradient_f,start,accuracy,step,sk)

k=1;   
points(:,k)=start;     %initialize
grad(:,k)=double( gradient_f(double(points(1,k)),double(points(2,k))) );   %gradient at a specific point 

while( norm(grad(:,k))>=accuracy  ) 
  
    if k>2000
       disp('too many iterations');
       break;
    end
    
    w(:,k)=points(:,k)-sk*grad(:,k);
    xk_bar(:,k)=Projection(w(:,k),[-10,5]',[-8, 12]');
    points(:,k+1)=points(:,k)+step*(xk_bar(:,k)-points(:,k));
    k=k+1;
    grad(:,k)=double( gradient_f(double(points(1,k)),double(points(2,k))) );
   
end
disp('steepest with conditions');
k
double(points(:,k))       %print the result
end

function v=Projection(v,a,b)
   if v(1)<a(1)
       v(1)=a(1);
   elseif v(1)>a(2)
       v(1)=a(2);
   end

   if v(2)<b(1)
       v(2)=b(1);
   elseif v(2)>b(2)    
       v(2)=b(2);
   end    
end

