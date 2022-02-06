close all; clear all; clc;



num=35.826853375845040;
den=[3.442221704734637e+03,1.774027657631948e+02 ,1];
num1=0.625;
den1=[3251.75,162.96 ,1];


sysp = tf(num1,den1);
s=tf('s');

T=1/2.8886e-04;     %9.0201e-04
G=(sysp*(1+T*s))/s;


GAIN=gaincalc(G,70);

GPI=(GAIN/s)+GAIN*T;
GPI
figure(1)
bode(sysp)
grid on
hold on
bode(sysp*GPI)
hold on
bode(GPI)
legend({'G','Total','PI'},'Location','southwest','Orientation','vertical')

figure(2)
margin(sysp*GPI)

PISys=sysp*GPI;
figure(3)
step((PISys)/(PISys+1))
stepinfo(((PISys)/(PISys+1)),'SettlingTimeThreshold',0.05)
