%  program on 
%  starting date

clear all
close all
clc


disp('sinusoidal components');

%% sampling, time and frequency axis

fs=1000;  % sampling frequency
Ts=1/fs;  % sampling time

Tmax=10;  % total snaphsot time
 
t=0:Ts:Tmax-Ts;   %time axis
N=length(t);      %total number of samples

fres=fs/N;          % resolution frequency
f=0:fres:fs-fres;     % frequency axis
ff=f-fs/2;        % symmetric frequency axis (fundamental interval)

%%  first two sinusoidal signals

f1=1;
f2=2*f1;

s1=cos(2*pi*f1*t+2*pi*rand);  % sinusoidal signal with frequency f1 and random phase
s2=cos(2*pi*f2*t+2*pi*rand);  % sinusoidal signal with frequency f2 and random phase

%%

fig1=figure;   % first figure

plot(t,s1); hold on;    % plot s1
ylim([-2 2])            % dimension y axis 
xlim([0 1])             % dimension x axis
grid on                 % grid
title('component 1')    % title

waitforbuttonpress      % stop until any key is pressed

plot(t,s2); hold on;    % plot s2
title('components 1 and 2') %new title 

waitforbuttonpress

plot(t,s1+s2,'linewidth',2); hold on; % plot s1+s2, with different width

title('component 1+component 2')    % new title 

waitforbuttonpress 

%%  s contains vectors with increasing frequency
%   z contains sum of vectors with increasing frequency

s(1,:)=s1;    % how to assign a vector
%z(1,:)=s1;


%%
% in this section generate 100 sinusoidal signals with increasing frequency
% and store them into matrix s
% and the sum of the first 1,2,3,...,100 signals
% and store them into matrix z


for i=1:100
   s(i,:)=cos(2*pi*i*t+2*pi*rand);
end



z=cumsum(s,1);





%%

fig2=figure;   %figure made by 4 (2x2) subplots

subplot(2,2,1)  % 2x2 figure
plot(t,z(1,:)); hold on;
xlim([0 1])
grid on
title('1 component')
   
subplot(2,2,2)
plot(t,z(5,:)); hold on;
xlim([0 1])
grid on
title('5 components')
    
subplot(2,2,3)
plot(t,z(10,:)); hold on;
xlim([0 1])
grid on
title('10 components')

subplot(2,2,4)
plot(t,z(100,:)); hold on;
xlim([0 1])
grid on
title('100 components')
    
waitforbuttonpress 

%%  FFT analysis
  
y=z(100,:);         % take the sum of the 100 sinusoidal signals 
Y=fft(y)*Ts;        % compute the fft using proper normalization
YY=fftshift(Y);     % shift into a symmetric plot

%%  plot fft

fig3=figure;

plot(ff,abs(YY),'b-')  %with symmetric axis
grid on
xlim([-500 500])
xticks(-500:100:500)  %choose ticks
xlabel('frequency')
ylabel('|S(f)|')

waitforbuttonpress 





%% alternative for creating s


fr = 1:100;                 % frequencies
arg=2*pi*fr'*t;             % sin argument without random phase (100x10000)

z=2*pi*rand(length(fr),1);  % random phases (100x1)
zz=repmat(z,1,length(t));   % (100x10000)

arg=arg+zz;                 % sin argument with random phase (100x10000)

s = sin(arg);               % signal  s (100x10000)

figure
plot(t,s(1,:)); hold on
plot(t,s(2,:)); 
plot(t,s(3,:)); 
xlim([0 1])


%% alternative for  creating s: meshgrid

t=0:Ts:Tmax-Ts;     %time axis
fr=1:100;           %frequencies

[T,FR] = meshgrid(t,fr);    % create a grid of pairs (t horizontal, fr vertical)
s = sin(2*pi*T.*FR);        % compute sin over the grid 


figure
plot(t,s(1,:)); hold on
plot(t,s(2,:)); 
plot(t,s(3,:)); 
xlim([0 1])