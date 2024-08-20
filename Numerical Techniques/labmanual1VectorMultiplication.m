clc 
clear all
%Vector and Matrix Multiplication and Process to take input:

%%Vector Multiplication
a=[1 4 5];
b=[2 2 2];
c=a.*b;
%c1=a*b; %error

%%Matrix Multiplication
a1=[1 2
    1 1];
b1=[2
    2];
d1=a1*b1;
d2=a1.*b1;

%%More examples of vector and Matrix Multiplication
x=[1 1
    2 2];
y=[1 1
   1 1];
z=x*y; %Matrix Multiplication
z1=x.*y; %Vector Multiplication


%%Vector Multiplication
t=1:10;
m=t.*t+2;
n = 3*t.^4 + 2*t.^2 + 3;
o=m.*n;


%%taking input 
a=input('a='); 
b(1)=input("b1=");
b(2)=input("b2=");
b(3)=input("b3=");
%input a variable through for loop
for i=1:1:10
    a(i)=input('a(i)=');
end
