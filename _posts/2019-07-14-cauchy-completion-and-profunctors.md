---
layout: post
title: Cauchy completion and profunctors
category: "maths"
tags: "category-theory"
comments: true
---

An idea that came up in a few talks at CT2019 was that of 'spans whose left leg is a left adjoint'.
I managed (luckily) to get a chance to ask Mike Shulman a few questions about this, as well as post in [`#math.CT:matrix.org`](https://www.matrix.to/#/#math.CT:matrix.org).
What follows are some things that I learnt (mostly from \[BD86\]).

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

$$Q\circ P=\int^{d\in\mathcal{D}}P(d,-)\otimes Q(-,d)$$

(although we don't really care so much about this post).

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

**Theorem.** A profunctor $\mathbb{1}\nrightarrow\mathcal{C}$ is a functor (via Yoneda[^4]) if and only if it admits a right adjoint.
More generally, a profunctor $\mathcal{A}\nrightarrow\mathcal{C}$, for any small category $\mathcal{A}$, is a functor (via Yoneda) if and only if it admits a right adjoint.

**Proof.** \[Theorem 2, BD86\].

We will come back to this fact later.

## Cauchy completion

The _Cauchy completion_ of a (small) category $\mathcal{C}$ can be defined in many ways (as described in \[BD86\]), but we pick the following: the Cauchy completion of $\mathcal{C}$ is the full subcategory $\overline{\mathcal{C}}$ of $\hat{\mathcal{C}}:=\mathsf{Fun}(\mathcal{C}^{\text{op}},\mathsf{Set})$ spanned by _absolutely presentable_[^3] presheaves.

The idea of Cauchy completeness for a category is in some sense meant to mirror that of Cauchy completeness of real numbers: if we think of a metric space as a category enriched over (the poset of) non-negative real numbers, then we recover this analytic notion (see \[Example 3, BD86\]).

**Lemma.** A presheaf $\mathcal{F}\in\hat{\mathcal{C}}$ is absolutely presentable if and only if it admits a right adjoint.

**Proof.** \[Propositions 2 and 4, BD86\].

## Internal categories

Recall that \[Theorem 2, BD86\] tells us that the profunctors that are functors (via Yoneda) are exactly those that admit right adjoints (which, by \[Propositions 2 and 4, BD86\], are exactly those (in the case where $\mathcal{A}=\mathbb{1}$) that are in the Cauchy completion of $\mathcal{C}$).

Now for what motivated me to write this post: something I saw in [Bryce Clarke](https://twitter.com/8ryceClarke)'s talk [Internal lenses as monad morphisms](http://conferences.inf.ed.ac.uk/ct2019/slides/63.pdf) at CT2019.[^5]

Given some category $\mathcal{E}$ with pullbacks, we can define an _internal category of $\mathcal{E}$_ as a monad in the 2-category $\mathsf{Span}(\mathcal{E})$, but it is **not** the case that internal functors are just (colax) morphisms of monads: **we need to require that the 1-cell admits a right adjoint** (which reduces to asking that the left leg of the corresponding span is an identity/isomorphism).

This is now not so much of a surprising condition, since we've already seen that this left-adjoint condition is what ensures that profunctors are actually functors!

What happens then, we may well ask, if we don't ask for this condition?
We recover the idea of a **Mealy morphism**.[^6]

## References

- \[BD86\] [F. Borceux and D. Dejean. "Cauchy completion in category theory". Cahiers de Topologie et Géométrie Différentielle Catégoriques, Volume 27 (1986) no. 2, pp. 133-146.](http://www.numdam.org/article/CTGDC_1986__27_2_133_0.pdf)
- [J. Baez, _Bimodules Versus Spans_, n-Category Café](https://golem.ph.utexas.edu/category/2008/08/bimodules_versus_spans.html)
- [M. Shulman. _Framed bicategories and monoidal fibrations._ arXiv: 0706.1286v2 \[math.CT\].](https://arxiv.org/pdf/0706.1286.pdf)
- [R. Garner and M. Shulman. _Enriched categories as a free cocompletion._ arXiV: 1301.3191v2 \[math.CT\].](https://arxiv.org/pdf/1301.3191.pdf)

---

# Footnotes

[^1]: $x\cdot_{R^{\text{op}}}y:=y\cdot_R x$.
[^2]: To construct $\mathcal{C}^{\text{op}}$ we need $V$ to be braided; to be able to compose bimodules we need cocompleteness of $V$, with $\otimes$ cocontinuous in both arguments, etc.
[^3]: That is, preserves all (small) colimits.
[^4]: That is, of the form $F^\*$ for some functor $F\colon\mathcal{C}\to\mathcal{D}$.
[^5]: If you prefer more of an article-style thing to slides then take a look at the [pre-proceedings](http://www.cs.ox.ac.uk/ACT2019/preproceedings/Bryce%20Clarke.pdf) from ACT2019.
[^6]: Thanks again to Bryce Clarke for [answering this question](https://twitter.com/8ryceClarke/status/1150434205031161864).