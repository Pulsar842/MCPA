% 1D electron simulation
%
close all
clear
clc
set(0,'defaultfigurewindowstyle','docked')

x = 0;

time =0;
Force = 1;
Mass = 1;

np = 1;
dt = 1;
tt = 100;
vx = zeros(1,np);
time = zeros(1,np);
x = zeros(1,np);
Average_Velo= 0;
t = 0;
re = 0;

for i = 2:tt
    for j = 1:np
    time(i,j) = time(i-1,j)+dt; 
    vx(i,j) = vx(i-1,j) + Force/Mass*dt;
    x(i,j) = x(i-1,j) + vx(i-1,j)*dt + (Force/Mass*dt)^2/2;
    
    r = rand(i,j);
    if r(i,j) < 0.05
        vx(i,j) = re * vx(i,j);
    end
    
    Average_Velo(i,j) = mean(vx,'all');
    
    end
    
    
subplot(3,1,1);
plot(time,vx); 
hold on;
subplot(3,1,1); 
plot(time,Average_Velo,'*g');
xlabel('Time');
ylabel('Velocity');
title(['Average Velocity is:',num2str(Average_Velo(i,1))]);
grid on
hold off;


subplot(3,1,2);
plot(x,vx); 
hold on;
subplot(3,1,2); 
plot(x,Average_Velo,'*g');
xlabel('x position');
ylabel('Velocity');
grid on
hold off;


subplot(3,1,3);
plot(time,x);
xlabel('x position');
ylabel('Time');
grid on
pause(0.07);


end
%}



