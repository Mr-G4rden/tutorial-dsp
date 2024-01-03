Complex Signals
===

Examples let you learn how to process complex signals. You will be able to generate and draw them.

# Exercises

* [Matlab](./matlab/)
* [Python](./python/)

## Exercise 0

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Plot the two complex signals represented in the discrete time domain. The signals are:

- $y[n]=e^{+i \\, \omega_N \\, n}$
- $w[n]=e^{+i \\, \omega_N \\, n}$

**Suggestions**

1. How to extract the **real** and **imag** components from a complex signal

    ```matlab
    %% Matlab
    % c=a+jb is the complex signal
    a = real(c); % Real component
    b = imag(c); % Imag component
    ```

    ```python
    ## Python
    # c=a+jb is the complex signal
    a = np.real(c); % Real component
    b = np.imag(c); % Imag component
    ```   

2. How to create a complex signal given its components

    ```matlab
    %% Matlab
    % c=a+jb is the complex signal
    c = complex(a,b);
    ```

## Exercise 1

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     yes    |     yes    |      no      |

Perform the upsample and downsample processes of the discrete complex
wave and draw them. The signal are:

- $x[n]=e^{+i \\, \omega_N \\, n}$
- $x_u[n]$ is the factor-of-2-upsampled signal of the $x$ signal
- $x_d[n]$ is the factor-of-2-downsampled signal of the $x$ signal

## Exercise 2

| **Matlab** | **Python** | **Simulink** |
|:----------:|:----------:|:------------:|
|     no     |     yes    |      yes     |

Generate the following signals:

- $x[n]=e^{+i \\, 2\pi \\, Fc_0 \\, T_s \\, n} + e^{+i \\, 2\pi \\, Fc_1 \\, T_s \\, n}$
- $y[n]= a_1 \\, x[n] + a_2 \\, x[n-1] + a_3 \\, x[n-2] + a_4 \\, x[n-3]$
