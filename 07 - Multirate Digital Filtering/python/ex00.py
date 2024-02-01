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
Fs =   1e6
Ts = 1.0/Fs
len = 2**12
L = 4

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
Wn = F_cut / (Fs/2.0*L);
fir_num = signal.firwin(numtaps=fir_len,
                        cutoff=Wn, 
                        window='hann')

# Upsample (method 1)
# This function is not present in the scipy lib. It is implemented using a 'for'.
i = 0
xu = np.zeros(L*len, dtype='float')
for i in range(0,len):
  xu[L*i] = x[i]
nu = np.arange(start=0, stop=np.size(xu), dtype=int)

# Upsample (method 2)
# xu = np.zeros(L*len, dtype='float')
# xu[::L] = x

# Interpolation
y = signal.lfilter(b=fir_num, a=1, x=xu)
y = L*y

# Remove the filter latency
y = y[fir_ord/2:-fir_ord/2]

# Time vectors
ny = np.linspace(start=0, stop=np.size(y)-1, num=np.size(y))
tx  = n*Ts * 1e6
txu = nu*(Ts/L) * 1e6
ty  = ny*(Ts/L) * 1e6

## Figure

# Frequency vector for the plot
nFFT = 2**12
w, Hf_fir = signal.freqz(b=fir_num, a=1,
                         worN=nFFT,
                         whole=False)
w, Xf = signal.freqz(b=x,a=np.size(x),
                    worN=nFFT,
                    whole=False)
w, Xf_u = signal.freqz(b=xu,a=np.size(xu),
                      worN=nFFT,
                      whole=False)
w, Yf = signal.freqz(b=y,a=np.size(y),
                    worN=nFFT,
                    whole=False)
# Frequency normalization
w = w/np.pi * (Fs/2)/1e6
w_u = w*L

# Mag to dB
Hf_fir = 20*np.log10(np.abs(Hf_fir))
Xf = 20*np.log10(np.abs(Xf))
Xf_u = 20*np.log10(np.abs(Xf_u))
Yf = 20*np.log10(np.abs(Yf))


plt.figure()

plt.subplot(3,1,1)
plt.plot(w_u, Hf_fir, '-', label='H_FIR')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [MHz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,2)
plt.plot(w,   Xf,   '-', label='x')
plt.plot(w_u, Xf_u, '-', label='x_u')
plt.plot(w_u, Yf,   '-', label='y')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [MHz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,3)
plt.plot(tx, x,   's-', label='x')
plt.plot(txu, xu, '.-', label='x_u')
plt.plot(ty, y,   'x-', label='y')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Time \mu s')
plt.ylabel('Amplitude')

plt.show()
