function [B1,A1]=fourierplot(t1,t2,N)
    function y=f(t)
       // if   (t<0) y =-1;
        //else       y =+1;
        //end
     
      y=t/2;
    endfunction
    
    function y1=fcos(t)
        y1=f(t)*cos(n*wo*t);
    endfunction    
    
    function y2=fsin(t)
        y2=f(t)*sin(n*wo*t);
    endfunction 
    
    function sintese=g(t)
        sintese=A0;
        for n=1:N
           sintese=sintese+A(n)*cos(n*wo*t)+B(n)*sin(n*wo*t);
        end
    endfunction

    clf();
    T=(t2-t1)
    wo = 2*%pi/T
    A0=1/T*intg(t1,t2,f,.000000001);
    for n=1:N
       A(n)=2/T*intg(t1,t2,fcos,.000000001);
       B(n)=2/T*intg(t1,t2,fsin,.000000001);
    end
    clean(A);
    clean(B);
    subplot(4,1,1)
    t=linspace(t1,t2,100)
    for(n=1:length(t))
       ft(n)=f(t(n))
    end
    plot2d3(t,ft);
    tp=t1:0.001:t2
    plot(tp,g(tp),'r')
    t=t1-2*T:0.001:t2+2*T;
    subplot(4,1,2)
    plot(t,g(t),'bk');
    plot(tp,g(tp),'r')
    subplot(4,1,3)
    A1=[A0; A];
    clean(A1)
    bar([0:N],A1,0.1)
    subplot(4,1,4)
    B1=[0; B]
    clean(B1)
    bar([0:1:N],B1,0.1)
endfunction
