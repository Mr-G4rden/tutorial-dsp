## TARGET
# Plot the two complex signals represented in the 
# discrete time domain. The signals are:
# * Signal 0: y[n]=exp(+1i*omegaN*n);
# * Signal 1: w[n]=exp(-1i*omegaN*n);
# 
# The parameters are:
# * omegaN = 0.3;  
#
# *Suggestions*
# 1) How to extract the real component from a complex signal
#    a = np.real(c);        % a = Re{x}
# 2) How to extract the imag component from a complex signal
#    b = np.imag(c);        % b = Im{x}
# 3) How to create a complex signal given its components
#    c = np.complex(a, b);  % c = a + jb

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
omegaN = 0.3
len = 32

## Exercise
n = np.linspace(0, len-1, len)   # Index vector of the samples
y = np.exp(+1j*omegaN*n)
w = np.exp(-1j*omegaN*n)

## Figures

# Scale the time vector to convert seconds to ms

plt.figure()

plt.subplot(2,1,1)
plt.plot(n, np.real(y), 's-', label='Real')
plt.plot(n, np.imag(y), 's-', label='Imag')
plt.grid()
plt.legend(loc='upper right')
plt.title('y')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(2,1,2)
plt.plot(n, np.real(w), 's-', label='Real')
plt.plot(n, np.imag(w), 's-', label='Imag')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Samples')
plt.ylabel('Amplitude')
plt.title('w')

plt.show()
