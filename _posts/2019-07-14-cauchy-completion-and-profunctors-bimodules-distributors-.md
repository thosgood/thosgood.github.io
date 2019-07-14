---
layout: post
title: Cauchy completion and profunctors
category: "maths"
tags: ""
comments: true
---

An idea that came up in a few talks at CT2019 was that of 'spans whose left leg is a left adjoint'.
I managed (luckily) to get a chance to ask Mike Shulman a few questions about this, as well as post in [`#math.CT:matrix.org`](https://www.matrix.to/#/#math.CT:matrix.org).
What follows are some things that I learnt, mostly from \[BD86\].

<!--more-->

## Bimodules

A good place to begin is with the definition of a _bimodule_.

### Classically

Given rings $R$ and $S$, we say that an abelian group $M$ is an _$(R,S)$-bimodule_ if it is a left $R$-module and a right $S$-module **in a compatible way**: we ask that $(rm)s=r(ms)$.

Thinking about this definition a bit (or maybe recalling an algebra class), we see that this is equivalent to asking that $M$ be a right module over $R^{\text{op}}\otimes_{\mathbb{Z}}S$ (or, equivalently, a left module over $R\otimes_{\mathbb{Z}}S^{\text{op}}$), where $R^{\text{op}}$ is the _opposite_ ring of $R$, given by just 'turning the multiplication around'.[^1]

### Categorically

Modulo a bunch of technical conditions on the categories involved,[^2] a _bimodule_ is a $\mathcal{V}$-functor (i.e. a functor of $\mathcal{V}$-enriched categories) $\mathcal{C}^{\text{op}}\otimes\mathcal{D}\to\mathcal{V}$.

We can recover the previous definition similar to how we can recover the definition of an $R$-module as an $\mathsf{Ab}$-enriched functor $R^{\text{op}}\to\mathsf{Ab}$. Or, taking $\mathcal{V}=\mathsf{Vect}$, and $\mathcal{C}=\mathbb{B}A$, $\mathcal{D}=\mathbb{B}B$, with $A$ and $B$ both vector spaces, we recover the notion of a vector space with a left $A$-action and a right $B$-action.

A fundamental example that seems a bit different from this algebraic one, however, arises when we take $\mathcal{V}=\mathsf{Set}$ and $\mathcal{C}=\mathcal{D}$ to be arbitrary (small) categories.
Then the hom functor $\mathcal{C}(-,-)\colon\mathcal{C}^{\text{op}}\times\mathcal{C}\to\mathsf{Set}$ is a bimodule.
This suggests that we should maybe somehow think of bimodules as generalised hom functors, where the objects can live in a different category.

As a small aside, there is some hot debate about whether to use $\mathcal{C}^{\text{op}}\otimes\mathcal{D}\to\mathcal{V}$ or $\mathcal{C}\otimes\mathcal{D}^{\text{op}}\to\mathcal{V}$, and although the first seems more natural (in that it corresponds to the way we write hom functors), the second is slightly nicer in that functors $\mathcal{C}\to\mathcal{D}$ give you profunctors by composition with the **covariant** Yoneda embedding, as opposed to the contravariant one.
But the two are formally dual, so it's really not the biggest of issues.

## Profunctors, distributors, bimodules, or whatever

Of course, lots of people have different preferences for names, but a _profunctor_ is (using the convention of Borceux and Dejean) a functor $\mathcal{D}^{\text{op}}\times\mathcal{C}\to\mathsf{Set}$.
People often write such a thing as $\mathcal{C}\nrightarrow\mathcal{D}$.
We can define their compositions via colimits or coends:

$$Q\circ P=\int^{d\in\mathcal{D}}P(d,-)\otimes Q(-,d).$$

### Yoneda

Every functor $F\colon\mathcal{C}\to\mathcal{D}$ gives a profunctor $F^*\colon\mathcal{C}\nrightarrow\mathcal{D}$ by setting

$$F^*(d,c) = \mathcal{D}(d,Fc),$$

and $F^\*$ has a right adjoint $F_*\colon\mathcal{D}\nrightarrow\mathcal{C}$ given by

$$F_*(c,d) = \mathcal{D}(Fc,d),$$

where we define adjunctions of profunctors using the classical notion of natural transformations.

If we write $\mathbb{1}$ to mean the category with one object and one (identity) (endo)morphism then any (small) category $\mathcal{C}$ can be identified with the functor category $\mathsf{Fun}(\mathbb{1},\mathcal{C})$, and the presheaf category $\hat{\mathcal{C}}:=\mathsf{Fun}(\mathcal{C}^{\text{op}},\mathsf{Set})$ is just the category $\mathsf{Profun}(\mathbb{1},\mathcal{C})$.
Then the Yoneda embedding is the inclusion

$$\mathsf{Fun}(\mathbb{1},\mathcal{C})\to\mathsf{Profun}(\mathbb{1},\mathcal{C})$$

given by $F\mapsto F^\*$.

### Recovering functors

**Lemma.** A presheaf $\mathcal{F}\in\hat{\mathcal{C}}$ is _absolutely presentable_[^3] if and only if it admits a right adjoint.

**Proof.** \[Propositions 2 and 4, BD86\].

**Theorem.** A profunctor $\mathbb{1}\to\mathcal{C}$ admits a right adjoint if and only if it is of the form $F^\*$ for some functor $F\colon\mathcal{C}\to\mathcal{D}$.

**Proof.** \[Theorem 2, BD86\].

That is, a profunctor 'is a functor' if and only if it admits a right adjoint.
This is a fact that we will come back to later.

## Cauchy completion

## Internal categories

Recall that \[Theorem 2, BD86\] tells us that the profunctors that are functors (via Yoneda) are exactly those that admit right adjoints.

## References

- \[BD86\] [Borceux, Francis; Dejean, Dominique. "Cauchy completion in category theory". Cahiers de Topologie et Géométrie Différentielle Catégoriques, Volume 27 (1986) no. 2, pp. 133-146.](http://www.numdam.org/article/CTGDC_1986__27_2_133_0.pdf)
- [John Baez, _Bimodules Versus Spans_, n-Category Café](https://golem.ph.utexas.edu/category/2008/08/bimodules_versus_spans.html)

---

# Footnotes

[^1]: $x\cdot_{R^{\text{op}}}y:=y\cdot_R x$.
[^2]: To construct $\mathcal{C}^{\text{op}}$ we need $V$ to be braided; to be able to compose bimodules we need cocompleteness of $V$, with $\otimes$ cocontinuous in both arguments, etc.
[^3]: That is, preserves all (small) colimits.