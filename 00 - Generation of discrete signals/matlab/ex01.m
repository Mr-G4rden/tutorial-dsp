%% TARGET
% Discretize the 3 continuous sine waves and plot their discrete versions
% using a figure window. In this script, you'll generate sine waves whose
% frequency is greater than the Nyquist frequency. 
% The sine waves are:
% * Sine Wave 0: x_0(t)=sin(+2*pi*Fc_0*t);
% * Sine Wave 1: x_1(t)=sin(+2*pi*Fc_1*t);
% * Sine Wave 2: x_2(t)=sin(-2*pi*Fc_2*t); 
% 
% The parameters are:
% * Fc_0 = 0.5 [kHz];
% * Fc_1 = 3.5 [kHz];
% * Fc_2 = 3.5 [kHz];
% * Fs   = 4   [kHz];

%% Clear everything
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

%% Parameters
Fs = 4e3;
Ts = 1/Fs;
Fc_0 =  500;
Fc_1 = 3500;
Fc_2 = 3500;


%% Exercise
len = 100;
n = 0:len-1;
t = n*Ts;

x_0 = sin(+2*pi*Fc_0*n*Ts);
x_1 = sin(+2*pi*Fc_1*n*Ts);
x_2 = sin(-2*pi*Fc_2*n*Ts);


%% Figures

# Scale the time vector to convert seconds to ms
t = t*1e3;

figure
subplot(3,1,1)
    plot(t, x_0)
    grid on
    legend('x0')
    title('Segnale x_0')
    xlabel('Time [ms]')
    ylabel('Amplitude')
subplot(3,1,2)
    plot(t, x_1)
    grid on
    legend('x1')
    title('Segnale x_1')
    xlabel('Time [ms]')
    ylabel('Amplitude')
subplot(3,1,3)
    plot(t, x_2)
    grid on
    legend('x2')
    title('Segnale x_2')
    xlabel('Time [ms]')
    ylabel('Amplitude')
