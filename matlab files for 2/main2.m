clc;
%Θέμα 1 Σχεδιάστε την f(x,y)=(x^5)*exp(-(x^2)-(y^2)) , για να πάρετε μια
%γενική εικόνα της μορφής της
syms f(x,y)
f(x,y)=(x^5)*exp(-(x^2)-(y^2));

figure(10);
fsurf(f,[-6 6 -6 6]);
title('Plot of f(x,y)=(x^5)*exp(-(x^2)-(y^2))');
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
hold on;        %marking the starter points on the graph
x_point=-1;
y_point=1;
z_point=double(f(x_point, y_point));
plot3(x_point, y_point, z_point, 'ro', 'MarkerSize',10,'LineWidth', 2);
text(x_point-1, y_point-0.3, z_point, ...
    sprintf('  (%.1f, %.1f, %.2f)', x_point, y_point, z_point), ...
    'FontSize',12, 'Color', 'red');
x_point=1;
y_point=-1;
z_point=double(f(x_point, y_point));
plot3(x_point, y_point, z_point, 'ro', 'MarkerSize',10,'LineWidth', 2);
text(x_point, y_point-0.2, z_point, ...
    sprintf('  (%.1f, %.1f, %.2f)', x_point, y_point, z_point), ...
    'FontSize',12, 'Color', 'red');
x_point=0;
y_point=0;
z_point=double(f(x_point, y_point));
plot3(x_point, y_point, z_point, 'ro', 'MarkerSize',10,'LineWidth', 2);
text(x_point-0.2, y_point, z_point+0.1, ...
    sprintf('  (%.1f, %.1f, %.2f)', x_point, y_point, z_point), ...
    'FontSize',12, 'Color', 'red');
hold off;

%Θέμα 2 Ελαχιστοποιείστε την f με την μέθοδο μέγιστης καθόδου, χρησιμοποιώντας ως αρχικά
%σημεία (x0 , y0 ) τα i) (0,0), ii) (−1,1), iii) (1,-1). Το βήμα γκ θα επιλεγεί: α) σταθερό
%(της επιλογής σας), β) τέτοιο ώστε να ελαχιστοποιεί την f (xk+ γ κ dk), και γ) βάσει του κανόνα
%Armijo.  Στην περίπτωση σταθερού βήματος δε χρειάζεται μαθηματική ανάλυση για τη συνθήκη
%σύγκλισης. Με βάση τη θεωρία εφαρμόστε τις τιμές απευθείας στο Matlab.
gradient_f=gradient(f,[x,y]);
hessian_f=hessian(f,[x,y]);

%steady step
%%%%%%%%%initial point (0,0)
[result,K]=steepest_steady_step(gradient_f,[0,0],0.01,0.5);   
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(1);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method with step=0.5 and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%

%%%%%%%%%initial point (-1,1)
[result,K]=steepest_steady_step(gradient_f,[-1,1],0.01,0.5);  
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(2)
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method with step=0.5 and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%

%%%%%%%%%initial point (1,-1)
[result,K]=steepest_steady_step(gradient_f,[1,-1],0.01,0.5);   
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(3);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method with step=0.5 and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%


%chosen step using bisection method.

%%%%%%%%%initial point (0,0)
  [result,K]=steepest_min_step(gradient_f,[0,0],0.01,f);  
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(1);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method, step chosen using the bisection method and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%

%%%%%%%%%%initial point(-1,1)
[result,K]=steepest_min_step(gradient_f,[-1,1],0.01,f); 
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(2)
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method, step chosen using the bisection method and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%

%%%%%%%%%%initial point (1,-1)
[result,K]=steepest_min_step(gradient_f,[1,-1],0.01,f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(3);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method, step chosen using the bisection method and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%

%Armijo's rule (a=0.1 , b=0.1 , s=1)

%%%%%%%%initial point (0,0)
[result,K]=steepest_armijo_step(gradient_f,[0,0],0.01,f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(1);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method, step chosen using armijos rule and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%

%%%%%%%%%%initial point (-1,1)
[result,K]=steepest_armijo_step(gradient_f,[-1,1],0.01,f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(2)
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method, step chosen using armijos rule and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%

%%%%%%%%%%initial point (1,-1)
[result,K]=steepest_armijo_step(gradient_f,[1,-1],0.01,f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(3);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend method, step chosen using armijos rule and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%

%Θέμα 3: Επαναλάβετε τα ερωτήματα του Θέματος 2 χρησιμοποιώντας την μέθοδο Newton.

%steady step
%%%%%%%%initial point (0,0)
[result,K]=newton_steady([0,0],0.01,gradient_f,hessian_f,0.5);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(4);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method with step=0.5 and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%

%%%%%%%%%initial point (-1,1)
[result,K]=newton_steady([-1,1],0.01,gradient_f,hessian_f,0.5);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(5);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method with step=0.5 and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];

%%%%%%%%%%

%%%%%%%%%%initial point (1,-1)
[result,K]=newton_steady([1,-1],0.01,gradient_f,hessian_f,0.5);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(6);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method with step=0.5 and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%

%step chosen using bisection method
%%%%%%%%initial point (0,0)
[result,K]=newton_min_gamma([0,0],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(4);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method, step chosen using the bisection method and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%

%%%%%%%%%initial point (-1,1)
[result,K]=newton_min_gamma([-1,1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(5);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method, step chosen using the bisection method and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%initial point (1,-1)
[result,K]=newton_min_gamma([1,-1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(6);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method, step chosen using the bisection method and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%

%armijo's rule (a=0.1 , b=0.1 , s=1)
%%%%%%%%%initial point (0,0)
[result,K]=newton_armijo([0,0],0.01,f,gradient_f,hessian_f);
figure(4);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method, step chosen using armijos rule and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%

%%%%%%%%%initial point (-1,1)
[result,K]=newton_armijo([-1,1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(5);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method, step chosen using armijos rule and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%

%%%%%%%%%initial point (1,-1)
[result,K]=newton_armijo([1,-1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(6);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Newton method, step chosen using armijos rule and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%


%Θέμα 4: Επαναλάβετε τα ερωτήματα του Θέματος 2 χρησιμοποιώντας την μέθοδο Levenberg-
%Marquardt.

%steady step
%%%%%%initial point (0,0)
[result,K]=Lev_Mar_steady([0,0],0.01,gradient_f,hessian_f,0.5);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(7);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step=0.5 and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%%

%%%%%%%%%%%initial point (-1,1)
[result,K]=Lev_Mar_steady([-1,1],0.01,gradient_f,hessian_f,0.5);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(8);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step=0.5 and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%%

%%%%%%%%%%%initial point (1,-1)
[result,K]=Lev_Mar_steady([1,-1],0.01,gradient_f,hessian_f,0.5);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(9);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step=0.5 and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%%

%step chosen with bisection method
%%%%%%%%%%initial point (0,0)
[result,K]=Lev_Mar_min([0,0],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(7);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step calculated using the bisection method and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%%

%%%%%%%%%%initial point(-1,1)
[result,K]=Lev_Mar_min([-1,1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(8);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step calculated using the bisection method and initial point (-1,1)');
values_f=[];
iterations=[];                                                                                                                                                                                                                                                                                  
result=[];
%%%%%%%%%%

%%%%%%%%%%initial point (1,-1)
[result,K]=Lev_Mar_min([1,-1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(9);
subplot(3,1,2);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step calculated using the bisection method and initial point (1,-1)');
values_f=[];
iterations=[];                                                                                                                                                                                                                                                                                  
result=[];
%%%%%%%%%%

%armijo's rule (a=0.1 , b=0.1 , s=1)
%%%%%%%%initial point (0,0)
[result,K]=Lev_Mar_armijo([0,0],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(7);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step calculated using armijos rule and initial point (0,0)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%%

%%%%%%%%%%%initial point (-1,1)
[result,K]=Lev_Mar_armijo([-1,1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(8);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step calculated using armijos rule and initial point (-1,1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%%

%%%%%%%%%%%initial point (1,-1)
[result,K]=Lev_Mar_armijo([1,-1],0.01,f,gradient_f,hessian_f);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(9);
subplot(3,1,3);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Levenberg-Marquardt method, step calculated using armijos rule and initial point (1,-1)');
values_f=[];
iterations=[];
result=[];
%%%%%%%%%%%