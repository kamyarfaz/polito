clear all
close all
clc

disp('convolution of two rectangular pulses');

%% define the pulses

A1 = 2;
T1 = 1;
D1 = 1;

A2 = 1;
T2 = 2;
D2 = 0;

%%

fs=100;
Ts=1/fs;

Tmax=10;

t=0:Ts:Tmax-Ts;
N=length(t);

%%

x1=zeros(1,N);
zz1=find((t>=D1)&(t<D1+T1));
x1(zz1)=A1;



x2=zeros(1,N);
zz2=find((t>=D2)&(t<D2+T2));
x2(zz2)=A2;

x3=conv(x1,x2)*Ts;    %convolution with proper normalization
x3=x3(1:N);           %select the first N samples so all the vectors have the same length

%%

figure

subplot(3,1,1)

plot(t, x1,'linewidth',2);
            grid on;
xlabel('t');
ylabel('x_1');

ylim([0 3]);
xlim([0 10]);
yticks(0:3);



subplot(3,1,2)
 
plot(t, x2,'linewidth',2);
            grid on;
xlabel('t');
ylabel('x_2');

ylim([0 3]);
xlim([0 10]);
yticks(0:3);


subplot(3,1,3)

plot(t, x3,'linewidth',2);
            grid on;
xlabel('t');
ylabel('x_3');

ylim([0 3]);
xlim([0 10]);
yticks(0:3);


