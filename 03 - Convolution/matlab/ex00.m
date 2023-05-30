%% TARGET
% Perform the convolution between x[n] and h[n].
% Use 'fvtool' and 'plot' to see the results.
% * x[n] = cos(2*pi*Fc0*n*Ts) + cos(2*pi*Fc1*n*Ts); 
% * h[n] = load('ex00_data.mat')
%
% The parameters are:
% * Fc0  =  31.25 [Hz]
% * Fc1  = 312.50 [Hz];
% * Fs   =   1    [kHz];
%
% *Suggestions*
% 1) The convolution function is shown as follows:
%    y[n] = conv(x,h);

%% Clear everything
clc;        % 'clc' cleras all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
Fc0 = 31.25;
Fc1 = 312.5;
Fs  = 1e3;
Ts  = 1/Fs;

len = 2^12;
n = 0:(len-1);

% x signal
x = cos(2*pi*Fc0*n*Ts) + cos(2*pi*Fc1*n*Ts); 

% Load h
load('ex00_data.mat');

% Convolution
y = conv(x,h);

nh = 0:(length(h)-1);
ny = 0:(length(y)-1);

fvtool(x,1,'Fs',1000);

%% Figures
figure;
subplot(3,1,1)
    plot(n,x)
    legend('x')
    grid on
    xlabel('Samples')
    ylabel('Amplitude')
subplot(3,1,2)
    plot(nh,h)
    legend('h')
    grid on
    xlabel('Samples')
    ylabel('Amplitude')
subplot(3,1,3)
    plot(ny,y)
    legend('y')
    grid on
    xlabel('Samples')
    ylabel('Amplitude')





 
