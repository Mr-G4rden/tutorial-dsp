%% Target
%
% Design an interpolator and use it to filter a signal.
% 
% The parameters are:
%
% * x[n] = cos(2*pi*Fc*n*Ts) + w[n];
% * w[n] is the noise
% * Fc = 125 [kHz]
% * Fs =   1 [MHz]
% * L  =   4  % Interpolator Factor
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
% Upsampling
%   xu = upsample(x, L);
% 

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

%% Matlab Exercise
Fc = 125e3;
Fs = 1e6;
Ts = 1/Fs;
len = 2^12;
L = 4;
n = 0:len-1;

% Signal
w = 0.01*randn(1,len);
x = cos(2*pi*Fc*n*Ts) + w;

% Filter
fir_ord = 64;
F_cut = 500e3;
Wn = F_cut / (Fs*L/2);
fir_num = fir1(fir_ord, Wn, hann(fir_ord+1));

% Upsampler
xu = upsample(x,L);
nu = 0:length(xu)-1;

% Interpolation
y = L*filter(fir_num, 1, xu);

% Remove the filter latency
y(1:fir_ord/2) = [];          
y(end-fir_ord/2:end) = [];

% Time vectors
ny = 0:length(y)-1;
tx  = n*Ts / 1e6;
txu = nu*(Ts/L) / 1e6;
ty  = ny*(Ts/L) / 1e6;

%% Plot
% Using 'freqz'
nFFT = 2^12; % Number of points of the fft
Hf_fir  = freqz(fir_num, 1, nFFT);
Xf      = freqz(x, 1, nFFT);
Xf_u    = freqz(xu, 1, nFFT);
[Yf, w] = freqz(y, 1, nFFT);

% Frequency normalization
w = w/pi * (Fs/2)/1e6;
w_u = w*L;

% Mag to dB
Hf_fir = mag2db(abs(Hf_fir));
Xf     = mag2db(abs(Xf)/nFFT);
Xf_u   = mag2db(abs(Xf_u)/nFFT);
Yf     = mag2db(abs(Yf)/nFFT);

figure
subplot(3,1,1)
  hold on
  plot(w_u, Hf_fir)
  hold off
  grid on
  legend('H_{FIR}')
  xlabel('Frequency [MHz]')
  ylabel('Amplitude [dB]')
subplot(3,1,2)
  hold on
  plot(w,   Xf,   's-')
  plot(w_u, Xf_u, '.-')
  plot(w_u, Yf,   'x-')
  hold off
  grid on
  legend('x','x_u','y')
  xlabel('Frequency [MHz]')
  ylabel('Amplitude [dB]')
subplot(3,1,3)
  hold on
  plot(tx ,  x, 's-')
  plot(txu, xu, '.-')
  plot(ty ,  y, 'x-')
  hold off
  grid on
  legend('x','x_u','y')
  xlabel('Time \mus')
  ylabel('Amplitude')

% Using 'fvtool'
hfvt0 = fvtool(x,  1, 'Fs',Fs);
legend(hfvt0, 'x')
hfvt1 = fvtool(xu, 1, 'Fs',Fs*L);
legend(hfvt1, 'x_u')
hfvt2 = fvtool(y,  1, fir_num, 1, 'Fs',Fs*L);
legend(hfvt2, 'y', 'FIR')

