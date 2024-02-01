## Target
#
# Design an interpolator and use it to filter a signal.
# 
# The parameters are:
#
# * x[n] = cos(2*pi*Fc*n*Ts) + w[n];
# * w[n] is the noise
# * Fc = 125 [kHz]
# * Fs =   1 [MHz]
# * L  =   4  # Interpolator Factor
# 

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Import the submodule signal of scipy to use the correlation funciton
from scipy import signal

## Parameters
Fc = 125e3
Fs = 1e6
Ts = 1.0/Fs
len = 2**12
L = 5
M = 3

# Index vector of the samples
n  = np.arange(start=0, stop=len, dtype=int)

# Signal
mu = 0
sigma = 1e-2
w = np.random.normal(mu, sigma, size=(len))
x = np.cos(2*np.pi*Fc*n*Ts) + w

# FIR Filter
fir_ord = 64
fir_len = fir_ord+1
F_cut = 500e3
Wn = F_cut / (Fs*L/2.0);
fir_num = signal.firwin(numtaps=fir_len,
                        cutoff=Wn, 
                        window='hann')

# Upsample
xu = np.zeros(L*len, dtype='float')
xu[::L] = x
nu = np.arange(start=0, stop=np.size(xu), dtype=int)

# Filtering
y = L*signal.lfilter(b=fir_num, a=1, x=xu)

# Remove the filter latency
y = y[fir_ord/2:-fir_ord/2]

# Downsample
y = y[::M]

# Time vectors
ny = np.linspace(start=0, stop=np.size(y)-1, num=np.size(y))
tx  = n*Ts * 1e6
ty  = ny*(Ts/L*M) * 1e6

## Figure

# Frequency vector for the plot
nFFT = 2**12
w, Hf_fir = signal.freqz(b=fir_num, a=1,
                         worN=nFFT,
                         whole=False)
w, Xf = signal.freqz(b=x,a=np.size(x),
                    worN=nFFT,
                    whole=False)
w, Yf = signal.freqz(b=y,a=np.size(y),
                    worN=nFFT,
                    whole=False)
# Frequency normalization
w = w/np.pi * (Fs/2)/1e6
w_u = w*L
w_y = w*L/M

# Mag to dB
Hf_fir = 10*np.log10(np.abs(Hf_fir)**2)
Xf = 10*np.log10(np.abs(Xf)**2)
Yf = 10*np.log10(np.abs(Yf)**2)


plt.figure()

plt.subplot(3,1,1)
plt.plot(w, Hf_fir, '-', label='H_FIR')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [MHz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,2)
plt.plot(w,   Xf,   '-', label='x')
plt.plot(w_y, Yf,   '-', label='y')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [MHz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,3)
plt.plot(tx, x,   's-', label='x')
plt.plot(ty, y,   'x-', label='y')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Time \mu s')
plt.ylabel('Amplitude')

plt.show()
