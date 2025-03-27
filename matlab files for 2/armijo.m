function step=armijo(a,b,s,gradient_f,f,point)  
                                                %a,b,s have predetermined
                                                %values. Say a=0.1,
                                                %b=0.1 and s=1 (initial step).

step=s*b;
p=point;
i=1;
while true
    i=i+1;
    grad_at_p=double( gradient_f(double(p(1)) , double(p(2)) ));
    dk=double(-grad_at_p);
    next_p=double(p+step*dk);
    if f(p(1),p(2))-f(next_p(1),next_p(2))>=-a*step*dk'*grad_at_p
        return;
    end
    step=step*b;
    p=next_p;
end 

%%I checked how many times the function iterates using i. It's not a lot,
%%2-3 times max, if I tweak a,b,s.