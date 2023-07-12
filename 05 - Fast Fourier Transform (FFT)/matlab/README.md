# Matlab

- [Matlab](#matlab)
  - [Exercise 0](#exercise-0)
  - [Exercise 1](#exercise-1)
    - [Discretization of the sinc function](#discretization-of-the-sinc-function)
  - [Exercise 2](#exercise-2)

## Exercise 0

Plot the frequency response of the signal $x[n]$ by using the FFT function.

**Signals**

- $x[n] = cos(2 \\, \pi \\, F_0 \\, n \\, T_s) + k \\, w_k[n]$
- $F_0 = 1$ [kHz]
- $F_s = 16$ [kHz]
- $w[n] = \mathrm{randn(...)}$
- $k = [1e-8,  \\, 1e-6,  \\, 1e-4,  \\, 1e-2,  \\, 1e-1]$

**Suggestions**

It's important to know the theory of the FFT and how it is implemented.
* [Mathworks documentation of the FFT function](https://it.mathworks.com/help/matlab/ref/fft.html)
* [Interesting link on FFT](https://it.mathworks.com/discovery/fft.html)

## Exercise 1

Plot the frequency response of the sinc signal by using the FFT function.

The sinc signal must be designed considering several lengths.

Don't use the _sinc_ matlab function. Compute the sinc manually and pay attention to the ratio 0/0.

### Discretization of the sinc function

Let's consider the continuous sinc function:

$x(t) = \frac{sin(2 \\, \pi \\, F_c \\, t)}{2 \\, \pi \\, F_c \\, t}

The discretizazion can be obtained with $t=nT_s$

$x[n] = \frac{sin(2 \\, \pi \\, F_N \\, n)}{2 \\, \pi \\, F_N \\, n}

where $F_N = \frac{F_c}{F_s}$ is the normalized frequency.

When you compute the sinc output, you must compensate the NaN value introduced by the ratio $\frac{0}/{0}$.

## Exercise 2

Plot the frequency representation of the signal $x[n]$ using the N-FFT function for different N values.

$x[n] = cos(2 \\, \pi \\, F_0 \\, n \\, T_s) + cos(2 \\, \pi \\, F_1 \\, n \\, T_s)$
