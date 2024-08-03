%% TARGET
% Generate and analyze the frequency responses of the FIR and IIR filters
% whose parameters are given as follows. Next, FIR and IIR filters have to
% be used to filter 2 different signals that have to be analyzed in the
% frequency domain.
% 
% The parameters are:
%
% * x0[n] = exp(j 2 \pi F0 Ts n} + w0[n]
% * x1[n] = exp(j 2 \pi F1 Ts n} + w1[n]
% * F0 =  1 [kHz]
% * F1 =  2 [kHz]
% * Fs = 16 [kHz];
% 
% *Suggestions*
% 
% FIR coefficients
%   fir_ord = 64; Wn = 5e3 / 8e3;
%   [fir_num] = fir1(fir_ord, Wn, hann(fir_ord+1));
% 
% IIR coefficients
%   iir_ord = 12; Rp = 0.01; Wn = 5e3 / 8e3;
%   [iir_num, iir_den] = cheby1(iir_ord,Rp,Wn);
%
% Filtering
%   y = filter(num,den,x);
%     * x   - input signal
%     * y   - output signal
%     * num - numerator   coefficients
%     * den - denominator coefficients
%

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures


%% Parameters
F0 =  1e3;
F1 =  6e3;
Fs = 16e3;
Ts = 1/Fs;

%% Exercise
len = 2^12;
n = 0:len-1;

% Signals
w0 = 1e-2 * complex(randn(1,len), randn(1,len));
w1 = 1e-2 * complex(randn(1,len), randn(1,len));
x0 = exp(1i * 2 * pi * F0 * Ts * n) + w0;
x1 = exp(1i * 2 * pi * F1 * Ts * n) + w1;

% FIR Filter
fir_ord = 64; Wn = 5e3 / 8e3;
[fir_num] = fir1(fir_ord, Wn, hann(fir_ord+1));

% IIR Filter
iir_ord = 12; Rp = 0.01; Wn = 5e3 / 8e3;
[iir_num, iir_den] = cheby1(iir_ord,Rp,Wn);

% Filtering
y0_fir = filter(fir_num,1,x0);
y1_fir = filter(fir_num,1,x1);
y0_iir = filter(iir_num,iir_den,x0);
y1_iir = filter(iir_num,iir_den,x1);

%% Plot
% Using 'freqz'
nFFT = 2^12; % Number of points of the fft
Hf_fir = freqz(fir_num, 1, nFFT);
Hf_iir = freqz(iir_num, iir_den, nFFT);
Yf0_fir = freqz(y0_fir, 1, nFFT);
Yf1_fir = freqz(y1_fir, 1, nFFT);
Yf0_iir = freqz(y0_iir, 1, nFFT);
[Yf1_iir, w] = freqz(y1_iir, 1, nFFT);

% Frequency normalization
w = w/pi;

% Mag to dB
Hf_fir  = mag2db(abs(Hf_fir));
Hf_iir  = mag2db(abs(Hf_iir));
Yf0_fir = mag2db(abs(Yf0_fir)/nFFT);
Yf0_iir = mag2db(abs(Yf0_iir)/nFFT);
Yf1_fir = mag2db(abs(Yf1_fir)/nFFT);
Yf1_iir = mag2db(abs(Yf1_iir)/nFFT);

figure;
subplot(3,1,1)
  hold on
  plot(w, Hf_fir)
  plot(w, Hf_iir)
  hold off
  grid on
  legend('H_{FIR}','H_{IIR}')
  xlabel('Normalized Frequency \times \pi')
  ylabel('Amplitude [dB]')
subplot(3,1,2)
  hold on
  plot(w, Yf0_fir)
  plot(w, Yf0_iir)
  hold off
  grid on
  legend('YF0 - FIR','YF0 - IIR')
  xlabel('Normalized Frequency \times \pi')
  ylabel('Amplitude [dB]')
subplot(3,1,3)
  hold on
  plot(w, Yf1_fir)
  plot(w, Yf1_iir)
  hold off
  grid on
  legend('YF1 - FIR','YF1 - IIR')
  xlabel('Normalized Frequency \times \pi')
  ylabel('Amplitude [dB]')

% Using 'fvtool'
hfvt0 = fvtool(fir_num, 1, iir_num, iir_den, ...
               'Fs', Fs, 'NumberOfPoints', nFFT);
legend(hfvt0, 'FIR','IIR')


hfvt1 = fvtool(y0_fir, 1, y0_iir, 1, ...
               'Fs', Fs, 'NumberOfPoints', nFFT);
legend(hfvt1, 'y0 - FIR','y0 - IIR')


hfvt2 = fvtool(y1_fir, 1, y1_iir, 1, ...
               'Fs', Fs, 'NumberOfPoints', nFFT);
legend(hfvt2, 'y1 - FIR','y1 - IIR')

