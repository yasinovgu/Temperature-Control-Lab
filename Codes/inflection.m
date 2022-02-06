%% Loading of variavles
close all; clear all; clc;

num1=0.5743;
den1=[3144.254,169.5508 ,1];
syms s
Gs=(num1/(3144.254*(s^2)+169.5508*s +1) );
Step=Gs/s;

steptime=ilaplace(Step,s);
steptimeder=diff(steptime);
steptimeder2=diff(steptimeder);


figure(1)
fplot(steptime,[0,1000])
xlabel('Time [s]','FontSize',17)
ylabel('Amplitude','FontSize',17)
title('Inflectional Tangent','FontSize',17)
syms t
 tangent=0.05274188+((t-39.4252)*(1.78453*(10^(-3))));
hold on
fplot(tangent,[9.87,216])
xline(9.87,'Color','black','LineStyle','--')
xline(213,'Color','black','LineStyle','--')
yline(0.3625,'Color','black','LineStyle','--')
hold on
plot(39.4252,0.05274188,'Color','red','Marker','o','LineWidth',1.5)
% exportgraphics(figure(1),'traj1.eps')
text(0,0.018,'Tu','FontSize',12)
text(0,0.015,'<->')
text(90,0.018,'Ta','FontSize',12)
text(14,0.015,'<----------------------------------------------------->')



xlabel('FontSize',17)
ylabel('FontSize',17)

