clc
clear all
max=9;
sum=0;
for i=1:max
    sum=sum+(i^2);
end
fprintf('Sum=%d\n',sum)

m=[1 2 2
   4 6 6
   3 8 5];
n=inv(m);
a=m*n %by using inv() function
b=m\m %by using back slash method

t=input("Input t: ");
e=[3 4 5
   4 7 3
   5 6 t];
d=[49
   51
   61];
c=e\d; %This means inverse of (a)*b
x=c(1,1)
y=c(2,1)
z=c(3,1)