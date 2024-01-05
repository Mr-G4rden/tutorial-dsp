## TARGET
# Plot the frequency response of the signal $x[n]$ by using the FFT
# function.
# 
# The parameters are:
# * x[n] = cos(2*pi*Fc*n*Ts) + k*w[n]
# * F_0 = 1 [kHz]
# * F_s = 16 [kHz];
# * k=[1e-8, 1e-6, 1e-4, 1e-2, 1e-1];
#

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Import the submodule signal of scipy to use the correlation funciton
from scipy import signal

## Parameters
F0 =  1e3
F1 =  2e3
Fs = 16e3
Ts = 1.0/Fs
len = 4096

# Index vector of the samples
n  = np.linspace(0, len-1, len)

# Signal
mu = 0
sigma = 1e-2
w0 = np.random.normal(mu, sigma, size=(len))
w1 = np.random.normal(mu, sigma, size=(len))
x0 = np.exp(+1j*2*np.pi*F0*n*Ts) + w0
x1 = np.exp(+1j*2*np.pi*F1*n*Ts) + w1

# FIR Filter
fir_ord = 64
fir_len = fir_ord+1
Wn = 5e3 / 8e3;
fir_num = signal.firwin(numtaps=fir_len,
                        cutoff=Wn, 
                        window='hann')

# IIR Filter
iir_ord = 12; Rp = 0.1; Wn = 5e3 / 8e3
[iir_num, iir_den] = signal.iirfilter(N=iir_ord, Wn=Wn, rp=Rp,
                      btype='lowpass', analog=False, ftype='cheby1')

# Filtering
y0_fir = signal.lfilter(b=fir_num, a=1, x=x0)
y1_fir = signal.lfilter(b=fir_num, a=1, x=x1)
y0_iir = signal.lfilter(b=iir_num, a=iir_den, x=x0)
y1_iir = signal.lfilter(b=iir_num, a=iir_den, x=x1)

## Figure

# Frequency vector for the plot
nFFT = 2**12
w, Hf_fir = signal.freqz(b=fir_num, a=1,
                         worN=nFFT,
                         whole=False)
w, Hf_iir = signal.freqz(b=iir_num, a=iir_den, 
                          worN=nFFT,
                          whole=False)
w, Yf0_fir = signal.freqz(b=y0_fir,a=1,
                           worN=nFFT,
                           whole=False)
w, Yf1_fir = signal.freqz(b=y1_fir,a=1,
                           worN=nFFT,
                           whole=False)
w, Yf0_iir = signal.freqz(y0_iir,a=1,
                           worN=nFFT,
                           whole=False)
w, Yf1_iir = signal.freqz(y1_iir,a=1,
                          worN=nFFT,
                          whole=False)

# Mag to dB
Hf_fir = 20*np.log10(np.abs(Hf_fir))
Hf_iir = 20*np.log10(np.abs(Hf_iir))
Yf0_fir = 20*np.log10(np.abs(Yf0_fir)/nFFT)
Yf0_iir = 20*np.log10(np.abs(Yf0_iir)/nFFT)
Yf1_fir = 20*np.log10(np.abs(Yf1_fir)/nFFT)
Yf1_iir = 20*np.log10(np.abs(Yf1_iir)/nFFT)


# Frequency normalization
w = w/np.pi
plt.figure()

plt.subplot(3,1,1)
plt.plot(w, Hf_fir, '-', label='H_{FIR}')
plt.plot(w, Hf_iir, '-', label='H_{IIR}')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Normalized Frequency \times \pi')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,2)
plt.plot(w, Yf0_fir, '-', label='YF0 - FIR')
plt.plot(w, Yf0_iir, '-', label='YF0 - IIR')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Normalized Frequency \times \pi')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,3)
plt.plot(w, Yf1_fir, '-', label='YF1 - FIR')
plt.plot(w, Yf1_iir, '-', label='YF1 - IIR')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Normalized Frequency \times \pi')
plt.ylabel('Amplitude [dB]')

plt.show()
