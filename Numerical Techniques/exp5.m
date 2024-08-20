clc
clear all
A = [4 8 4 0;
     1 5 4 -3;
     1 4 7 2;
     1 3 0 -2];
B = [8;
    -4;
    10;
    -4];
X = pinv(A) * B
