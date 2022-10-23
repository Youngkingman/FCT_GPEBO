# FCT_GPEBO
复现FCT_GPEBO论文 [[2005.12940v1\] Distributed Observers for LTI Systems with Finite Convergence Time: A Parameter Estimation-based Approach (arxiv.org)](https://arxiv.org/abs/2005.12940v1)

## 动力学方程的位置安排

### 观测器1

取$n_1 = 2,n_2=4$，对于第一个观测器：

$$
\dot{Y}_1=-\lambda_1Y_1+\lambda_1\Psi_1^\top y^{(1)}, Y_1(0)=0_{n_1\times 1} \\\\
\dot{\Omega}_1 = -\lambda_1\Omega_1 + \lambda_1\Psi_1^\top\Psi_1, \Omega_1(0) = 0_{n_1\times n_1} \\\\
\dot{\omega}_1 = -\gamma_1\Delta_1^2\omega_1, \omega_1(0)=1 \\\\
\dot{\hat \theta}_1 = \gamma_1\Delta_1(\Gamma_1-\Delta_1\hat{\theta}_1),\hat\theta_1(0)=0_{n1\times 1}
$$

同时还有观测信号 $y^{(1)}=C_{11}x^{(1)}$ 。

所以第一个观测器的空间是这么分配的（左闭右闭）：

| 状态名           | 起始点              | 结束点                |
| ---------------- | ------------------- | --------------------- |
| $x^{(1)}$        | 1                   | $n_1$                 |
| $Y_1$            | $1+n_1$             | $n_1+n_1$             |
| $\Omega_1$       | $1+n_1+n_1$         | $n_1+n_1+n_1^2$       |
| $\omega_1$       | $1+n_1+n_1+n_1^2=$  | $1+n_1+n_1+n_1^2$     |
| $\hat{\theta}_1$ | $1+n_1+n_1+n_1^2+1$ | $1+n_1+n_1+n_1^2+n_1$ |

一共是$[1,11]$个状态。

### 观测器2

对于第二个观测器：

$$
\dot\Phi^{(2)}=A^{(2)}\Phi^{(2)}, \Phi^{(2)}(0)=I_{n_1+n_2} \\\\
\dot{Y}_2=-\lambda_2Y_2+\lambda_2\Psi_2^\top y^{(2)}, Y_2(0)=0_{n_2\times 1} \\\\
\dot{\Omega}_2 = -\lambda_2\Omega_2 + \lambda_2\Psi_2^\top\Psi_2, \Omega_2(0) = 0_{n_2\times n_2} \\\\
\dot{\omega}_2 = -\gamma_2\Delta_2^2\omega_2, \omega_2(0)=1 \\\\
\dot{\hat \theta}_2 = \gamma_2\Delta_2(\Gamma_2-\Delta_1\hat{\theta}_2),\hat\theta_2(0)=0_{n_2\times 1}
$$

同时还有观测信号 $y^{(2)}=C_{21}x^{(1)}+C_{22}x^{(2)}$，需要有一个$x^{(2)}$。

| 状态名           | 起始点                           | 结束点                             |
| ---------------- | -------------------------------- | ---------------------------------- |
| $\Phi^{(2)}$     | $12$                             | $12+(n_1+n_2)^2-1$                 |
| $x^{(2)}$        | $12+(n_1+n_2)^2$                 | $12+(n_1+n_2)^2+n_2-1$             |
| $Y_2$            | $12+(n_1+n_2)^2+n_2$             | $12+(n_1+n_2)^2+n_2+n_2-1$         |
| $\Omega_2$       | $12+(n_1+n_2)^2+n_2+n_2$         | $12+(n_1+n_2)^2+n_2+n_2+n_2^2-1$   |
| $\omega_1$       | $12+(n_1+n_2)^2+n_2+n_2+n_2^2$   | $12+(n_1+n_2)^2+n_2+n_2+n_2^2$     |
| $\hat{\theta}_2$ | $12+(n_1+n_2)^2+n_2+n_2+n_2^2+1$ | $12+(n_1+n_2)^2+n_2+n_2+n_2^2+n_2$ |

一共是$[12,76]$维度。

可以对照着上面两个表阅读代码中的微分方程部分。
