%% Target
%
% Design a decimator and use it to filter a signal.
% 
% The parameters are:
%
% * x[n] = cos(2*pi*Fc*n*Ts) + w[n];
% * w[n] is the noise
% * Fc = 62.5 [kHz]
% * Fs =  1   [MHz]
% * M  =  4   % Decimator Factor
% 
% *Suggestions*
% 
% FIR coefficients
%   fir_ord = 64;
%   [fir_num] = fir1(fir_ord, Wn, hann(fir_ord+1));
% 
% Filtering
%   y = filter(num,den,x);
%     * x   - input signal
%     * y   - output signal
%     * num - numerator   coefficients
%     * den - denominator coefficients
%
% Downsampling
%   xd = downsample(x, M);
% 

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

%% Matlab Exercise
Fc = 62.5e3;
Fs = 1e6;
Ts = 1/Fs;
len = 2^12;
M = 4;
n = 0:len-1;

% Signal
w = 0.01*randn(1,len);
x = cos(2*pi*Fc*n*Ts) + w;

% Filter
fir_ord = 64;
F_cut = (Fs/2)/M;
Wn = F_cut / (Fs/2);
fir_num = fir1(fir_ord, Wn, hann(fir_ord+1));

% Filtering
xd = filter(fir_num, 1, x);
nd = 0:length(xd)-1;

% Interpolation
y = downsample(xd,M);
ny = 0:length(y)-1;

% Time vectors
tx  = n*Ts  / 1e6;
txd = nd*Ts / 1e6;
ty  = ny*(Ts*M) / 1e6;

%% Plot
% Using 'freqz'
nFFT = 2^12; % Number of points of the fft
Hf_fir  = freqz(fir_num, 1, nFFT);
Xf      = freqz(x, 1, nFFT);
Xf_d    = freqz(xd, 1, nFFT);
[Yf, w] = freqz(y, 1, nFFT);

% Frequency normalization
w = w/pi * (Fs/2)/1e6;
w_d = w/M;

% Mag to dB
Hf_fir = mag2db(abs(Hf_fir));
Xf     = mag2db(abs(Xf)/nFFT);
Xf_d   = mag2db(abs(Xf_d)/nFFT);
Yf     = mag2db(abs(Yf)/nFFT);

figure
subplot(3,1,1)
  hold on
  plot(w, Hf_fir)
  hold off
  grid on
  legend('H_{FIR}')
  xlabel('Frequency [MHz]')
  ylabel('Amplitude [dB]')
subplot(3,1,2)
  hold on
  plot(w,   Xf,   's-')
  plot(w,   Xf_d, '.-')
  plot(w_d, Yf,   'x-')
  hold off
  grid on
  legend('x','x_u','y')
  xlabel('Frequency [MHz]')
  ylabel('Amplitude [dB]')
subplot(3,1,3)
  hold on
  plot(tx ,  x, 's-')
  plot(txd, xd, '.-')
  plot(ty ,  y, 'x-')
  hold off
  grid on
  legend('x','x_u','y')
  xlabel('Time \mus')
  ylabel('Amplitude')

% Using 'fvtool'
hfvt0 = fvtool(x,  1, 'Fs',Fs);
legend(hfvt0, 'x')
hfvt1 = fvtool(xd, 1, fir_num, 1, 'Fs',Fs);
legend(hfvt1, 'x_d', 'FIR')
hfvt2 = fvtool(y,  1, 'Fs',Fs/M);
legend(hfvt2, 'y')
