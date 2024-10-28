% Riccardo Tuninato
% This file contais some info on useful Matlab commands and features

%% initial commands
clc         % clear Command Window
clear       % clear variables in Workspace
close all   % close all open figures

disp("Examples of Matlab commands")

help length  % Get info about a command

%% arrays
a = [0 0.5 1 1.5 2]    
a = 0:0.5:2
a = linspace(0,2,5)
a'  % transpose

%%

b = zeros(1,5)  %all zeros
c = ones(1,5)   %all ones
d = rand(1,5)   %real numbers randomly extracted from 0 to 1
u = randi(10, 1, 5) %integer numbers uniformly distributed from 1 to 10
n = randn(1, 1) %1 normal distributed random sample, with mean 0 and var 1


x=size(a)       %vector [number_of_rows   number_of_columns]

%% functions defined over arrays
t=0:1:10;

s=sin(2*pi*t);
y=t.^2
z=rectangularPulse(0,1,t);   % 0 for t<0 and t>1, 1/2 for t=0 and t=1, 1 for 0 < t < 1

%% Arrays and matrices operations

% element-wise product:
% We can multiply (or divide) element by element two arrays with same
% length with *.
x1 = [1:10]
x2 = [2:11]
xf = x1.*x2

% Row-column product:
% When we use the operator * between two arrays, it will compute the
% row-column product, but only if the size of the arrays are suitable
x1 = [1:10] % 1 x N vector
x2 = [2:11] % 1 x N vector

%xf = x1*x2  it is wrong!

xf = x1*x2'
% [1 x 1] = [1 x N] x [N x 1]
% element-wise product, then sum of all the results
% or
xf = x1'*x2     
% [N x N] = [N x 1] x [1 x N]
% corresponds to the cartesian product

% The same concept can be applied to matrices:
% the number of columns of the first matrix must be equal to the
% number of rows of the second matrix
X1 = [magic(3); magic(3)]
X2 = [magic(3) magic(3)]

Xf = X1*X2
%[6 x 6] = [6 x 3] x [3 x 6]
% or
Xf = X1'*X2'
%[3 x 3] = [3 x 6] x [6 x 3]

%% plot

figure
%subplot(2,1,1)
plot(t,y);hold on;
plot(t,z,'r','linewidth',2);
grid on;
xlabel('time');
ylabel('signal amplitude');
title('title');
legend('y','z');
ylim([-8 8]);
xlim([0 2]);
xticks(0:0.5:2)

%% More advanced plots
lines ={'-', '--', '-.', ':'};
colors = {[0 0 1], [1 0 0], [0 1 0], [0 0 0], [0.75 0 0.75], [0 1 1], ...
    [0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560]};
markers = {'o', 's', '^', 'x', '+', '*','d','p','h','>'};
value = 10;

f = figure;
f.Position = [20 20 1280 960];
plot(t,y,'LineStyle', lines{4},'Marker', markers{1},'color',colors{8},'Linewidth',2,'MarkerSize',10)
hold on
plot(t,y./2,'LineStyle', lines{3},'Marker', markers{2},'color',colors{10},'Linewidth',2,'MarkerSize',10)
hold off
set(gca,'FontSize',16)
title("Example of title with variable: "+value,'Fontsize',20);
legend("Trial","Trial 2", 'Location','southeast','Fontsize',15) % southeast northeast northwest southwest best
xlabel('time','Fontsize',20)
ylabel('signal amplitude','Fontsize',20)
grid on

%% input from keyboard
question='frequency value?...';
fr=input(question);

%% audio recording and playing
myVoice = audiorecorder(fs,24,1);   % sampling frequency, number of quantization bits, number of channels
disp('Say my name...');
recordblocking(myVoice, 3);       % variable name, number of seconds
disp('End of recording. Playing back ...');
%play(myVoice);
y=getaudiodata(myVoice);
%y=audioread('elisa.aac');     
sound(y,fs);


%%  find the elements of a vector satisfying some constraint
fsam=1e-3;
fmax=10;
fr=0:fsam:fmax-fsam;

YY=fr;

Z=1;   

q=find(fr<Z);   % indexes to consider
YY2=YY(q);

%% numbers and greek letters into a string
A=1; T=1; alfa=0.5;
tit=sprintf('raised cosine pulse A=%1d T=%1d \\alpha=%.2f',A,T,alfa);
title(tit);


%% Save and load data

temp = magic(3)

filename = "Example";
save(filename, "temp")

clear temp

load(filename)
disp(temp)

%% Function definition
% Commonly functions are written in a different file
% With same name as the name of the function

a = 10
b = 20
c = sum(a, b)

function [c] = sum(a, b)

c = a+b;

end



