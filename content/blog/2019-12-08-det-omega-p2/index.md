---
title: The determinant bundle
kind: article
tags: ['algebraic-geometry', 'quick-read']
created_at: 2019-12-08
---

As always, when I haven't written anything on here in a while, I'm going to write about something entirely irrelevant to anything I've written about before (instead of continuing any of the many series of posts I've started or planned to start).
Today we're going to look at a 'fun' little calculation, which might be the most algebraic-geometry-like calculation I've done in a long time: we're going to compute the determinant of the cotangent sheaf of the complex projective sphere.
Note that even the statement of this problem makes me uneasy: I am nowhere near as comfortable with classical algebraic geometry as I should be!

<!-- more -->

Let's dive right in: I won't explain much at all about why we would care about this calculation, nor how the objects are really defined; I'm writing this because sometimes it's satisfying to just *do* a calculation or exercise that you might find in a textbook.

**Exercise.**
Let $X=\mathbb{P}^2(\mathbb{C})$ be the complex projective sphere, with a Zariski-open cover $\mathcal{U}$ given by $U_0 \cup U_1 \cup U_2$, where $$U_i = \{ [x_0:x_1:x_2] \mid x_i\neq0 \}.$$
Calculate the determinant bundle $\det\Omega_X^1$ of the cotangent sheaf.

**Solution.**
We see that, for $i\neq j\neq k\neq i$,
$$\begin{aligned}
    \mathcal{O}_X(U_i)
    &\cong
    \mathbb{C}[x_j/x_i, x_k/x_i]
\\  \Omega_X^1(U_i)
    &\cong
    \mathcal{O}_X(U_i) \big\langle \mathrm{d}(x_j/x_i),\mathrm{d}(x_k/x_i) \big\rangle.
\end{aligned}$$
So, if $U,U'\in\mathcal{U}$ are distinct, we can write
$$\begin{aligned}
    \mathcal{O}_X(U)
    &=
    \mathbb{C}[s,t]
\\  \mathcal{O}_X(U')
    &=
    \mathbb{C}[s',t'].
\end{aligned}$$
Assuming (since the other cases work in the same way) that $U=U_0$ and $U'=U_1$, we have
$$\begin{array}{cc}
    s = x_1/x_0
    & t = x_2/x_0
\\  s' = x_0/x_1
    & t' = x_2/x_1
\end{array}$$
and so $s'=1/s$ and $t'=t/s$ (on $U\cap U'$).
This means that $\Omega_X^1\vert(U\cap U')$ has bases $\{\mathrm{d}s,\mathrm{d}t\}$ and $\{\mathrm{d}s',\mathrm{d}t'\}$, with the relations
$$\begin{aligned}
    \mathrm{d}s'
    &=
    \mathrm{d}(1/s)
    =
    -\mathrm{d}s/s^2
\\  \mathrm{d}t'
    &=
    \mathrm{d}(t/s)
    =
    \frac{s\mathrm{d}t - t\mathrm{d}s}{s^2}
\end{aligned}$$
where we calculate $\mathrm{d}$ of a quotient by using that
$$0 = \mathrm{d}(1) = \mathrm{d}(z\cdot(1/z)) = \frac{1}{z}\mathrm{d}z + z\mathrm{d}\left(1/z\right).$$

This tells us that the transition matrix (the matrix describing the change of basis when moving from $U'$ to $U$) is
$$A=\begin{pmatrix}
    -1/s^2 & 0
\\  -t/s^2 & 1/s
\end{pmatrix}$$
and, for line bundles, the determinant is just given locally by the determinant of the transition matrices, and here $\det A=-s^{-3}$.
Thus $$\det\Omega_X^1 \cong \mathcal{O}(-3).$$

In general, we can similarly show that $\det\Omega_{\mathbb{P}^n}^1 \cong \mathcal{O}(-(n+1))$.