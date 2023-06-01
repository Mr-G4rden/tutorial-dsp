# Matlab

- [Matlab](#matlab)
  - [Exercise 0](#exercise-0)
    - [Suggestions](#suggestions)
  - [Exercise 1](#exercise-1)
  - [Exercise 2](#exercise-2)

## Exercise 0

Plot the two complex signals represented in the discrete time domain. The signals are:

- $y[n]=e^{+i \\, \omega_N \\, n}$
- $w[n]=e^{+i \\, \omega_N \\, n}$

### Suggestions

1. How to extract the **real** and **imag** components from a complex signal

```matlab
% c=a+jb is the complex signal
a = real(c); % Real component
b = imag(c); % Imag component
```

2. How to create a complex signal given its components

```matlab
% c=a+jb is the complex signal
c = complex(a,b);
```

## Exercise 1

Perform the upsample and downsample processes of the discrete complex
wave and draw them. The signal are:

- $x[n]=e^{+i \\, \omega_N \\, n}$
- $x_u[n]$ is the factor-of-2-upsampled signal of the $x$ signal
- $x_d[n]$ is the factor-of-2-downsampled signal of the $x$ signal

## Exercise 2

Use Simulink to generate the following signals:

- $x[n]=e^{+i \\, 2\pi \\, Fc_0 \\, T_s \\, n} + e^{+i \\, 2\pi \\, Fc_1 \\, T_s \\, n}$
- $y[n]= a_1 \\, x[n] + a_2 \\, x[n-1] + a_3 \\, x[n-2] + a_4 \\, x[n-3]$
