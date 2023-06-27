# Matlab

- [Matlab](#matlab)
  - [Exercise 0](#exercise-0)
  - [Exercise 1](#exercise-1)
  - [Exercise 2](#exercise-2)
    - [Section 1](#section-1)
    - [Section 2](#section-2)

## Exercise 0

Perform the cross-correlation between s[n] and x[n] using Matlab.

**Signals**

- $x[n] = sin(2 \\, \pi \\, F_c \\, n \\, T_s)$
- $w[n] = \mathrm{0.25 \cdot randn(...)}$
- $s[n] = x[n-100] + w[n]$

**Suggestions**

The cross-correlation function is:

```matlab
r_xy        = xcorr(x,y);
[r_xy, lag] = xcorr(x,y);
```

## Exercise 1

Perform the cross-correlation between s[n] and x[n] using the convolution with Simulink.

**Signals**

- $x[n] = sin(2 \\, \pi \\, F_c \\, n \\, T_s)$
- $w[n] \mathrm{is \, a \, Gaussian \, noise}$
- $s[n] = x[n-n_0] + w[n]$

**Suggestions**

How to implement a Gaussian noise.

1. Select the `Random Source` block from the DSP System Toolbox.
2. Open the configuration panel of the block.
3. `Source Type` --> `Gaussian`.
4. Set `Mean = 0` and `Variance=0.1`

## Exercise 2

This exercise consists of 2 sections:

### Section 1

I'll show you the [spectrogram](https://en.wikipedia.org/wiki/Spectrogram) of a [linear chirp](https://en.wikipedia.org/wiki/Chirp) and a sine wave.
The equation of a linear chirp is shown as follows:

$$
x_{chirp} = sin \big ( 2 \pi (\beta t + f_0) t \big)
$$

where $\beta=(f_1-f_0)/t_1$ and the default value for $f_0$ is 0 seconds.
The coefficient $\beta$ ensures that the desired frequency breakpoint $f_1$ at time $t_1$ is maintained.

### Section 2

I'll show you the autocorrelation of a linear chirp and a sine wave.
