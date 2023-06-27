%% Section 1: One chirp, one sine wave
% In this first section, I'll show you the spectrogram of a linear chirp
% and a sine wave

% Clear
clc; clear; close all; 

% Parameters
Fs = 1e6;
Ts = 1/Fs;
Fc = Fs/32;
len = 1024;
n = 0:(len-1); 

% Waves
x1 = sin(2*pi*Fc*n(1:128)*Ts);
x2 = chirp((n*Ts), 0, (750*Ts), Fs/4);

% Spectrogram
figure;
spectrogram(sin(2*pi*Fc*n*Ts),64,63,64,Fs,'yaxis')
title('Sine wave')

figure;
spectrogram(x2,64,63,64,Fs,'yaxis')
title('Linear Chirp')

% Plot
figure;
subplot(2,1,1)
hold on
plot(n(1:length(x1)),x1,'.-');  
grid on; grid minor;
xlabel('Time [n\timesT_s]')
ylabel('Amplitude')
title('Sine Wave')

subplot(2,1,2)
plot(n,x2,'.-'); 
grid on; grid minor;
xlabel('Time [n\timesT_s]')
ylabel('Amplitude')
title('Chirp Wave')


%% Section 2: Autocorrelation
% In this second section, I'll show you the autocorrelation of a linear
% chirp and a sine wave.

% Close the previous figures
close all;

% Autocorrelation
[r_xy_1,lag_1] = xcorr(x1,x1(1:32));
[r_xy_2,lag_2] = xcorr(x2,x2);

% Plot
figure;
subplot(2,2,1)
plot(n(1:length(x1)),x1,'.-');  
grid on; grid minor;
xlabel('Time [n\timesT_s]')
ylabel('Amplitude')
title('Sine Wave')

subplot(2,2,3)
plot(n,x2,'.-'); 
grid on; grid minor;
xlabel('Time [n\timesT_s]')
ylabel('Amplitude')
title('Chirp Wave')

subplot(2,2,2)
plot(lag_1,r_xy_1)
grid on; 
grid minor;
xlabel('# Samples')
ylabel('Amplitude')
title('Sine - Autocorrelation')

subplot(2,2,4)
plot(lag_2,r_xy_2)
grid on; 
grid minor;
xlabel('# Samples')
ylabel('Amplitude')
title('Chirp - Autoccorrelation')


