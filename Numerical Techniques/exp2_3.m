clc
clear all
t=1:10;
x1=t.*sin(t);
x2=(t-1)/(t+1);
x3=sin(t.^2)./(t.^2);
plot(t,x1)
plot(t,x2)
plot(t,x3)