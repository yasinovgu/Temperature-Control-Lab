close all; clear all; clc;
load('step_data')
temp1=step_data(:,4);
time=step_data(:,1);
heat1=step_data(:,2);
%% 

figure(4)
gcf = tiledlayout(1,1);
nexttile
plot(time,temp1,time,heat1)
xlabel('Time [s]')
ylabel('Temperature [°C]')
legend({'Sensor 1','Heater 1'},'Location','southwest','Orientation','vertical')
%exportgraphics(gcf,'step.eps')