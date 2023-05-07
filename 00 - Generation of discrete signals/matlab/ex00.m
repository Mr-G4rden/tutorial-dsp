%% TARGET
% Discretize the two continuous sine waves and plot their discrete versions
% using a figure window. The sine waves are:
% * Sine Wave 0: x_0(t)=sin(2*pi*Fc_0*t);
% * Sine Wave 1: x_1(t)=sin(2*pi*Fc_1*t);
% 
% The parameters are:
% * Fc_0 = 100 [Hz];
% * Fc_1 = 800 [Hz];
% * Fs   = 16 [kHz];

%% Clear everything
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

%% Parameters
Fs = 16e3;      % Sampling Frequency
Ts = 1/Fs;      % Sampling Period
Fc_0 = 100;     % Frequency of the 1st sine wave
Fc_1 = 800;     % Frequency of the 2nd sine wave

%% Exercise
len = 256;      % Number of the samples
n = 0:len-1;    % Index vector of the samples
t = n*Ts;

% You can generate the index vector using the linspace function
% n = linspace(0, len-1, len);

% Sine wave x0. It is generated using the time vector 't'
x_0 = sin(2*pi*Fc_0*t);

% Sine wave x1. It is generated using the index vector 'n'
FcN_1 = Fc_1/Fs;
x_1 = sin(2*pi*FcN_1*n);

%% Figures

% Scale the time vector to convert seconds to ms
t = t*1e3;

figure
subplot(2,1,1)
    plot(t, x_0)
    grid on
    legend('x0')
    title('Segnale x_0')
    xlabel('Time [ms]')
    ylabel('Amplitude')
subplot(2,1,2)
    plot(n, x_1)
    grid on
    legend('x1')
    title('Segnale x_1')
    xlabel('Samples')
    ylabel('Amplitude')
