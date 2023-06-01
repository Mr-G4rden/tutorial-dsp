## TARGET
# Perform the upsample and downsample processes of the discrete complex
# wave and draw them. The signal are
# * Signal 0: x[n]   = exp(1i*omegaN*n); omegaN = 1/16;
# * Signal 1: x_u[n] = upsample(x, L);   L = 2;
# * Signal 2: x_d[n] = downsample(x, M); M = 2;

## Import libraries
import numpy as np
import matplotlib.pyplot as plt

## Parameters
omegaN = 1.0/16
L = 2
M = 2
len = 64

## Exercise
n = np.linspace(0, len-1, len)
x = np.exp(+1j*omegaN*n)

# Upsampled signal
x_u = np.zeros(L*len, dtype='cfloat')
x_u[::2] = x
n_u = np.linspace(0, np.size(x_u)-1, np.size(x_u))

# Downsampled signal
x_d = x[::2]
n_d = np.linspace(0, np.size(x_d)-1, np.size(x_d))

# Figures
plt.figure()

plt.subplot(3,1,1)
plt.plot(n, np.real(x), 's-', label='Real')
plt.plot(n, np.imag(x), 's-', label='Imag')
plt.grid()
plt.legend(loc='upper right')
plt.title('x')
plt.xlabel('Samples')
plt.ylabel('Amplitude')

plt.subplot(3,1,2)
plt.plot(n_u, np.real(x_u), 's-', label='Real')
plt.plot(n_u, np.imag(x_u), 's-', label='Imag')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Samples')
plt.ylabel('Amplitude')
plt.title('x_u')

plt.subplot(3,1,3)
plt.plot(n_d, np.real(x_d), 's-', label='Real')
plt.plot(n_d, np.imag(x_d), 's-', label='Imag')
plt.grid()
plt.legend(loc='upper right')   # Legend
plt.xlabel('Samples')
plt.ylabel('Amplitude')
plt.title('x_u')

plt.show()
