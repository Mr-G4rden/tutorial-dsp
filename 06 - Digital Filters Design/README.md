Digital Filters Design
===

# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      yes     |

Generate and analyze the frequency responses of the FIR and IIR filters whose parameters are given as follows.
Next, FIR and IIR filters have to be used to filter 2 different signals that have to be analyzed in the frequency domain.

The parameters are:

* $x0[n]=e^{+i \\, 2 \\, \pi \\, F_0 \\, T_s \\, n} + w_0[n]$
* $x1[n]=e^{+i \\, 2 \\, \pi \\, F_1 \\, T_s \\, n} + w_1[n]$
* $F_0 =  1e3$
* $F_1 =  2e3$
* $F_s = 16e3$

**Suggestions**  

Matlab code.  

```matlab
% FIR coefficients
fir_ord = 64; Wn = 5e3 / 8e3;
[fir_num] = fir1(fir_ord, Wn, hann(fir_ord+1));

% IIR coefficients
iir_ord = 12; Rp = 0.01; Wn = 5e3 / 8e3;
[iir_num, iir_den] = cheby1(iir_ord,Rp,Wn);

% Filtering
%   * x   - input signal
%   * y   - output signal
%   * num - numerator   coefficients
%   * den - denominator coefficients
y = filter(num,den,x);
```

Python code.  

```python
# FIR Coefficients
fir_ord = 64
fir_len = fir_ord+1
Wn = 5e3 / 8e3;
fir_num = signal.firwin(numtaps=fir_len,
                        cutoff=Wn, 
                        window='hann')

# IIR Coefficients
iir_ord = 12; Rp = 0.1; Wn = 5e3 / 8e3
[iir_num, iir_den] = signal.iirfilter(N=iir_ord, Wn=Wn, rp=Rp,
                      btype='lowpass', analog=False, ftype='cheby1')

# Filtering
y0 = signal.lfilter(b=filter_num, a=filter_den, x=x0)
```

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     no     |      yes     |

The purpose of the exercise is to process wav files. The following tasks must be completed.

1. Listen the "wav 1.wav" and "wav 4.wav" by using Simulink.
2. Analyze the wav files of the folder "Wav" by using the spectrum and the spectrogram.
3. Sum the "wav" signals imported in Simulink and listen the result
4. Make a lowpass FIR filter to remove the "wav 4" frequency components from the sum of the "wave" signals. Listen and analyze the filtered signal.
5. Make a highpass FIR filter to remove the "wav 1" frequency components from the sum of the "wave" signals. Listen and analyze the filtered signal.
