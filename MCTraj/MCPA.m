% 1D electron simulation
%
close all
clear
clc
set(0,'defaultfigurewindowstyle','docked')

x = 0;                  % Intial X position

time =0;                % Intial Time
Force = 1;              % Force of 1
Mass = 1;               % Mass of 1

np = 1;                 % Number of Particles (Can be changed for more particles)
dt = 1;                 % Time steps
tt = 100;               % Total time
vx = zeros(1,np);       % X velocity (each column is for the additional particle)
time = zeros(1,np);     % time
x = zeros(1,np);        % x position 
Average_Velo= 0;        % Average velocity

re = 0;                 % Scattering rule

for i = 2:tt                                                    % Time
    for j = 1:np                                                % For additional particles added based on np value
    time(i,j) = time(i-1,j)+dt;                                 % Update Time
    vx(i,j) = vx(i-1,j) + Force/Mass*dt;                        % Update velocity
    x(i,j) = x(i-1,j) + vx(i-1,j)*dt + (Force/Mass*dt)^2/2;     % Update X
    
    r = rand(i,j);                          % Rand number
    if r(i,j) < 0.05                        % If rand number is less than 0.05
        vx(i,j) = re * vx(i,j);             % Update velocity to scattering rule 
    end
    
    Average_Velo(i,j) = mean(vx,'all');     % Finding average velocity for each particle
    
    end
    
    
subplot(3,1,1);                 
plot(time,vx);                  % Plotting Time vs Velocity 
hold on;
subplot(3,1,1); 
plot(time,Average_Velo,'*g');   % Plotting average velocity
xlabel('Time');
ylabel('Velocity');
title(['Average Velocity is:',num2str(Average_Velo(i,1))]);
grid on
hold off;


subplot(3,1,2);                           
plot(x,vx);                     % Plotting X vs velocity
hold on;
subplot(3,1,2); 
plot(x,Average_Velo,'*g');      % Plotting X vs Average velocity
xlabel('x position');
ylabel('Velocity');
grid on
hold off;


subplot(3,1,3);
plot(time,x);                   % X with time
xlabel('x position');
ylabel('Time');
grid on
pause(0.07);


end
%}



