clear all
close all
clc

fprintf("signal correlation \n \n");

T=1;
fs=100;
Ts=1/fs;

t=0:Ts:T-Ts;
N=length(t);

%%

A1=2;
f1=1;

s1 = A1 * sin(2 * pi * f1 * t);

%%

s2 = s1;

corr=sum(s1.*s2*Ts);

figure
subplot(2,1,1)
plot(t,s1); hold on;
grid on;
xlabel('t');
ylabel('s_1');
title(sprintf('s_1 = %d sin( 2\\pif_1t)      f_1 = %d',A1,f1))

subplot(2,1,2)
plot(t,s2); hold on;
grid on;
xlabel('t');
ylabel('s_2');
title(sprintf('s_2 = %d sin( 2\\pif_1t)      f_1 = %d             corr = %.3f',A1,f1, corr))

%%

A3=4;
s3 = A3 * cos(2 * pi * f1 * t);

corr=sum(s1.*s3*Ts);

figure
subplot(2,1,1)
plot(t,s1); hold on;
grid on;
xlabel('t');
ylabel('s_1');
title(sprintf('s_1 = %d sin( 2\\pif_1t)      f_1 = %d',A1,f1))

subplot(2,1,2)
plot(t,s3); hold on;
grid on;
xlabel('t');
ylabel('s_3');
title(sprintf('s_3 = %d cos( 2\\pif_1t)      f_1 = %d             corr = %.3f',A3, f1, corr))


%%

figure
plot(t,s1); hold on;
grid on;
xlabel('t');
ylabel('s_1');
title(sprintf('s_1 = %d sin( 2\\pif_1t)      f_1 = %d',A1,f1))

%%

A4=1;

f4=2:0.1:3;

for i=1:length(f4)

s4 = A4 * sin(2 * pi * f4(i) * t );


corr(i)=sum(s1.*s4*Ts);

end

figure
plot(f4,corr,'b-o');
xticks(f4)
xlabel('f_4');
ylabel('corr');
grid on;
title('no random phase')
xlim([2 3])

figure
subplot(2,1,1)
plot(t,s1); hold on;
grid on;
xlabel('t');
ylabel('s_1');
title(sprintf('s_1 = %d sin( 2\\pif_1t)      f_1 = %d',A1,f1))


subplot(2,1,2)
plot(t,s4); hold on;
grid on;
xlabel('t');
ylabel('s_4');
title(sprintf('s_4 = %d sin( 2\\pif_4t)    f_4 = %.1f        corr = %.3f',A4,f4(length(f4)),corr(length(f4))));


%%

A4=1;

f4=2:0.1:3;

for i=1:length(f4)

s4 = A4 * sin(2 * pi * f4(i) * t + 2 * pi * rand);

corr(i)=sum(s1.*s4*Ts);

end

figure
plot(f4,corr,'b-o');
xticks(f4)
xlabel('f_4');
ylabel('corr');
grid on;
title('with random phase')
xlim([2 3])

figure
subplot(2,1,1)
plot(t,s1); hold on;
grid on;
xlabel('t');
ylabel('s_1');
title(sprintf('s_1 = %d sin( 2\\pif_1t)      f_1 = %d',A1,f1))


subplot(2,1,2)
plot(t,s4); hold on;
grid on;
xlabel('t');
ylabel('s_4');
title(sprintf('s_4 = %d sin( 2\\pif_4t)    f_4 = %.1f        corr = %.3f',A4,f4(length(f4)),corr(length(f4))));

%%

for i=1:length(f4)

s4(i,:) = A4 * sin(2 * pi * f4(i) * t);

end

figure
subplot(2,1,1)
plot(t,s4(1,:)); hold on;
grid on;
xlabel('t');
ylabel('s_1');
title(sprintf('s_1 = %d sin( 2\\pif_1t)      f_1 = %d',A4,f1))


subplot(2,1,2)
plot(t,s4(6,:)); hold on;
grid on;
xlabel('t');
ylabel('s_4');
title(sprintf('s_4 = %d sin( 2\\pif_4t)    f_4 = %.1f',A4,f4(6)));

