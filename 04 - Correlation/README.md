Correlation
===

These exercises show some cases where correlation can be used.

# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Perform the cross-correlation between s[n] and x[n].

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

```python
r_xy = signal.correlate(x, y)
```

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     yes    |      yes     |

Perform the cross-correlation between s[n] and x[n] using the convolution.

**Signals**

- $x[n] = sin(2 \\, \pi \\, F_c \\, n \\, T_s)$
- $w[n]$ is a Gaussian noise
- $s[n] = x[n-n_0] + w[n]$

**Suggestions**

How to implement a Gaussian noise with _Simulink_.

1. Select the `Random Source` block from the DSP System Toolbox.
2. Open the configuration panel of the block.
3. `Source Type` --> `Gaussian`.
4. Set `Mean = 0` and `Variance=0.1`

How to implement a Gaussian noise with _Python_.

```python
import numpy as np
mu  = 0.0
sigma2 = 0.1
sigma  = np.sqrt(sigma2)
len = 100 # Number of samples 
w = np.random.normal(mu, sigma, size=(len))
```

## Exercise 2

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

This exercise consists of 2 sections:

### Section 1

I'll show you the [spectrogram](https://en.wikipedia.org/wiki/Spectrogram) of a [linear chirp](https://en.wikipedia.org/wiki/Chirp) and a sine wave.
The equation of a linear chirp is shown as follows:

$$
x_{chirp} = sin \big ( 2 \pi (\beta t + f_0) t \big)
$$

where $\beta=(f_1-f_0)/t_1$ and the default value for $f_0$ is 0 seconds.
The coefficient $\beta$ ensures that the desired frequency breakpoint $f_1$ at time $t_1$ is maintained.

You can find more information about Python functions in the following links:
- [Function: spectrogram](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.specgram.html)
- [Function: chirp](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.chirp.html)

### Section 2

I'll show you the autocorrelation of a linear chirp and a sine wave.
