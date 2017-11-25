M=30;%paticles numbers
%N=5;%total time %not used anymore
%D=2;%Function dimension
%BH=heartBird();
pgVal=1000;
pg=rand(D,1);
ipsilon=1;
t=1;% the t helps to make the MM frame
for i=1:M
    ptcl(i)=paticle(D);
end
while(ipsilon>0.001)
    for i=1:M
        ptcl(i).update(pg);
        ptcl(i).updtpi(func);
        x(i)=ptcl(i).Xposition(1);
        y(i)=ptcl(i).Xposition(2);
        plot(x,y,'*',pg(1),pg(2),'r*')
        %hold on 
        %plot(pg(1),pg(2),'r*')
        axis([-5 5 -5 5]);
        MM(t+i-1)=getframe;
    end
    t=t+1;% 
    
end
 movie(MM,1);