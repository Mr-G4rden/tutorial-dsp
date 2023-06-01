## TARGET
# Generate the following signals:
# * Input  Signal: x[n] = exp(1i*2*pi*Fc_0*Ts*n) + exp(1i*2*pi*Fc_1*Ts*n)
# * Output Signal: y[n] = a1*x[n] + a2*x[n-1] + a3*x[n-2] + a4*x[n-3]
#
# The parameters are:
# * a1 = 0.5
# * a2 = -1
# * a3 = 0.5
# * a4 = -1
# * Fc_0 =  1 [kHz];
# * Fc_1 =  4 [kHz];
# * Fs   = 16 [kHz];

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
# System parameters
a1 =  0.5;
a2 = -1.0;
a3 =  0.5;
a4 = -1.0;

# Complex wave frequencies
Fc_0 =  1e3;
Fc_1 =  4e3;

# Sampling frequency and period
Fs = 16e3;
Ts = 1.0/Fs;
len = 64

## Exercise
n = np.linspace(0, len-1, len)
x = np.exp(+1j*2*np.pi*Fc_0*Ts*n) + np.exp(+1j*2*np.pi*Fc_1*Ts*n)
y = a1*x + a2*np.concatenate((np.zeros(1,dtype='float'), x[0:-1]))
y = y    + a3*np.concatenate((np.zeros(2,dtype='float'), x[0:-2]))
y = y    + a4*np.concatenate((np.zeros(3,dtype='float'), x[0:-3]))

# Figures
plt.figure()

plt.subplot(2,1,1)
plt.plot(n, np.real(x), 's-', label='Real')
plt.plot(n, np.imag(x), 's-', label='Imag')
plt.grid()
plt.legend(loc='upper right')
plt.title('x')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(2,1,2)
plt.plot(n, np.real(y), 's-', label='Real')
plt.plot(n, np.imag(y), 's-', label='Imag')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Samples')
plt.ylabel('Amplitude')
plt.title('y')

plt.show()
