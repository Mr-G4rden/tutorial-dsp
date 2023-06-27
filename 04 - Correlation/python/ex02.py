## Section 1: One chirp, one sine wave
# In this first section, I'll show you the spectrogram of a linear chirp
# and a sine wave

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Import the submodule signal of scipy to use the chirp funciton
from scipy import signal

## Parameters
Fs = 1e6
Fc = Fs/16.0
Ts = 1.0/Fs
len = 1024
sigma2 = 0.1
sigma  = np.sqrt(sigma2)

# Index vector of the samples
n = np.linspace(0, len-1, len)

# Time vector for the chirp function
t = np.linspace(0, (len-1)*Ts, len)

# Waves
x1 = np.sin(2*np.pi*Fc*n*Ts)
x2 = signal.chirp(t, f0=0, f1=Fs/4, t1=(750*Ts), method='linear')

# Spectrogram using matplotlib
nFFT     = 128
noverlap = nFFT-1

plt.figure()

plt.subplot(2,1,1)
plt.specgram(x1, Fs=Fs, noverlap=noverlap, NFFT=nFFT)
plt.xlabel('Time')
plt.ylabel('Frequency')

plt.subplot(2,1,2)
plt.specgram(x2, Fs=Fs, noverlap=noverlap, NFFT=nFFT)
plt.xlabel('Time')
plt.ylabel('Frequency')

# Time plot
plt.figure()

plt.subplot(2,1,1)
plt.plot(n, x1, '.-', label='x1')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(2,1,2)
plt.plot(n, x2, '.-', label='x2')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

## Section 2: Autocorrelation
# In this second section, I'll show you the autocorrelation of a linear
# chirp and a sine wave.

# Autocorrelation
r1 = signal.correlate(x1, x1)
r2 = signal.correlate(x2, x2)
len_r1 = r1.size
len_r2 = r2.size

lag1 = np.linspace(-x1.size+1, len_r1-x1.size, len_r1)
lag2 = np.linspace(-x2.size+1, len_r1-x2.size, len_r2)


# Plot
plt.figure()

plt.subplot(2,2,1)
plt.plot(n, x1, '.-', label='x1')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(2,2,3)
plt.plot(n, x2, '.-', label='x2')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(2,2,2)
plt.plot(lag1,r1, '.-', label='r1')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(2,2,4)
plt.plot(lag2,r2, '.-', label='r2')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.show()

