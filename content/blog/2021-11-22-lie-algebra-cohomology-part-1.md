---
title: The basics of Lie algebra cohomology
part: Part 1
kind: article
tags: ['lie-algebras', 'cohomology']
created_at: 2021-11-22
---

\providecommand{\ZZ}{\mathbb{Z}}
\providecommand{\triv}{\mathrm{triv}}
\providecommand{\Inv}{\operatorname{Inv}}
\providecommand{\Hom}{\operatorname{Hom}}
\providecommand{\End}{\operatorname{End}}
\providecommand{\Ext}{\operatorname{Ext}}
\providecommand{\HH}{\operatorname{H}}
\providecommand{\gg}{\mathfrak{g}}
\providecommand{\Der}{\operatorname{Der}}
\providecommand{\PDer}{\operatorname{PDer}}
\providecommand{\CE}{\operatorname{CE}}

As part of a reading group I'm in on Kac--Moody groups (something I know nothing about), I had to give a talk introducing the basics of Lie algebra cohomology (something I know very little about), along with some sort of motivation and intuition, and some worked examples.
Since I've written these notes anyway, I figured I might as well put them up on this blog, and then, when I inevitably forget all I ever once knew, I can refer back to here.

<!-- more -->

The main two references that I consulted were Danny Cryster's ["Notes on Enveloping Algebras"](http://myslu.stlawu.edu/~dcrytser/EnvelopingAlgebrasNotes.pdf) and Friedrich Wagemann's ["Introduction to Lie algebra cohomology with a view towards BRST cohomology"](https://www.math.sciences.univ-nantes.fr/~wagemann/LAlecture.pdf).
Honestly, you'd maybe be better off just going and reading those two papers to be honest, since all I'm going to add here is some background on group cohomology, and then splice together the relevant parts of the two linked papers.
Anyway, let's get on with it.


# First motivation: group cohomology

Let $G$ be a group.
Unravelling definitions, we can see that a $\ZZ[G]$-module is exactly the same thing as an abelian group endowed with an action of $G$.
This equivalence gives us another way of thinking about *invariant elements*, i.e. elements of the group $\Inv_G(A)\coloneqq\{a\in A\mid ga=a \text{ for all } g\in G\}$.

::: {.itenv title="Lemma"}
$\Inv_G(A) \cong \Hom_{\mathbb{Z}[G]}(\mathbb{Z}^\triv,A)$.
:::

*Proof.* Given $\varphi\colon\ZZ^\triv\to A$, we obtain invariant elements, since $\varphi(n)=\varphi(gn)=g\varphi(n)$ for all $n\in\ZZ$; conversely, given $a\in\Inv_G(A)$, we can define $\varphi_a\colon1\mapsto a$.

This leads us to consider the *functor of invariants*
$$
  \Inv\coloneqq\Hom_{\ZZ[G]}(\ZZ^\triv,-)\colon \mathsf{Mod}_{\ZZ[G]}\to\mathsf{Mod}_{\ZZ}.
$$
But, as always, since this is a functor between categories of modules, we are interested in *deriving it*, and this is exactly the definition of group cohomology:
$$
  \HH^n(G,A) \coloneqq \Ext_{\ZZ[G]}^\bullet(\ZZ^\triv,-).
$$

To actually compute this, then, it suffices to find a projective resolution of $\ZZ^\triv$ as a $\ZZ[G]$-module, and there is a canonical way of doing this, via the so-called *bar construction*.

We define $B_0$ to be the $\ZZ[G]$-module $\ZZ[G]$;
for $n\geq1$, we define $B_n$ to be the free $\ZZ[G]$-module on the set $G^{\times(n+1)}$, and write its elements as symbols of the form $(g_0|\ldots|g_n)$ for $g_i\in G$.
Then we define $d_0\colon B_0\to\ZZ^\triv$ by
$$
  d_0\left(\sum_i m_i g_i\right) = \sum_i m_i
$$
and $d_n\colon B_n \to B_{n-1}$ by
$$
  \begin{aligned}
    d_n(g_0|\ldots|g_n) =
    \,\,&g_0(g_1|\ldots|g_n)
  \\+&\sum_{i=0}^{n-1} (-1)^i (g_0|\ldots|g_{i-1}|g_i g_{i+1}|g_{i+2}|\ldots|g_n)
  \\\pm&(g_0|\ldots|g_n).
  \end{aligned}
$$

Something that we won't discuss is that this complicated equation is actually somehow "natural", in that the bar construction is a "nice thing" that "makes sense".
For more on this (since it would require a large detour here), I highly recommend Emily Riehl's beautiful (and freely-available) book [_Categorical homotopy theory_](https://math.jhu.edu/~eriehl/cathtpy.pdf).

We can understand low-dimensional group cohomology quite explicitly:

- $\HH^0(G,A)=A^G\coloneqq\Inv_G(A)$.
- $\HH^1(G,A)$ is given by the quotient
    $$
      \{\varphi\colon\underline{G}\to\underline{A} \mid \varphi(gh)=\varphi(g)+g\varphi(h)\}\Big/\{\varphi=\varphi_a\colon g\mapsto ag-a\}
    $$
    where we write $\underline{G}$ to denote the underlying *set* of a group (note that this reduces to $\Hom(G,A)$ in the case where $A$ has the trivial $G$-action).
- $\HH^2(G,A)$ classifies isomorphism classes of extensions of $G$ by $A$ such that... some condition involving the action of $G$ on $A$ holds (note here the degree shift: $\HH^2(G,A)=\Ext_{\ZZ[G]}^2(G,A)$ is (some subset of) $\Ext_\ZZ^1(G,A)$; the $\Ext$ are in different degrees, but this is because they are taken in different categories).


# Generalising to Lie algebras

When we define Lie algebra cohomology, we're going to do something entirely analogous to what we did above for group cohomology.
Indeed, Lie algebras "are just" infinitesimal Lie groups, which "are just" particularly nice groups, so we can imagine carrying forward the definition for groups, making some suitable adjustments where necessary.
One thing to note is that, when we do the bar construction (which we will do later on), the differential will look more complicated, resembling some sort of total differential of a double complex, with the second part looking like some sort of "Čech differential".
This is because, whereas groups have "one structure" (the group operation), Lie algebras have "two" (the group operation *and* the Lie bracket).
But the story behind everything is exactly the same: *Lie algebra cohomology is the derived functor of the functor of invariants*.

Before giving any actual definitions, let's see what *will* be true (for a Lie algebra $\gg$ (over a field $k$) and a $\gg$-module $M$) in analogy to our low-dimensional statements for group cohomology:

- $\HH^0(\gg,M)=M^\gg$ is the group of $\gg$-invariants of $M$.
- $\HH^1(\gg,M)$ is given by [derivations](https://en.wikipedia.org/wiki/Lie_algebra#Derivations) $\Der(\gg,M)$ modulo *inner* derivations $\PDer(\gg,M)$, where
    $$
      \begin{aligned}
        \Der(\gg,M) &\coloneqq
        \{\varphi\in\Hom_k(\gg,M) \mid \varphi([x,y])=xf(y)-yf(x)\}
      \\\PDer(\gg,M) &\coloneqq
        \{\varphi\in\Hom_k(\gg,M) \mid \varphi=\varphi_m\colon x\mapsto xm\}
      \end{aligned}
    $$
    In particular, $\HH^1(\gg,\gg)$ (where $\gg$ acts on itself by the adjoint action) will be given by [*outer* derivations](https://en.wikipedia.org/wiki/Lie_algebra#Derivations) of $\gg$; the other "canonical" choice for $M$, namely $M=k^\triv$ (the analogy of $\ZZ^\triv$ from before), gives $\HH^1(\gg,k^\triv)=(\gg/[\gg,\gg])^*$.
- $\HH^2(\gg,M)$ classifies *abelian* (i.e. those such that the image of $M$ is abelian) [extensions of $\gg$ by $M$](https://en.wikipedia.org/wiki/Lie_algebra_extension) (again, $\Ext^2$ in the category of $\gg$-modules, but $\Ext^1$ in the category of Lie algebras).
- $\HH^3(\gg,M)$ classifies certain [*crossed modules*](https://ncatlab.org/nlab/show/differential+crossed+module).

Further, Lie algebra cohomology tells us not only *algebraic* information, but also *geometric* information:

::: {.itenv title="Cartan's Theorem"}
Let $G$ be a compact connected Lie group, and $\gg$ its Lie algebra.
Then
$$
  \HH_\mathrm{dR}^\bullet(G) \cong \HH^\bullet(\gg,\mathbb{R}) \cong \Inv_G(\wedge^\bullet\gg^*).
$$
:::


# The universal enveloping algebra and PBW

One key ingredient in giving a useful definition of Lie algebra cohomology is the *universal enveloping algebra* of a Lie algebra, so let's talk about this for a bit.

Any (associative) algebra $A$ has an "underlying" Lie algebra $A_-$, whose set of elements is the same, and is endowed with the Lie bracket defined by
$$
  [x,y] \coloneqq xy-yx.
$$
This gives us a "forgetful" functor
$$
  \begin{aligned}
    \mathsf{Alg} &\to \mathsf{LieAlg}
  \\A &\mapsto A_-
  \end{aligned}
$$
and so we can ask the natural question, _does this functor have a left adjoint?_
We will show that the answer to this question is "yes", by functorially constructing an algebra $U(\gg)$ such that $\gg$ sits inside $U(\gg)$, generating it as an algebra (**not** as a Lie algebra), in such a way that representations of $U(\gg)$ correspond to representations of $\gg$.

::: {.rmenv title="Definition"}
The *tensor algebra $T(\gg)$* is the algebra
$$
  T(\gg) \coloneqq \bigoplus_{n=0}^\infty \gg^{\otimes n}
$$
(where we take the tensor product of $\gg$ as a *vector space*).
:::

Note that, a priori, $x\otimes y-y\otimes x\neq[x,y]$.
In other words, the inclusion $\gg\hookrightarrow T(\gg)$ is *not* a Lie algebra homomorphism.

::: {.rmenv title="Definition"}
The *universal enveloping algebra $U(\gg)$* is the largest quotient algebra of $T(\gg)$ such that the composite
$$
  \gg \hookrightarrow T(\gg) \twoheadrightarrow U(\gg)
$$
is a Lie algebra homomorphism.
Constructively,
$$
  U(\gg) \coloneqq T(\gg)/(x\otimes y-y\otimes x-[x,y]).
$$
:::

Note that, if $\gg$ is abelian (i.e. if the bracket is zero), then $U(\gg)$ is exactly the symmetric algebra $\operatorname{Sym}(\gg)$.

::: {.itenv title="Lemma"}
The universal enveloping algebra construction is left adjoint to the underlying Lie algebra functor, i.e.
$$
  \Hom_\mathsf{Alg}(U(\gg),A) \cong \Hom_\mathsf{LieAlg}(\gg,A_-)
$$
functorially in $\gg$ and $A$.
:::

Another way of stating this universal property (and, indeed, the one that is found in a lot of introductory texts) is the following:

::: {.itenv title="Lemma"}
Let $\varphi\colon\gg\to A_-$ be a Lie algebra homomorphism.
Then there exists a unique algebra homomorphism $\widehat{\varphi}\colon U(\gg)\to A$ such that $\varphi=\widehat{\varphi}\circ h$, where $h\colon\gg\to U(\gg)$ is the canonical map.
:::

In particular, this implies (by taking $A=\End(M)$) that *every representation $M$ of $\gg$ extends uniquely to a representation of $U(\gg)$*.

One question we can ask now is if the map $h\colon\gg\to U(\gg)$ is somehow an embedding, and the (positive) answer to this is given by the following [important theorem](https://en.wikipedia.org/wiki/Universal_enveloping_algebra#Poincar%C3%A9%E2%80%93Birkhoff%E2%80%93Witt_theorem).

::: {.itenv title="Poincaré–Birkhoff–Witt Theorem"}
Let $(x_1,\ldots,x_n)$ be a vector space basis for $\gg$.
Then the ordered set of monomials
$$
  (x_1^{i_1}x_2^{i_2}\ldots x_n^{i_n} \mid (i_1,\ldots,i_n)\in\mathbb{N}^n)
$$
is a vector space basis for $U(\gg)$.
:::


# Actual definitions

I'm going to end this post by actually defining the thing that I've apparently been trying to explain this whole time: Lie algebra cohomology.

Firstly, analogously to how $\ZZ[G]$-modules are exactly abelian groups endowed with a $G$-action, we can interchangeably talk about *representations* and *modules* of a Lie algebra.

::: {.rmenv title="Definition"}
Let $\gg$ be a Lie algebra.
Then a *$\gg$-module $M$* is a vector space endowed with a $\gg$-action such that
$$
  [x,y]\cdot m = x\cdot(y\cdot m) - y\cdot(x\cdot m).
$$
Equivalently, we can require that the map
$$
  \begin{aligned}
    \gg &\to \End(\gg)
  \\x &\mapsto x\cdot(-)
  \end{aligned}
$$
induced by the $\gg$-action be a Lie algebra homomorphism.
:::

We mentioned right near the start of this post that Lie algebra cohomology was going to be defined as the derived functor of the functor of invariants.
Although this is technically true, it's not really very obvious with the specific definition that we're about to give, but we'll explain how they are equivalent afterwards.

::: {.rmenv title="Definition"}
The *Chevalley--Eilenberg complex $\CE^\bullet(\gg,M)$* is defined by
$$
  \CE(\gg,M)^p \coloneqq \Hom_k(\wedge^p\gg,M)
$$
(i.e. the set of $p$-linear alternating maps $\gg^{\times p}\to M$) with differential $d\colon\CE(\gg,M)^p\to\CE(\gg,M)^{p+1}$ given by
$$
  \begin{aligned}
    (dc)(x_1,\ldots,x_{p+1}) \coloneqq
    \,\,&\sum_{1\leq i<j\leq p+1} (-1)^{i+j}c([x_i,x_j],x_1,\ldots,\widehat{x_i},\ldots,\widehat{x_j},\ldots,x_{p+1})
  \\+&\sum_{i=1}^{p+1} (-1)^{i+1} x_i c(x_1,\ldots,\widehat{x_i},\ldots,x_{p+1}).
  \end{aligned}
$$
We then define the *Lie algebra cohomology of $\gg$* (*with coefficients in $M$*) to be the internal cohomology of this complex, i.e.
$$
  \HH^p(\gg,M) \coloneqq \operatorname{Z}^p(\gg,M)/\operatorname{B}^p(\gg,M)
$$
("the kernel of $d_p$ modulo the image of $d_{p-1}$").
:::

This Chevalley--Eilenberg complex deserves a whole blog post to itself, because there's a beautiful story about how it links to deformation theory and Maurer--Cartan elements, but to tell this we would need to pass to the more general theory of *differential graded Lie algebras*, which we don't have time for today, alas.

As a small side note, we don't assume $M$ to be finite dimensional, but we *do* require $\gg$ to be finite dimensional, otherwise the cohomology groups are just "too big" to be of much use.
In the case where $\gg$ *is* infinite dimensional, we can still get something useful if we have some sort of topological structure on $\gg$ and $M$, because we can replace the tensor product in the definition of $\wedge^p\gg$ with the *topological* tensor product $\otimes^\pi$, resulting in so-called [Gelfand--Fuks cohomology](https://en.wikipedia.org/wiki/Gelfand%E2%80%93Fuks_cohomology).
But we're not going to worry about that here!

Now let's finish up by asking how this definition recovers the idea of deriving the functor of invariants.
As we've already mentioned, the fact that the universal enveloping algebra construction is left adjoint to the underlying Lie algebra construction implies that *representations of $\gg$ give us representations of $U(\gg)$*;
the Poincaré--Birkhoff--Witt theorem gives us a converse to this, telling us that *representations of $U(\gg)$ give us representations of $\gg$* (since $\gg$ embeds into $U(\gg)$).
Using this, we can prove a result analogous to what we had for group cohomology, namely that
$$
  M^\gg \cong \Hom_{U(\gg)}(k^\triv,M).
$$
So, if we want to show that the derived functor of invariants is "the same" as the notion Lie algebra cohomology that we defined above, we need to show that
$$
  \Ext_{U(\gg)}^\bullet(k^\triv,M) \simeq \HH^\bullet(\Hom_k(\wedge^p\gg,M)).
$$
To do this, it would suffice to show that
$$
  \Hom_k(\wedge^p\gg,M) \cong \Hom_{U(\gg)}(P^\bullet,M)
$$
for some projective resolution $P^\bullet$ of $k^\triv$.
We won't give the details here, but this is indeed true, and comes from the projective resolution
$$
  U(\gg)\otimes_k\wedge^p\gg \twoheadrightarrow k^\triv
$$
where we choose some "clever" definition of differential for the complex $U(\gg)\otimes_k\wedge^p\gg$ (namely that of the [Koszul complex](https://en.wikipedia.org/wiki/Koszul_complex)).
