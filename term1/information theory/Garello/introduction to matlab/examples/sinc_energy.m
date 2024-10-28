clear all
close all
clc

disp('FFT and energy of a rectangular pulse');

%%

A=2;            % pulse amplitude
T = 1;          % pulse duration
Tmax = 10*T;    % total snapshot time

fs=1000*1/T;    % sampling frequency
Ts=1/fs;        % sampling time
  
t=0:Ts:Tmax-Ts; % time axis 
N = length(t);  % total number of samples

fres=fs/N;              % frequency resolution
f=0:fres:fs-fres;       % frequency axis
ff=f-fs/2;              % symmetric frequency axis (fundamental interval)

NT=T/Ts;        %number of samples of the pulse

s=zeros(1,N);
s(1:NT)=A;      % rectangular pulse with amplitude A and duration T
   
%alternative
%s=A*rectangularPulse(0,T,t);




% energy
en_true=A^2*T;   % formula here
 
en_time=sum(s.*s)*Ts;   % compute it on the time axis
en_time=sum(s.^2)*Ts;   % compute it on the time axis


S = fft(s)*Ts;         % FFT of s
M = abs(S);         % magnitude of S
MM = fftshift(M);        % symmetric


en_freq = sum(M.^2)*fres;  % compute it on the frequency axis by using Parseval identity


%%  
figure;
      
subplot(2,1,1)

plot(t,s,'k-','linewidth',2);
xlabel('time');
title(sprintf('rectangular pulse A = %d T = %d\nen_{true} = %d   en_{time} = %.3f',A,T,en_true,en_time));
                % title with variable values inside

                
subplot(2,1,2)

plot(ff,MM,'r'); hold on;
xlabel('frequency');
xlim([-20 20])
xticks(-fs/2:fs/2)
title(sprintf('rectangular pulse A = %d T = %d\nen_{true}=%d   en_{frequency} = %.3f',A,T,en_true,en_freq));



