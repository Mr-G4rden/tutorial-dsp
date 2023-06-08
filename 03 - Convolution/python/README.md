# Python

- [Python](#python)
  - [Exercise 0](#exercise-0)
  - [Exercise 1](#exercise-1)
  - [Exercise 2](#exercise-2)
    - [System 1](#system-1)
    - [System 2](#system-2)

## Exercise 0

Perform the convolution between $x[n]$ and $h[n]$. Use `freqz` and `plot` to see the results. The signal are:

- $x[n] = cos(2 \\, \pi \\, F_{c0} \\, n) + cos(2 \\, \pi \\, F_{c1} \\, n)$
- $h = y[n−1] + (Ts/2) \cdot (x[n] + x[n−1])$  
  For the signal h[n], I'll give you the samples

    ```python
    h = [-0.0013, -0.0054, -0.0124, ...
        -0.0107,  0.0204,  0.0904, ...
         0.1784,  0.2406,  0.2406, ...
         0.1784,  0.0904,  0.0204, ...
         -0.0107, -0.0124, -0.0054, ...
        -0.0013]
    ```

## Exercise 1

Implement a _moving-average system_ using Matlab to clean the signal
distorted by the noise. The signal is saved in the text file 'data.txt',
and the sampling frequency is 10 [Hz].
The equation of the _moving-average system_ is represented by the equation shown in 'ex01_eqn1.png':

$$
y[n] = \frac{1}{M} \sum_{k=0}^{M-1}x[n-k]
$$

## Exercise 2

Clean the signal distorted by the noise designing two digital systems

### System 1

Equation of _Moving-average system_  

$$
y[n] = \frac{1}{M} \sum_{k=0}^{M-1}x[n-k]
$$

### System 2

Optimized design of a _Moving-average system_  

$$
\begin{align*}
y[n] &= \frac{1}{M} \sum_{k=0}^{M-1}x[n-k] = \\
     &= \frac{x[n]}{M} +
        \underbrace{ \frac{1}{M} \sum_{k=1}^{M-1}x[n-k] + \frac{1}{M} x[n-M]}_{y[n-1]} -
        \frac{x[n-M]}{M} \\
&= y[n-1] + \frac{x[n]}{M} - \frac{x[n-M]}{M} \\
\end{align*}
$$
