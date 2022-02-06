close all; clear all; clc;

num1=0.5743;
den1=[3144.254,169.5508 ,1];

% sys = tf(num,den);
% sys4=tf(num*gaincalc(sys,45),den);
%
% figure(1)
% margin(sys);
%  hold on
% margin(sys4);



sysp = tf(num1,den1);
sys3p=tf(num1*gaincalc(sysp,30),den1);
sys7p=tf(num1*gaincalc(sysp,70),den1);

figure(2)

[Gmp,Pmp,Wcgp,Wcpp]=margin(sysp);
margin(sysp)
grid on
hold on
[Gm3p,Pm3p,Wcg3p,Wcp3p]=margin(sys3p);
margin(sys3p)
hold on
[Gm7p,Pm7p,Wcg7p,Wcp7p]=margin(sys7p);
margin(sys7p)
% h=legend({sprintf('Kp=%.0f',1),sprintf('Kp=%.2f Pm %.1f deg (at %.4f rad/s)',gaincalc(sysp,30),Pm3p,Wcp3p),sprintf('Kp=%.2f Pm %.1f deg (at %.4f rad/s)',gaincalc(sysp,70),Pm7p,Wcp7p)},'Location','best','Orientation','vertical');
% set(h,'FontSize',6);

title('Bode Diagram')
% exportgraphics(figure(2),'gain.eps')
hold off


figure(10)
 line([Wcp3p, Wcp3p ],[(-140),1],'Color','black','LineStyle','--')
 hold on
  line([Wcp7p, Wcp7p ],[(-140),1],'Color','black','LineStyle','--')
hold on
bode(sysp,sys3p,sys7p);
hold on
grid on

[hleg, hico] =legend({sprintf('Kp=%.0f',1),sprintf('Kp=%.2f Pm %.1f deg (at %.4f rad/s)',gaincalc(sysp,30),Pm3p,Wcp3p),sprintf('Kp=%.2f Pm %.1f deg (at %.4f rad/s)',gaincalc(sysp,70),Pm7p,Wcp7p)},'Location','best','Orientation','vertical');

xline(Wcp3p,'Color','black','LineStyle','--')
line([Wcp3p, Wcp3p ],[(-180),(-180+Pm3p)],'Color','black','LineStyle','-')

xline(Wcp7p,'Color','black','LineStyle','--')
line([Wcp7p, Wcp7p ],[(-180),(-180+Pm7p)],'Color','black','LineStyle','-')

line([0.9e-04, Wcp3p ],[(-180+Pm3p),(-180+Pm3p)],'Color','black','LineStyle','--')
line([0.9e-04, Wcp7p ],[(-180+Pm7p),(-180+Pm7p)],'Color','black','LineStyle','--')

text(1e-03,(-172+Pm3p),'-150 deg')
text(1e-03,(-172+Pm7p),'-110 deg')

plot(Wcp3p,(-180+Pm3p),'Color','red','Marker','o','LineWidth',1.5)
plot(Wcp7p,(-180+Pm7p),'Color','red','Marker','o','LineWidth',1.5)
istxt = strcmp(get(hico, 'type'), 'text');
hicot = hico(istxt);
hicol = hico(~istxt);
delete(hicot(ismember(get(hicot, 'String'), {'data1'})));
delete(hicol(ismember(get(hicol, 'Tag'),    {'data1'})));


%exportgraphics(figure(2),'disturb.eps')


% SimPrint;
% handle=get_param('SimPrint','handle');
% print(handle,'-dsvg','MyModel');
% winopen MyModel.svg;


PISys=sys7p;
figure
step((PISys)/(PISys+1))
stepinfo(((PISys)/(PISys+1)),'SettlingTimeThreshold',0.05)
