clc
clear all
Eg0GaAs=1.19;
Eg0Si=1.70;
Eg0Ge=0.74;
alphaGaAs=5.40;
alphaSi=4.73;
alphaGe=5.40;
betaGaAs=204;
betaSi=204;
betaGe=204;
for t=1:100
   Eg_t=Eg0GaAs-((alphaGaAs*(t^2))/(betaGaAs+t));
end
plot(t,Eg_t)

