clc
clear

x1(1)=0;
x2(1)=0;
x3(1)=0;


    for j=2:1000
        x1(j)=(7-((2*x2(j-1))+(3*x3(j-1))))/9;
        x2(j)=(2-((1*x1(j))+(9*x3(j-1))))/12;
        x3(j)=(1-((4*x1(j))+(6*x2(j))))/14;

if ( (x1(j-1)==x1(j)) && (x2(j-1)==x2(j)) &&  (x3(j-1)==x3(j)) )
    break;
end

    end

    disp(x1)
    disp(x2)
    disp(x3)
