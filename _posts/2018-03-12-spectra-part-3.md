---
layout: post
title: Loop spaces, spectra, and operads
part: Part 3
category: "maths"
tags: "category-theory spectra algebraic-topology operads"
comments: true
---


_[See part 1 [here]({{ site.baseurl }}{% post_url 2017-12-08-spectra-part-1 %}) and part 2 [here]({{ site.baseurl }}{% post_url 2017-12-11-spectra-part-2 %})]_

This post is a weird one: it's not really aimed at any one audience, but is more of a dump of a bunch of information that I'm trying to process.

<!--more-->

Now would be a great time to talk about operads, but I really could not do a better job than [Tai-Danae Bradley](https://twitter.com/math3ma) has already done over at her [blog](http://www.math3ma.com) in the post _What is an Operad_, [part 1](http://www.math3ma.com/mathema/2017/10/23/what-is-an-operad-part-1) and [part 2](http://www.math3ma.com/mathema/2017/10/30/what-is-an-operad-part-2).
So throughout this post I'm going to assume that you've read this, and I'll freely reference bits of it without necessarily saying so.

One of the really important points that Tai-Danae makes is talking about the theorem by May that says that

1. $1$-fold loop spaces are (weakly homotopy) equivalent to algebras over the associahedra operad; and
2. $k$-fold loop spaces (for $k\geqslant2$) are (weakly homotopy) equivalent to algebras over the little $k$-cubes operad.

But as well as algebras over an operad, we also have the notion of **spaces** over an operad, where we obtain similar looking equivalences.
This idea is more in the language of **brave new algebra** – a phrase introduced by Waldhausen for topological spaces that have some algebraic structures up to coherent homotopies.
There is a paper, _Introduction to Algebra over "Brave New Rings"_, by R.M. Vogt (Rendiconti del Circolo Matematico di Palermo, Serie II, Suppl. 59 (1999) pp. 49-82) that is a really great read, if you keep in mind the proviso of slightly different approach: he often works with **non-$\Sigma$-operads**, which are operads without necessarily having the datum of an action by the symmetric group.
Just to save you from finding his exact definition, I paraphrase it here.

---

**Definition.** A **non-$\Sigma$-operad** is a $\mathsf{Top}$-enriched category $\mathcal{A}$ with objects in bijection with $\mathbb{N}=\{0,1,\ldots\}$, along with an associative continuous bifunctor $\oplus\colon\mathcal{A}\times\mathcal{A}\to\mathcal{A}$ given on objects by $m\oplus n=m+n$, and such that, for all $k$ and $n$, the morphism

$$\begin{align*}
    \coprod_{n=\Sigma r_i} \mathcal{A}(r_1,1)\times\ldots\times\mathcal{A}(r_k,1) &\to \mathcal{A}(n,k)\\
    (f_1,\ldots,f_k) &\mapsto f_1\oplus\ldots\oplus f_k
\end{align*}$$

is a homeomorphism.

There is also the technical assumption that $\mathrm{id}_1\in\mathcal{A}(1,1)$ is a closed fibration, which we will pass over.

---

&nbsp;

An important thing to note is how this corresponds to May's definition of an operad.
The property satisfied by $\oplus$ on coproducts means that $\mathcal{A}$ is actually uniquely determined by composition and the morphism spaces $\mathcal{A}(n,1)$ for $n\geqslant0$, which is the data that May uses to define (non-$\Sigma$-)operads.

The very first page of Vogt's paper has a beautiful 'dictionary' that I'll reproduce (in full, even though we won't talk about some of the more complicated rows) here, as well as adding another column with references to the places where Vogt proves these equivalences.

| classical algebra | ref. | brave new algebra | spectra |
| ----------------- | ---- | ----------------- | ------- |
| monoid | 4.3 | $A_\infty$-space | |
| group | 4.4 | loop space | |
| abelian monoid | 5.5 | $E_\infty$-space | |
| abelian group | 6.5, 7.5 | infinite loop space | $\mathbb{S}$-module spectrum |
| ring | | $A_\infty$-ring space | monoid in $\mathsf{Mod}_\mathbb{S}$ |
| commutative ring | | $E_\infty$-ring space | commutative monoid in $\mathsf{Mod}_\mathbb{S}$ |
| ground ring $\mathbb{Z}$ | | $E_\infty$-ring space $Q(S^0)$ | sphere spectrum $\mathbb{S}$ |
| tensor product $\otimes_\mathbb{Z}$ | | ? | smash product $\wedge_\mathbb{S}$ |
{:.bordered-table}

&nbsp;

Now, first of all, we need to define _what_ exactly e.g. an $A_\infty$-space is, which means we need to define two things:

1. the operad $\mathcal{A}_\infty$, and
2. the notion of a space over an operad.

For the second point, given some non-$\Sigma$-operad $\mathcal{A}$, we define an **$\mathcal{A}$-space** to be a continuous functor $X\colon\mathcal{B}\to\mathsf{Top}$ that sends $\oplus$ to $\times$.
In particular then, $X(n)=X(1)^n$, and so we often abuse notation and identify $X$ with the space $X(1)$.

For the first point, we let $\mathrm{Assoc}$ be the terminal non-$\Sigma$-operad, so that each $\mathrm{Assoc}(n,1)$ consists of just a single point which we will call {$\mu_n$}.
This forces the composition to satisfy

$$\mu_k\circ(\mu_{r_1}\oplus\ldots\oplus\mu_{r_k}) = \mu_{r_1+\ldots+r_k}.$$

It can be seen that an $\mathrm{Assoc}$-space is exactly a monoid (this is example 2.4 in Vogt).

---

**Definition.** Let $\mathcal{B}$ be a non-$\Sigma$-operad.
We say that it is an **$A_\infty$-operad** if the unique functor $\mathcal{B}\to\mathcal{A}_\infty$ is a homotopy equivalence of the underlying morphism spaces.
If this is the case, then we call a $\mathcal{B}$-space an **$A_\infty$-space**.

---

**Warning.** _What follows is nothing more than a sketch of an elephant by a blind man._

Again, there is an important note about names and notation.
What is commonly known as the **associative operad** $\mathrm{Assoc}$ is referred to as $\mathcal{A}$ in Vogt, and what is now called $\mathcal{A}\_\infty$ is called $\mathcal{W}\mathcal{A}$ in Vogt, because he constructs it as a 'homotopy universal $A_\infty$ operad' from taking some free operad and quotienting by certain relations (sections 2.6, 2.7).
In fact, there is the idea of [Boardman-Vogt resolution](https://ncatlab.org/nlab/show/Boardman-Vogt+resolution), which is a specific choice of cofibrant resolution of operads, and the associahedra operad gives such a resolution of $\mathrm{Assoc}$, i.e. a cofibrant replacement:

$$\mathcal{A}_\infty\to\mathrm{Assoc}.$$

As for the commutative case, section 3 of Vogt explains in detail how the little cubes operad (in one dimension) is an $A_\infty$-operad that acts on loop spaces.
This generalises in section 6 to showing that $n$-fold loop spaces can be acted on by the little $n$-cubes operad, and taking a suitable colimit we find that infinite loop spaces are acted on by some 'little $\infty$-cubes operad'.
That is, we define $E_n$ to be the little $n$-discs operad[^1], and $E_\infty$ to be the colimit of the $E_n$, which is weakly equivalent to the commutative operad $\mathrm{Comm}$.
As an interesting fact, we can see that $E_n$ is generally homotopically non-trivial (tiny picture below), but $E_\infty$ is contractible.

![Proof that $E_2(2)$ is homotopic to the circle](/assets/post-images/2018-3-12-spectra-part-3-E22.jpg){:class="img-responsive"}

&nbsp;

I haven't really talked much about spectra here, but the definition of an **infinite loop space** in Vogt is the same as the definition of an $\Omega$-spectrum in the previous post.
Vogt mentions (5.2) that if $X$ is an infinite loop space then $Y\mapsto[Y,X_n]^\bullet$ defines a cohomology theory, and that any cohomology theory arises in this way.
This all seems really nice, but I'm not entirely certain how complicated a proof of this is, or how trivial this statement is.