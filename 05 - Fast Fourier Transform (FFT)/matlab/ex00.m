%% TARGET
% Plot the frequency response of the signal $x[n]$ by using the FFT
% function.
% 
% The parameters are:
% * x[n] = cos(2*pi*Fc*n*Ts) + k*w[n]
% * F_0 =  1 [kHz]
% * F_s = 16 [kHz]
% * k=[1e-8, 1e-6, 1e-4, 1e-2, 1e-1]
%
% *Suggestions*
%   1) FFT Function (https://it.mathworks.com/help/matlab/ref/fft.html)
% 
%       Y = fft(X) computes the discrete Fourier transform (DFT) of X using
%       a fast Fourier transform (FFT) algorithm.
%       * If X is a vector, then fft(X) returns the Fourier transform of
%         the vector.
%       * If X is a matrix, then fft(X) treats the columns of X as vectors
%         and returns
%         the Fourier transform of each column.
%       * If X is a multidimensional array, then fft(X) treats the values
%         along the first array dimension whose size does not equal 1 as
%         vectors and returns the Fourier transform of each vector.
%
% 

%% Clear everything
clc;        % 'clc' clears all the text from the Command Window
clear;      % 'clear' removes all variables from the current workspace
close all;  % 'close all' deletes all figures whose handles are not hidden.

%% Parameters
len = 2^10;
F0 = 1e3;
Fs = 16e3;
Ts = 1/Fs;
k=[1e-8, 1e-6, 1e-4, 1e-2, 1e-1];

%% Exercise
x = cos(2*pi*F0/Fs*(0:len-1)).';    % It is a column
w = randn(len,1);                   % Size: (Row,Col) = (1024,1)

% Initialization of the matrix X. The latter contains the signal x plus
% noise with different values of k.
X = zeros(len, length(k));          % Size: (Row,Col) = (1024,5)

for i=1:length(k)
    X(:,i) = x + k(i) * w;
end

% When the fft function processes an array, fft is evaluated for each
% column.
Xf = fft(X)/size(X,1);              % Size: (Row,Col) = (1024,5)
Xf_abs = abs(Xf);
Xf_abs_dB = mag2db(Xf_abs);

%% Figure

% Frequency vector for the plot
f_ax = (0:len-1)/len * Fs;

figure
plot(f_ax, Xf_abs_dB)
grid on
legend('k(1)','k(2)','k(3)','k(4)','k(5)')
xlabel('Frequency [Hz]')
ylabel('Amplitude [dB]')
