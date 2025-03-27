%%Section 1
clc;
clear;
syms f(x1,x2);  
f(x1,x2)=(1/3)*(x1^2)+3*(x2^2);     %ολικό ελάχιστο 0, στο (0,0)
figure(3);
fsurf(f,[-6 6 -6 6]);
title('Plot of f(x,y)=f(x1,x2)=(1/3)*(x1^2)+3*(x2^2)');
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');

gradient_f=gradient(f,[x1,x2]);

% Θέμα 1: Να χρησιμοποιηθεί η Μέθοδος Μέγιστης Καθόδου (προηγούμενη εργασία) με ακρίβεια 𝜀 =
% 0.001 και βήμα i) 𝛾k = 0.1, ii) 𝛾k = 0.3, iii) 𝛾k = 3, iv) 𝛾k = 5 και οποιοδήποτε αρχικό σημείο
% εκκίνησης διαφορετικό του (0,0). Τι παρατηρείτε; Να αποδειχθούν τα αποτελέσματα αυτά με
% μαθηματική αυστηρότητα.

%%Section 2
disp("γk=0.1");
[result,K]=steepest_steady_step(gradient_f,[5,-5],0.001,0.1); %ok
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(1);
subplot(4,1,1);
plot(iterations,values_f,"LineWidth",1.5);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend, γk=0.1');
values_f=[];
iterations=[];
result=[];

disp("γk=0.3");
[result,K]=steepest_steady_step(gradient_f,[5,-5],0.001,0.3); %better accuracy than before, plus less steps
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(1);
subplot(4,1,2);
plot(iterations,values_f,"LineWidth",1.5);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend, γk=0.3');
values_f=[];
iterations=[];
result=[];

disp("γk=3");
[result,K]=steepest_steady_step(gradient_f,[5,-5],0.001,3);   %200+ steps, oveshooting and numerical instability. Result: [-1, NaN]
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(1);
subplot(4,1,3);
plot(iterations,values_f,"LineWidth",1.5);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend, γk=3');
values_f=[];
iterations=[];
result=[];

disp("γk=5");
[result,K]=steepest_steady_step(gradient_f,[5,-5],0.001,5);   %200+ steps, oveshooting and numerical instability. Result: [-1.0258, NaN]
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(1);
subplot(4,1,4);
plot(iterations,values_f,"LineWidth",1.5);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('Steepest descend, γk=5');
values_f=[];
iterations=[];
result=[];

% Θεωρήστε τώρα τους περιορισμούς:−10 ≤ x1 ≤ 5 και −8 ≤ x2 ≤ 12
% Θέμα 2: Να χρησιμοποιηθεί η Μέθοδος Μέγιστης Καθόδου με Προβολή, με 𝑠k = 5, 𝛾k = 0.5,
% σημείο εκκίνησης το (5, −5) και ακρίβεια 𝜀 = 0.01. Τι παρατηρείτε σε σχέση με το Θέμα 1;
%ταλάντωση
%%Section 3
disp('Θέμα 2');
[result,K]=steepest_projection(gradient_f,[5,-5]',0.01,0.5,5);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(2);
subplot(3,1,1);
plot(iterations,values_f);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('sk=5, γk=0.5, start at (5,-5)');
values_f=[];
iterations=[];
result=[];

% Θέμα 3: Να χρησιμοποιηθεί η Μέθοδος Μέγιστης Καθόδου με Προβολή, με 𝑠k = 15, 𝛾k = 0.1,
% σημείο εκκίνησης το (−5,10) και ακρίβεια 𝜀 = 0.01. Τι παρατηρείτε σε σχέση με τα Θέματα 1 και 2;
% Προτείνετε έναν απλό πρακτικό τρόπο ώστε η μέθοδος να συγκλίνει στο ελάχιστο.

%%Section 4
disp('Θέμα 3');
[result,K]=steepest_projection(gradient_f,[-5,10]',0.01,0.1,15);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(2);
subplot(3,1,2);
plot(iterations,values_f,"LineWidth",1.5);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('sk=15, γk=0.1, start at (-5,10)');
values_f=[];
iterations=[];
result=[];

%try this to make it converge
[result,K]=steepest_projection(gradient_f,[-5,10]',0.01,0.1,2);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(4);
plot(iterations,values_f,"LineWidth",1.5);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('sk=2, γk=0.1, start at (-5,10)');
values_f=[];
iterations=[];
result=[];

% Θέμα 4: Να χρησιμοποιηθεί η Μέθοδος Μέγιστης Καθόδου με Προβολή, με 𝑠k = 0.1, 𝛾k = 0.2,
% σημείο εκκίνησης το (8, −10) και ακρίβεια 𝜀 = 0.01. Σε αυτή την περίπτωση, έχουμε εκ των
% προτέρων κάποια πληροφορία σχετικά με την σύγκλιση του αλγορίθμου; Να γίνει η εκτέλεση του
% αλγορίθμου. Τι παρατηρείτε;

%%Section 5
disp('Θέμα 4');
[result,K]=steepest_projection(gradient_f,[8,-10]',0.01,0.2,0.1);
for i=1:K
   values_f(i)= double(f( double((result(1,i))),double(result(2,i))));
   iterations(i)=i;
end  
figure(2);
subplot(3,1,3);
plot(iterations,values_f,"LineWidth",1.5);
xlabel('number of iterations');
ylabel('values of f at each iteration');
title('sk=0.1, γk=0.2, start at (8,-10)');
values_f=[];
iterations=[];
result=[];