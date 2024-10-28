clear all
close all
clc

fprintf("noise properties \n \n");

var=2;
N=10000;

noise=randn(1,N)*sqrt(var);

mean_value=mean(noise);

power=mean(noise.^2);

[muHat,sigmaHat] = normfit(noise)

figure
plot(noise);
title(sprintf('random noise, var = %d, N = %d\naverage value = %.4f power = %.4f',var,N,mean_value,power));
ylabel('noise')
xlabel('time')

figure

histogram(noise,'Normalization','probability')
title(sprintf('amplitude normal fit, N = %d\n\\mu = %.4f \\sigma^2 = %.4f',N,muHat,sigmaHat^2));
