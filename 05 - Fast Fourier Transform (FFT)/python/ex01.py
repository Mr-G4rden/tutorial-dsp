## TARGET
# Plot the frequency response of the sinc signal by using the FFT function.
#
# The sinc signal must be designed considering several lengths to analyze
# the [Gibbs phenomenon](https://en.wikipedia.org/wiki/Gibbs_phenomenon).
# Don't use the _sinc_ matlab function. Compute the sinc manually and pay
# attention to the ratio 0/0.
# 
# The parameters are:
# * x_i[n] = sin(2*pi*F_n*n) where i=[0,2]
# * Length of n = [17, 65, 257]
# * T_s =   1 [ms]
# * F_c = 250 [Hz]
#

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
len = np.array([17, 65, 257])
Ts = 1e-3
Fs = 1.0/Ts
Fc = 250
F_N = Fc/Fs

## Exercise

# Index vector of the samples
n_lim = (len[0]-1)/2
n = np.linspace(-n_lim, n_lim, len[0])
x0 = np.sin(2*np.pi*F_N*n)
x0 = np.divide(x0, 2*np.pi*F_N*n)

exit
n_lim = (len[1]-1)/2
n = np.linspace(-n_lim, n_lim, len[1])
x1 = np.sin(2*np.pi*F_N*n)
x1 = np.divide(x1, 2*np.pi*F_N*n)

n_lim = (len[2]-1)/2
n = np.linspace(-n_lim, n_lim, len[2])
x2 = np.sin(2*np.pi*F_N*n)
x2 = np.divide(x2, 2*np.pi*F_N*n)

# NaN Check
x0[np.isnan(x0)] = 1.0
x1[np.isnan(x1)] = 1.0
x2[np.isnan(x2)] = 1.0

# Figure
nFFT = 2**10
Xf_0 = np.fft.fft(x0,nFFT)
Xf_1 = np.fft.fft(x1,nFFT)
Xf_2 = np.fft.fft(x2,nFFT)

Xf_0 = abs(Xf_0);
Xf_1 = abs(Xf_1);
Xf_2 = abs(Xf_2);

f_ax_0 = np.arange(start=0, stop=np.size(Xf_0), step=1)/float(np.size(Xf_0))*Fs
f_ax_1 = np.arange(start=0, stop=np.size(Xf_1), step=1)/float(np.size(Xf_1))*Fs
f_ax_2 = np.arange(start=0, stop=np.size(Xf_2), step=1)/float(np.size(Xf_2))*Fs

plt.figure()

plt.subplot(3,1,1)
plt.plot(f_ax_0, Xf_0, '-', label='Xf_0')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,2)
plt.plot(f_ax_1, Xf_1, '-', label='Xf_1')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(3,1,3)
plt.plot(f_ax_2, Xf_2, '-', label='Xf_2')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [Hz]')
plt.ylabel('Amplitude [dB]')

plt.show()
