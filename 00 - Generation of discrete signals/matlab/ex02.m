%% TARGET
% Discretize the 2 continuous sine waves and plot their discrete versions
% using a figure window. In this script, you can analyze the downsampling
% effects. The sine waves are:
% * Sine Wave 0: x_0(t)=sin(2*pi*Fc_0*t + phi_0);
% * Sine Wave 1: x_1(t)=sin(2*pi*Fc_1*t + phi_1);
% 
% The parameters are:
% * Fc_0  = 0.5 [kHz];
% * Fc_1  = 8.5 [kHz];
% * phi_0 = pi/4;
% * phi_1 = pi/4;
% * Fs    = 4   [kHz];

%% Clear everything
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

%% Parameters
Fs    = 4e3;
Ts    = 1/Fs;
Fc_0  =  500;
Fc_1  = 8500;
phi_0 = pi/4;
phi_1 = pi/4;

%% Exercise
len = 100;
n = 0:len-1;

x_0 = sin(+2*pi*Fc_0*n*Ts);
x_1 = sin(+2*pi*Fc_1*n*Ts);


%% Figures
figure
subplot(2,1,1)
    plot(n*Ts, x_0, 's-')
    grid on
    legend('x0')
    title('Segnale x_0')
    xlabel('Time [nT_s]')
    ylabel('Amplitude')
subplot(2,1,2)
    plot(n*Ts, x_1)
    grid on
    legend('x1')
    title('Segnale x_1')
    xlabel('Time [nT_s]')
    ylabel('Amplitude')
