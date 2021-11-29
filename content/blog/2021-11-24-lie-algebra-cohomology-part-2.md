---
title: The basics of Lie algebra cohomology
part: Part 2
kind: article
tags: ['lie-algebras', 'cohomology']
created_at: 2021-11-24
---

\providecommand{\ZZ}{\mathbb{Z}}
\providecommand{\CC}{\mathbb{C}}
\providecommand{\Hom}{\operatorname{Hom}}
\providecommand{\Ext}{\operatorname{Ext}}
\providecommand{\HH}{\operatorname{H}}
\providecommand{\gg}{\mathfrak{g}}
\providecommand{\hh}{\mathfrak{h}}
\providecommand{\nn}{\mathfrak{n}}
\providecommand{\CE}{\operatorname{CE}}
\providecommand{\SL}{\operatorname{SL}}
\providecommand{\sl}{\operatorname{\mathfrak{sl}}}
\providecommand{\dd}{\mathrm{d}}

\renewcommand{\geq}{\geqslant}
\renewcommand{\leq}{\leqslant}

Continuing on from last time, let's now take a look at some actual computational methods for Lie algebra cohomology, as well as some applications and important results.
We'll study the cohomology of semisimple Lie algebras, finite dimensional nilpotent Lie algebras, and then take a little detour to talk about the Borel--Weil--Bott theorem.

<!-- more -->


# Decompositions for computation

Explicitly calculating the Lie algebra cohomology for some specific $\gg$ and $M$ can be difficult, but there are some useful results (as is normally the case for (co)homology) that tell us how to split $\HH^\bullet(\gg,M)$ up into smaller parts if we know some sort of decomposition of $\gg$ or of $M$.
The idea is then to apply these decomposition results until we can reduce down to the case where e.g. $\gg$ is semisimple and $M$ is finite dimensional (since then we have very strict vanishing results, as we will see in the next section).

We first consider the case where we know how to decompose $M$.

::: {.itenv title="Lemma (Long exact sequence in cohomology)"}
Let
$$
  0\to M'\to M\to M''\to0
$$
be a short exact sequence of $\gg$-modules.
Then
$$
  \ldots \to \HH^{i-1}(\gg,M'') \to \HH^i(\gg,M') \to \HH^i(\gg,M) \to \HH^i(\gg,M'') \to \ldots
$$
is a long exact sequence.
:::

This is exactly the cohomology long exact sequence associated to a short exact sequence that we always expect any nice cohomology theory to give us.

We also have the following useful result for when we know how to decompose $\gg$.

::: {.itenv title="Theorem (Hochschild–Serre spectral sequence)"}
Let
$$
  0\to\gg'\to\gg\to\gg''\to0
$$
be a short exact sequence of Lie algebras, and let $M$ be a $\gg$-module.
Then there exists a spectral sequence $E_r^{p,q}$ such that

i. $E_1^{p,q}\cong\HH^p(\gg',\CE^q(\gg'',M))$
ii. $E_2^{p,q}\cong\HH^p(\gg'',\CE^q(\gg',M))$

and such that $E_r^{p,q}\Rightarrow\HH^\bullet(\gg,M)$.
:::

One final result, which is useful for studying the [Virasoro algebra](https://en.wikipedia.org/wiki/Virasoro_algebra) (arising as the unique $1$-dimensional central extension of the Lie algebra of vector fields on the circle), pertains to the case where $\gg$ has a *grading element*.

::: {.rmenv title="Definition"}
If there exists an element $e_0\in\gg$ such that
$$
  \gg \cong \bigoplus_{n\in\ZZ}\gg_n
$$
where
$$
  \gg_n \coloneqq \{x\in\gg \mid [e_0,x]=nx\}
$$
then we call $e_0$ a *grading element* of $\gg$.
:::

::: {.itenv title="Theorem"}
Suppose that $\gg$ has a grading element $e_0$.
Then all the cochain spaces $\CE^p(\gg,M)$ are graded, and the inclusion $\CE_0^\bullet(\gg,M)\hookrightarrow\CE^\bullet(\gg,M)$ induces an isomorphism in cohomology.
:::


# Semisimple and nilpotent Lie algebras

As mentioned above, the case where $\gg$ is semisimple (over $\CC$) and $M$ finite dimensional gives particularly nice vanishing results.

::: {.itenv title="Lemma (Whitehead's Lemmas)"}
Let $\gg$ be a complex semisimple Lie algebra, and $M$ a finite dimensional $\gg$-module.
Then

i. $\HH^1(\gg,M)=0$,
ii. $\HH^2(\gg,M)=0$.
:::

::: {.itenv title="Corollary (Weyl's Theorem)"}
Let $\gg$ be a semisimple Lie algebra over a field of characteristic $0$.
Then every finite dimensional $\gg$-module is semisimple.
:::

*Proof.*
For a contradiction, suppose that $M$ is not a direct sum of simple modules.
Since $\dim(M)$ is finite, there exists some submodule $M_1$ which is minimal with respect to this property.
In particular, $M_1$ is not simple, and thus contains a proper submodule $M_0$.
This submodule $M_0$ must be a direct sum of simple modules, otherwise it would contradict the minimality of $M_1$;
similarly, $M_2\coloneqq M_1/M_0$ must also be a direct sum of simple modules.
This means that the short exact sequence $0\to M_0\to M_1\to M_2\to0$ is not split (otherwise the semisimplicity of $M_0$ and $M_2$ would imply the semisimplicity of $M_1$), and so this gives a non-zero extension class in $\Ext_{U(\gg)}^1(M_2,M_0)$.
But then $\HH^1(\gg,\Hom_k(M_2,M_0))\cong\Ext_{U(\gg)}^1(M_2,M_0)$ is non-zero, which contradicts Whitehead's first lemma.

Whitehead's second lemma also gives us a classical result: *Levi's Theorem*, which states that every Lie algebra is a split extension of a semisimple algebra by a solvable algebra.
This follows from the fact that $\HH^2(\gg,M)$ classifies extensions of $\gg$ by $M$ with some specified action of $\gg$ on $M$, but we won't delve into this here.

The next obvious question, following Whitehead's lemmas, is *"what about the cohomology in degree $0$ and degrees $\geq3$?"*.
Happily, there are some nice results about this.
Firstly, if we can apply Whitehead's Lemmas, then the vanishing of $\HH^0$ ensures the vanishing of *all* cohomology, *as long as $M$ is semisimple*:

::: {.itenv title="Theorem"}
Let $\gg$ be a complex semisimple Lie algebra, and $M$ a finite dimensional $\gg$-module (so that Whitehead's Lemmas apply).
If $M$ (which must be semisimple, by Weyl's theorem) is such that $M^\gg=0$, then
$$
  \HH^i(\gg,M)=0
$$
for all $i\geq0$.
:::

This theorem holds more generally, for reductive Lie algebras over fields of characteristic zero, and finite-dimensional semisimple modules.
Indeed, Whitehead's lemmas *also* hold over arbitrary fields of characteristic zero, since semisimplicity is preserved by field extensions, as is cohomology, and so we can always pass to the algebraic closure.

In general, however, it is not the case that $\HH^3$ vanishes; indeed, we have the following result:

::: {.itenv title="Theorem"}
Let $\gg$ be a complex semisimple Lie algebra, and $M$ a (not necessarily finite dimensional) $\gg$-module.
Then
$$
  \HH^3(\gg,M)\cong\CC^s
$$
where $s$ is the number of simple factors of $M$ contained in $\gg$.
:::

(We can actually give a more constructive statement than the above: for each simple factor with Killing form $\langle-,-\rangle$, the $3$-cocycle $\langle[-,-],-\rangle$ generates the corresponding factor in $\CC^s$.)

As mentioned in the previous post, we are often interested in the case where $M=k$, and we can say something about this in the complex case as well, namely that the cohomology vanishes in all *even* degrees:

::: {.itenv title="Theorem"}
Let $\gg$ be a complex semisimple Lie algebra.
Then $\HH^\bullet(\gg,\CC)$ is an exterior algebra in odd generators.
:::

Contrary to the case of semisimple Lie algebras (which have "not much" cohomology), nilpotent Lie algebras have "a lot of" cohomology, even when finite dimensional, as evidenced by the following theorem:

::: {.itenv title="Theorem"}
Let $\gg$ be an $n$-dimensional nilpotent Lie algebra.
Then
$$
  \dim\HH^i(\gg,k)\geq2
$$
for all $i\in\{1,\ldots,n-1\}$.
:::

In fact, this suggests a conjecture:

::: {.itenv title="Conjecture (Halperin's total rank conjecture)"}
Let $\gg$ be an $n$-dimensional nilpotent Lie algebra.
Then
$$
  \sum_{i\in\mathbb{N}}\dim\HH^i(\gg,k)\geq2^{\dim Z(\gg)}
$$
where $Z(\gg)$ is the centre of $\gg$.
:::


# Kostant and Borel--Weil--Bott

As I mentioned in the first post in this series, the real context for me studying all this stuff is to better understand Kac--Moody algebras.
Two key notions in this area are that of *root decompositions* and *highest weight modules*, both of which I will now recklessly assume that we have prior knowledge of (if this isn't the case, then I highly recommend [Anton Hilado's blog](https://ahilado.wordpress.com/2021/06/12/reductive-groups-part-i-over-algebraically-closed-fields/) as a learning resource).

I'm only going to scratch the surface when talking about these two theorems, so if you want to learn more then I would turn to [Lurie's notes on the Borel--Weil-Bott Theorem](https://www.math.ias.edu/~lurie/papers/bwb.pdf) and [the UGA VIGRE Algebra Group's notes on Kostant's Theorem](https://faculty.math.illinois.edu/~mim2/KostantTheorem.pdf), both of which are thorough and include concrete calculations.

::: {.itenv title="Theorem (Kostant's Theorem)"}
Let $\gg$ be a semisimple Lie algebra, and $\gg=\nn_+\oplus\hh\oplus\nn_-$ a root decomposition.
Let $M$ be a finite dimensional, irreducible, highest weight $\gg$-module of highest weight $\lambda$.

Then each $\HH^i(\nn_+,M)$ splits (as a $\gg$-module) into a direct sum of $1$-dimensional modules of multiplicity $1$.
Further, the corresponding weights are exactly the elements of the form $w(\lambda+\rho)-\rho$, where $w$ is any element of the Weyl group of length $k$, and $\rho$ denotes the half sum of the positive roots.
:::

An nice application of this theorem is that it gives an algebraic proof of the [*Borel--Weil--Bott Theorem*](https://en.wikipedia.org/wiki/Borel%E2%80%93Weil%E2%80%93Bott_theorem).
We won't state (let alone prove) the theorem here, but simply content ourselves with saying that it somehow relates so-called *dominant weights* of semisimple complex Lie algebras with the sheaf cohomology of certain line bundles.
Or, to quote from [the Wikipedia article](https://en.wikipedia.org/wiki/Borel%E2%80%93Weil%E2%80%93Bott_theorem#Borel%E2%80%93Weil_theorem),

>The Borel--Weil theorem provides a concrete model for irreducible representations of compact Lie groups and irreducible holomorphic representations of complex semisimple Lie groups.
>These representations are realized in the spaces of global sections of holomorphic line bundles on the flag manifold of the group.
>The Borel--Weil--Bott theorem is its generalization to higher cohomology spaces.

To further add to the sense of mystery, we will vaguely discuss an example.
Let $G=\SL_2(\CC)$, which has the Borel subgroup consisting of upper-triangular matrices (of determinant $1$);
the flag variety $G/B$ is the Riemann sphere $\mathbb{P}_\CC^1$, and we write its coordinates as $x$ and $y$..
The integral weights of $G$ are exactly the integers $n\in\mathbb{Z}$, with *dominant* weights corresponding to *non-negative* integers.
Here are some observations that we can make, which happen to be those coming from the Borel--Weil Theorem:

- There exists a line bundle $L_n\coloneqq\mathscr{O}(n)$ on $G/B$ for each integral weight $n$.
- The line bundle $L_n$ has global sections if and only if $n$ is a dominant weight.
- When $n$ is a dominant weight (i.e. when $n\geq0$), the space $\Gamma(L_n)$ of global sections of $L_n$ is exactly the $(n+1)$-dimensional space of homogeneous polynomials of degree $n$ in $\CC[x,y]$.
- The global sections of $L_n$ (when $n$ is a dominant weight) form an irreducible representation of $G$ on $\CC[x,y]$, which is further a highest weight representation of highest weight $n$, with weight vectors $x^iy^{n-i}$ (for $0\leq i\leq n$) of weight $2i-n$, and highest weight vector $x^n$.

The Borel--Weil--Bott Theorem further explains the representation theory of $\gg=\sl_2(\CC)$, in that $\Gamma(L_1)=\Gamma(\mathscr{O}(1))$ corresponds to the standard representation, and $\Gamma(L_n)=\Gamma(\mathscr{O}(n))$ corresponds to the $n$-th symmetric power of the standard representation.
Explicitly, we can even write down a description of this standard action of the Lie algebra on $\CC[x,y]$ as follows: take the usual generators $X=\left(\begin{smallmatrix}0&1\\0&0\end{smallmatrix}\right)$, $Y=\left(\begin{smallmatrix}0&0\\1&0\end{smallmatrix}\right)$, and $H=\left(\begin{smallmatrix}1&0\\0&-1\end{smallmatrix}\right)$ of $\sl_2(\CC)$; then
$$
  \begin{aligned}
    X &\leadsto x\frac{\dd}{\dd y}
  \\Y &\leadsto y\frac{\dd}{\dd x}
  \\H &\leadsto x\frac{\dd}{\dd x} - y\frac{\dd}{\dd y}
  \end{aligned}
$$
(which could (but won't, today) lead us very neatly into a discussion on the [Jordan--Schwinger map](https://en.wikipedia.org/wiki/Jordan_map), and how we can understand quantum angular momentum via quantum harmonic oscillators).
