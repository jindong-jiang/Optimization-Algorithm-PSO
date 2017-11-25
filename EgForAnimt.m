th=0:pi/60:32*pi;
a=1;
A=0.25;
w=2*pi/15;
for t=1:16
    x=a*cos(th);
    y=a*sin(th);
    z=(1+A*cos(w*(t-1)))*th;
    plot3(x,y,z,'r');
    axis([-2 2 -2 2 0 40*pi]);
    M(t)=getframe;
end
movie(M,150)