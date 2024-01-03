Convolution
===

These exercises show some cases where convolution can be used.

# Exercises

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Perform the convolution between $x[n]$ and $h[n]$. Use `fvtool` (only Matlab), `freqz` and `plot` to see the results. The signal are:

- $x[n] = cos(2 \\, \pi \\, F_{c0} \\, n) + cos(2 \\, \pi \\, F_{c1} \\, n)$
- For the signal h[n], I'll give you the samples
  
    ```matlab
    h = [-0.0013, -0.0054, -0.0124, ...
        -0.0107,  0.0204,  0.0904, ...
         0.1784,  0.2406,  0.2406, ...
         0.1784,  0.0904,  0.0204, ...
        -0.0107, -0.0124, -0.0054, ...
        -0.0013];
    ```

    ```python
    h = [-0.0013, -0.0054, -0.0124, ...
        -0.0107,  0.0204,  0.0904, ...
         0.1784,  0.2406,  0.2406, ...
         0.1784,  0.0904,  0.0204, ...
         -0.0107, -0.0124, -0.0054, ...
        -0.0013]
    ```

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Implement a _moving-average system_ to clean the signal
distorted by the noise. The signal is saved in the text file 'data.txt',
and the sampling frequency is 10 [Hz].
The equation of the _moving-average system_ is:

$$
y[n] = \frac{1}{M} \sum_{k=0}^{M-1}x[n-k]
$$

## Exercise 2

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     yes    |      yes     |

Clean the signal distorted by the noise designing two digital systems:

### System 1

Equation of _Moving-average system_:  

$$
y[n] = \frac{1}{M} \sum_{k=0}^{M-1}x[n-k]
$$

### System 2

Optimized design of a _Moving-average system_:  

$$
\begin{align*}
y[n] &= \frac{1}{M} \sum_{k=0}^{M-1}x[n-k] = \\
     &= \frac{x[n]}{M} +
        \underbrace{ \frac{1}{M} \sum_{k=1}^{M-1}x[n-k] + \frac{1}{M} x[n-M]}_{y[n-1]} -
        \frac{x[n-M]}{M} \\
&= y[n-1] + \frac{x[n]}{M} - \frac{x[n-M]}{M} \\
\end{align*}
$$

