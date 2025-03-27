
function [result,K]=methodosDichotomou(epsilon,l,f,a,b)     %2*epsilon<l
    A=a;
    B=b;
    k=0;
    while abs(B-A)>=l
        x1=((A+B)/2)-epsilon;
        x2=((A+B)/2)+epsilon;
        if f(x1)<f(x2)
            B=x2;
        else
            A=x1;
        end    
        k=k+1;
    end
   result=(A+B)/2;
    K=k;