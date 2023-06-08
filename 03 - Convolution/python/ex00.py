## TARGET
# Perform the convolution between x[n] and h[n].
# Use 'freqz' and 'plot' to see the results.
#
# x[n] is a signal
# * x[n] = cos(2*pi*Fc0*n*Ts) + cos(2*pi*Fc1*n*Ts);
#
# For the signal h[n], I'll give you the samples
# * h = [-0.0013, -0.0054, -0.0124, ...
#        -0.0107,  0.0204,  0.0904, ...
#         0.1784,  0.2406,  0.2406, ...
#         0.1784,  0.0904,  0.0204, ...
#        -0.0107, -0.0124, -0.0054, ...
#        -0.0013];
#
# The parameters are:
# * Fc0  =  31.25 [Hz]
# * Fc1  = 312.50 [Hz];
# * Fs   =   1    [kHz];
#
# *Suggestions*
# 1) The convolution function is shown as follows:
#    y[n] = conv(x,h);

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Import the submodule signal of scipy to use freqz
from scipy import signal

## Parameters
Fc0 = 31.25
Fc1 = 312.5
Fs  = 1e3
Ts  = 1.0/Fs
len = 2**10

## Exercise

# Index vector of the samples
n = np.linspace(0, len-1, len)

# x signal
x = np.cos(2*np.pi*Fc0*n*Ts) + 0*np.cos(2*np.pi*Fc1*n*Ts)

# h vector
h = np.array([-0.0013, -0.0054, -0.0124, 
              -0.0107,  0.0204,  0.0904, 
               0.1784,  0.2406,  0.2406, 
               0.1784,  0.0904,  0.0204, 
              -0.0107, -0.0124, -0.0054, 
              -0.0013])

# Convolution
y = np.convolve(x,h)

# Index vectors of h and y
nh = np.linspace(0, np.size(h)-1, np.size(h))
ny = np.linspace(0, np.size(y)-1, np.size(y))

## Figures

# Points of the FFT
nFFT = 2**10

# Freqz
_,    X_f = signal.freqz(x, 1, worN=nFFT, whole=True, plot=None)
_,    H_f = signal.freqz(h, 1, worN=nFFT, whole=True, plot=None)
f_ax, Y_f = signal.freqz(y, 1, worN=nFFT, whole=True, plot=None)
X_f = 20*np.log10(abs(X_f)/nFFT)
H_f = 20*np.log10(abs(H_f))
Y_f = 20*np.log10(abs(Y_f)/nFFT)

f_ax = f_ax/(2.0*np.pi)*Fs;  # From normalized frequency to Hz
f_ax = f_ax/1e3;           # [Hz] to [kHz]
plt.figure()

plt.subplot(3,2,1)
plt.plot(n, x, label='x')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(3,2,2)
plt.plot(f_ax, X_f, label='X_f')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [kHz]')
plt.ylabel('Magnitude [dB]')

plt.subplot(3,2,3)
plt.plot(nh, h, label='h')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(3,2,4)
plt.plot(f_ax, H_f, label='H_f')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [kHz]')
plt.ylabel('Magnitude [dB]')

plt.subplot(3,2,5)
plt.plot(ny, y, label='y')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(3,2,6)
plt.plot(f_ax, Y_f, label='Y_f')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [kHz]')
plt.ylabel('Magnitude [dB]')

plt.show()
