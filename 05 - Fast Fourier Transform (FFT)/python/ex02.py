## TARGET
# Plot the frequency representation of the signal using 
# the N-FFT function for different N values.
#
# The parameters are:
# * x[n] = cos(2*pi*F0*n*Ts) + cos(2*pi*F1*n*Ts)
# * F0 = 1 [kHz]
# * F1 = 5.123 [kHz]
# * Fs = 16 [kHz];
# * N  = [8, 16, 32, 256]

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

# Import the submodule signal of scipy to use the chirp funciton
from scipy import signal

## Parameters
len = 32
Fs = 16e3
Ts = 1/Fs
F0 = 1000
F1 = 5123
N = np.array([8, 16, 32, 256])

# Index vector of the samples
n = np.linspace(0, len-1, len)
x = np.cos(2*np.pi*F0*n*Ts) + np.cos(2*np.pi*F1*n*Ts)

Xf_0 = np.fft.fft(x, N[0])/np.size(x)
Xf_1 = np.fft.fft(x, N[1])/np.size(x)
Xf_2 = np.fft.fft(x, N[2])/np.size(x)
Xf_3 = np.fft.fft(x, N[3])/np.size(x)

Xf_0 = np.abs(Xf_0)
Xf_1 = np.abs(Xf_1)
Xf_2 = np.abs(Xf_2)
Xf_3 = np.abs(Xf_3)

f_ax_0 = np.arange(start=-np.size(Xf_0)/2, 
                   stop=np.size(Xf_0)/2, 
                   step=1)/float(np.size(Xf_0))*Fs/1e3
f_ax_1 = np.arange(start=-np.size(Xf_1)/2,
                   stop=np.size(Xf_1)/2,
                   step=1)/float(np.size(Xf_1))*Fs/1e3
f_ax_2 = np.arange(start=-np.size(Xf_2)/2,
                   stop=np.size(Xf_2)/2,
                   step=1)/float(np.size(Xf_2))*Fs/1e3
f_ax_3 = np.arange(start=-np.size(Xf_3)/2,
                   stop=np.size(Xf_3)/2,
                   step=1)/float(np.size(Xf_3))*Fs/1e3


plt.figure()

plt.subplot(2,2,1)
plt.plot(f_ax_0, Xf_0, '-', label='Xf_0')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [kHz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(2,2,2)
plt.plot(f_ax_1, Xf_1, '-', label='Xf_1')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [kHz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(2,2,3)
plt.plot(f_ax_2, Xf_2, '-', label='Xf_2')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [kHz]')
plt.ylabel('Amplitude [dB]')

plt.subplot(2,2,4)
plt.plot(f_ax_3, Xf_3, '-', label='Xf_3')
plt.grid()
plt.legend(loc='upper right')
plt.xlabel('Frequency [kHz]')
plt.ylabel('Amplitude [dB]')

plt.show()
