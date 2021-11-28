---
title: The basics of Lie algebra cohomology
part: Part 3
kind: article
tags: ['lie-algebras', 'cohomology']
created_at: 2021-11-29
---

\providecommand{\ZZ}{\mathbb{Z}}
\providecommand{\CC}{\mathbb{C}}
\providecommand{\Hom}{\operatorname{Hom}}
\providecommand{\Coinv}{\operatorname{Coinv}}
\providecommand{\Ext}{\operatorname{Ext}}
\providecommand{\Tor}{\operatorname{Tor}}
\providecommand{\HH}{\operatorname{H}}
\providecommand{\aa}{\mathfrak{a}}
\providecommand{\gg}{\mathfrak{g}}
\providecommand{\hh}{\mathfrak{h}}
\providecommand{\Ugg}{\mathcal{G}}
\providecommand{\Uhh}{\mathcal{H}}
\providecommand{\CE}{\operatorname{CE}}
\providecommand{\SL}{\operatorname{SL}}
\providecommand{\sl}{\operatorname{\mathfrak{sl}}}
\providecommand{\dd}{\mathrm{d}}
\providecommand{\triv}{\mathrm{triv}}

\renewcommand{\geq}{\geqslant}
\renewcommand{\leq}{\leqslant}

We'll end this series (for now) by talking about two things that we really should talk about: Lie algebra *homology*, and *relative* Lie algebra (co)homology.
(We will work over a field $k$, but really we are thinking only of the case $k=\CC$).

<!-- more -->

# Lie algebra homology

Just as Lie algebra cohomology is constructed to be the derived functor of the functor of invariants, Lie algebra homology is constructed to be the derived functor of the functor of *coinvariants*:
$$
  \begin{aligned}
    \Coinv_\gg(M) = M_\gg &\coloneqq M/\gg M
  \\\HH_\bullet(\gg,M) &\coloneqq \Tor_\bullet^{U(\gg)}(k,M).
  \end{aligned}
$$
We need to justify why this $\Tor$ is indeed the derived functor of $\Coinv$, since the latter doesn't seem to have anything to do with tensor products a priori.
To do this, we need to make a small definition (which we should really have made back when we constructed the projective resolution $U(\gg)\otimes_k\wedge^p\gg \twoheadrightarrow k^\triv$).

::: {.rmenv title="Definition"}
Write $i\colon\gg\to U(\gg)$ to mean the composite map $\gg\hookrightarrow T(\gg)\twoheadrightarrow U(\gg)$.
The $k$-algebra homomorphism $\varepsilon\colon U(\gg)\to k$ defined by sending $i(\gg)$ to zero is called the *augmentation map*, and we call its kernel $\mathfrak{J}$ the *augmentation ideal*.
:::

::: {.itenv title="Lemma"}
The augmentation ideal $\mathfrak{J}$ is generated (as a $U(\gg)$-module) by the image $i(\gg)$.
Further, $k\cong U(\gg)/\mathfrak{J}=U(\gg)_\gg$.
:::

With this, we can see why the derived functor of the coinvariants functor is calculated by $\Tor$, since
$$
  \begin{aligned}
    k\otimes_{U(\gg)}M
    &\cong U(\gg)/\mathfrak{J}_{U(\gg)}M
  \\&\cong M/\mathfrak{J}M
  \\&\cong M/\gg M
    = M_\gg.
  \end{aligned}
$$

As we did for cohomology, we can construct a chain complex that computes the Lie algebra homology: we define
$$
  \wedge_p = \wedge_p(\gg,M) \coloneqq \wedge^p(\gg)\otimes_k M
$$
(so that $\wedge_0=M$), with differential $\partial\colon\wedge_p\to\wedge_{p-1}$ given by
$$
  \begin{aligned}
    \partial_p(x_1\wedge\ldots\wedge x_p\otimes m) =
    \,&\sum_{1\leq i<j\leq p} (-1)^{i+j} [x_i,x_j]\wedge x_1\wedge\ldots\wedge\widehat{x_i}\wedge\ldots\wedge\widehat{x_j}\wedge\ldots\wedge x_p \otimes m
  \\+&\sum_{i=1}^p (-1)^i x_1\wedge\ldots\wedge\widehat{x_i}\wedge\ldots\wedge x_p \otimes (x_im).
  \end{aligned}
$$
The claim (which we won't prove) is then that
$$
  \HH_p(\gg,M) \cong \operatorname{Z}_p(\gg,M)/\operatorname{B}_p(\gg,M).
$$


# Relative Lie algebra (co)homology: some properties

Again, as is usual for (co)homology theories, we wish to have some notion of the (co)homology *of a pair*.
So let $(\gg,\hh)$ be a Lie algebra pair (i.e. $\hh$ and $\gg$ are both Lie algebras, with $\hh\hookrightarrow\gg$ a subalgebra), and $M$ a $\gg$-module.
It should be the case that, however we define the (co)homology of this pair (with coefficients in $M$), we at the very least recover the non-relative (co)homology of $\gg$ when $\hh$ is zero, i.e. we should definitely have that
$$
  \HH^\bullet(\gg,0;M) \cong \HH^\bullet(\gg;M).
$$
But before giving the definition, it's maybe also helpful to see another theorem which will hold, which tells us about the case of the relative cohomology of a *reductive* subalgebra.

::: {.rmenv title="Definition"}
Let $(\gg,\hh)$ be a Lie algebra pair.
We say that it is *reductive* if the adjoint Lie algebra representation of $\hh$ on $\gg$ is reducible.
:::

::: {.itenv title="Theorem"}
Let $(\gg,\hh)$ be a Lie algebra pair, and $M$ a $\gg$-module.
Assume that

- everything (i.e. $\hh$, $\gg$, and $M$) is finite dimensional (I'm not actually sure that this is necessary, but I'm just being safe here);
- $(\gg,\hh)$ is a reductive pair; and
- we can write $\gg$ as a semi-direct product $\gg=\hh\ltimes\aa$ (where $\aa$ is thus, in particular, a *Lie ideal* of $\gg$, i.e. a vector subspace such that $[\aa,\gg]\subseteq\aa$).

Then
$$
  \HH^\bullet(\aa;M)^\gg \simeq \HH^\bullet(\aa;M)^\hh \simeq \HH^\bullet(\gg,\hh;M)
$$
(where the superscript denotes the space of invariants).
:::


# Relative Lie algebra (co)homology: some definitions

As before, we will first give a complex whose internal cohomology computes relative Lie algebra cohomology, and then construct a projective resolution of $k^\triv$ so that we can show how to recover the derived functor definition.

::: {.rmenv title="Definition"}
The *relative Chevalley--Eilenberg complex $\CE^\bullet(\gg,\hh;M)$* is defined by
$$
  \CE^p(\gg,\hh;M) \coloneqq \big( (\wedge^p(\gg/\hh)^*)\otimes_k M \big)^\hh
$$
and the differential is given by the duals of the Lie bracket and the action of $\gg$ on $M$, i.e.
$$
  d \coloneqq \rho^* + [-,-]^*.
$$
:::

By definition, if $\hh=0$, then we recover exactly the Chevalley--Eilenberg complex of $\gg$, which is one thing that we wanted.
(To see this, we use the general fact that we have an isomorphism of the form $\Hom_k(A,V)\cong A^*\otimes_k V$).

As for relative homology, we define the complex
$$
  \wedge_p = \wedge_p(\gg,\hh;M) \coloneqq \frac{\wedge^p(\gg/\hh)\otimes_k M}{\hh\cdot(\wedge^p(\gg/\hh)\otimes_k M)}
$$
where $\hh\cdot V$, for an $\hh$-module $V$, denotes the span of elements of the form $x\cdot v$ for $x\in\hh$ and $v\in V$.

So far, we have not really been making any assumptions about whether or not $M$ is finite dimensional.
It turns out that we don't have to, but we do need to impose at least some sort of condition relating to its dimension, whence the following definition.

::: {.rmenv title="Definition"}
We say that a $\gg$-module is *finitely semisimple* if it is the sum of its finite-dimensional irreducible $\gg$-submodules.
:::

Being finitely semisimple is preserved under quotients, taking submodules, and tensor products.

::: {.itenv title="Lemma"}
Let $(\gg,\hh)$ be a Lie algebra pair such that $\gg$ is finitely semisimple under the adjoint action of $\hh$.
Write $\Ugg$ (resp. $\Uhh$) to mean $U(\gg)$ (resp. $U(\hh)$).
Then the complex
$$
  \ldots \to D_2 \to D_1 \to D_0
$$
is a $(\Ugg,\Uhh)$-projective resolution of $k^\triv$, where
$$
  D_p \coloneqq \Ugg\otimes_\Uhh\wedge^p(\gg/\hh).
$$
:::

::: {.itenv title="Corollary"}
Under the same assumptions, the complex $D_\bullet\otimes_k M$ is a $(\Ugg,\Uhh)$-projective resolution of $M$.
:::

Using this resolution, we can show the following:

::: {.itenv title="Lemma"}
Let $(\gg,\hh)$ be a Lie algebra pair such that $\gg$ is finitely semisimple under the adjoint action of $\hh$.
Then
$$
  \HH_\bullet(\gg,\hh;M) \simeq \Tor_\bullet^{(\Ugg,\Uhh)}(M^t,k) \simeq \Tor_\bullet^{(\Ugg,\Uhh)}(k,M)
$$
(where $M^t$ is the right $\gg$-module with the same underlying space as $M$, but with $m\cdot x\coloneqq -xm$ for $m\in M$ and $x\in\gg$), and
$$
  \HH^\bullet(\gg,\hh;M) \simeq \Ext_{(\Ugg,\Uhh)}^\bullet(k,V).
$$
:::

A "fun" exercise is then to prove that, for any Lie algebra pair $(\gg,\hh)$ and any $\gg$-module $M$,
$$
  \HH^\bullet(\gg,\hh;M^*) \simeq \HH_\bullet(\gg,\hh;M)^*.
$$