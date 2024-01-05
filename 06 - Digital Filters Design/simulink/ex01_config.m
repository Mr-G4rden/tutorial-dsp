%% TARGET
%  1. Listen the "wav 1.wav" and "wav 4.wav" by using Simulink.
%  2. Analyze the wav files of the folder "Wav" by using the spectrum and
%     the spectrogram.
%  3. Sum the "wav" signals imported in Simulink and listen the result
%  4. Make a lowpass FIR filter to remove the "wav 4" frequency components 
%     from the sum of the "wave" signals. Listen and analyze the filtered 
%     signal.
%  5. Make a highpass FIR filter to remove the "wav 1" frequency components 
%     from the sum of the "wave" signals. Listen and analyze the filtered 
%     signal.
%
% *FIR Filter Suggestion*
% h = fir1(ord, Wn, FIR_type, hamming(ord+1))
%   * ord       --> Order
%   * Wn        --> cutoff frequency
%   * FIR_type  --> 'low' or 'high'
%   * window    --> hamming(ord+1)
%  
% *How to read a audio file from Simulink*
% * 'From Multimedia File' block to import a wav file
% * 'Audio Device Writer' block to listen the signal
% * 'Spectrum Analyzer' to analyze the spectrum
%    (In this case, you can use the block of the 
%     Audio Toolbox.)

%% Clear
clc;            % Clear the text from the Command Window
clear;          % Remove all variables from the current workspace
close all;      % Close all figures

% Path variables
path_wav_1 = [pwd, '/Wav/wav 1.wav'];
path_wav_4 = [pwd, '/Wav/wav 4.wav'];
