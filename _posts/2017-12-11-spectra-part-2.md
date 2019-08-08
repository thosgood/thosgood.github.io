---
layout: post
title: Loop spaces, spectra, and operads
part: Part 2
category: "maths"
tags: "category-theory spectra algebraic-topology operads"
comments: true
---

_[See part 1 [here]({{ site.baseurl }}{% post_url 2017-12-08-spectra-part-1 %}) and part 3 [here]({{ site.baseurl }}{% post_url 2018-03-12-spectra-part-3 %})]_

In the [previous post of this series]({{ site.baseurl }}{% post_url 2017-12-08-spectra-part-1 %}) I talked a bit about basic loop space stuff and how this gave birth to the idea of 'homotopically-associative algebras'. I'm going to detour slightly from what I was going to delve into next and speak about **delooping** for a bit first. Then I'll introduce **spectra** as sort of a generalisation of infinite deloopings. I'll probably leave the stuff about $E_\infty$-algebras for another post, but will definitely at least mention about how it ties in to all this stuff.

<!--more-->

As a warning: I am far (oh so very far) from being an expert in this stuff, so it's very possible that there are mistakes. If you spot any then please do give me a shout.

**Edit (21/04/18):** [this paper by Clark Barwick](http://www.maths.ed.ac.uk/~cbarwick/papers/salamanca.pdf) starts off with a really nice explanation of all this spectra/cohomology stuff.

## Delooping

### The basic idea

The basic idea of delooping is exactly what the name suggests: given some object $A$, if we can find another object $B$ such that $A\simeq\Omega B$ then we say that $B$ is the **delooping of $A$**. We often write $\mathbb{B}A$ or $\mathcal{B}A$ to mean the delooping, depending on the context ('groupoidal' or 'topological'), though these are, of course, linked.

As an important note, by looking at the homotopy pullback diagram of a delooping, we see that in some sense a delooping is the same as a suspension. We will come back to this later.

### Groupoids and nerves and geometric realisation

If $A$ is some topological group then we have (at least) two ways of describing it:

1. 'topological': we can study principal $A$-bundles, and then we have a classifying space $\mathcal{B}A\in\mathsf{Top}$;
2. 'groupoidal': we can consider $A$ as the one-object groupoid $\mathbb{B}A\in\infty\mathsf{Grpd}$ whose morphisms are given by $A$.

As the choice of notation suggests, these two 'associated objects' are (we claim) both deloopings of $A$ in the relevant category, and, in fact, under the [homotopy hypothesis](https://ncatlab.org/nlab/show/homotopy+hypothesis), these two are equivalent via geometric realisation (of the nerve):[^4]

$$\vert N(\mathbb{B}A)\vert\simeq\mathcal{B}A.$$

This is all closely linked to the [bar construction](https://ncatlab.org/nlab/show/bar+construction), but I'm still trying to get my head around the 'good' order in which to understand these things, so maybe I'll come back to this point in a future post.[^1]

Before going any further, we are actually going to look at a concrete example (something that I often forget to do when working in this more abstract setting).

### An example

Let $A$ be some group, _which we think of as a discrete groupoid_, and define $\mathbb{B}A$ to be the one-object groupoid with morphisms given by $A$, as above. We're going to show that this really _is_ a delooping of $A$, in that the homotopy square below homotopy-commutes and is homotopy-universal:

$$\begin{array}{ccc}
A &\to &*\\
\downarrow & &\downarrow\\
* &\to &\mathbb{B}A\tag{1}
\end{array}$$

Now the map $A\to *\to\mathbb{B}A$ is the constant functor $\Lambda$ to the single object of $\mathbb{B}A$, and there is a natural transformation $\eta$ from this functor to itself given by the identity. Let's unwrap what that says.

First of all, since $A$ is a discrete groupoid, the only morphisms are of the form $\mathrm{id}\colon x\to x$, so any natural transformation $\eta\colon\Lambda\implies\Lambda$ is composed of morphisms $\eta_x\colon\Lambda(x)\to\Lambda(x)$, for all $x\in A$, such that

$$\begin{array}{ccc}
\Lambda(x) &\xrightarrow{\Lambda(\mathrm{id})} &\Lambda(x)\\
\eta_x\downarrow & &\eta_x\downarrow\\
\Lambda(x) &\xrightarrow{\Lambda(\mathrm{id})} &\Lambda(x)
\end{array}$$

commutes. But by the definition of $\Lambda$, this just means that $\eta_x$ is any morphism in $\mathbb{B}A$, so we can pick the morphism $x$ (we're really just using that $\mathrm{Ob}(A)=\mathrm{Mor}(\mathbb{B}A)$).

Now we see that $\eta$ (defined by the identity) is, as one would hope, a natural isomorphism, which tells us that the square (1) commutes up to homotopy.[^2]

As for showing universality, we cheat:[^3] if we have some other $A'$ with a natural isomorphism $\eta'\colon\Lambda\implies\Lambda$ then it must map objects in $A'$ to isomorphisms (i.e. morphisms) in $\mathbb{B}A$. But say that it maps an object $x'$ in $A'$ to the morphism $x$ in $\mathbb{B}A$. Then we can factor through $A$ by sending the object $x'$ in $A'$ to the object $x$ in $A$.

### Infinite delooping

What we showed above is really that every _group_ has a delooping (at least, in the groupoidal sense). A natural question to pose now is, _can we always deloop things_? There is a theorem that states that, when working in the $(\infty,1)$-category of topological spaces, we can deloop a space whenever it is an $A_\infty$-space, and thus homotopy equivalent to loop space (in the classical sense).

As I'll 'explain' in a bit, if our category is a stable $(\infty,1)$-category then all deloopings exist and are given by suspension. Before I do this though, I'm going to give one important example of objects that are **infinitely-deloopable**, i.e. their deloopings can be delooped, and so can _their_ deloopings, and etc., so we have an infinite sequence of objects

$$A, \mathbb{B}A, \mathbb{B}^2A, \ldots.$$

### Singular cohomology and the associated infinite delooping

I claim that any _abelian_ group can be infinitely delooped by setting $\mathbb{B}^nA$ to be the ([strict omega](https://ncatlab.org/nlab/show/strict+omega-groupoid)) groupoid that has one object; only identity $k$-morphisms for $k\neq n$; and $\mathrm{Mor}_n(\mathbb{B}^nA)=A$. So we just take our usual construction of $\mathbb{B}A$ and 'shift the morphisms up in degree'.

Again, under the homotopy hypothesis, this sequence of deloopings maps to the sequence of [Eilenberg-Mac Lane spaces](https://ncatlab.org/nlab/show/Eilenberg-Mac+Lane+space):

$$\vert \mathbb{B}^nA\vert \simeq K(A,n).$$

This sequence 'is' (under the identification of connective spectra and strict abelian infinity-groups) the [Eilenberg-Mac Lane spectrum](https://ncatlab.org/nlab/show/Eilenberg-Mac+Lane+spectrum), whatever that might mean (considering that I've yet to even define spectra). Now comes the magic bit.

Let $X$ be a pointed topological space[^13] and $A$ an abelian group. It is a classical fact[^5] that the group $H^n(X,A)$ can be identified with $\pi\_0\mathsf{Top}\_*(X,K(A,n))$, and so the fact that $\vert\mathbb{B}^nA\vert \simeq K(A,n)$ tells us that we could just as well _define_ singular cohomology as

$$H^n(X,A) := \pi_0\mathbb{H}(X,\mathbb{B}^nA)$$

where $\mathbb{H}$ is some 'nice' category in which we have infinite deloopings of $A$, e.g. $\mathsf{Top}\_*$ or $\infty\mathsf{Groupoid}$. Even better, these two example choices of $\mathbb{H}$ give us homotopically equivalent objects, by the homotopy hypothesis.

This is really nice for many reasons, but one particularly nice one is that singular cohomology with coefficients in $A$ is _representable_, and it is pretty much represented exactly by $A$. There is a [theorem](https://ncatlab.org/nlab/show/Brown+representability+theorem) that tells us that, in particular, any sufficiently well-behaved cohomology theory is representable in this way.

## Spectra

So with all this talk around spectra, it's time to actually define them. Like many concepts, there are a bunch of different models and settings, and we're not going to explore most of them, but instead focus on **sequential pre-spectra** and **$\Omega$-spectra**.

### The setting (infinity categories)

First of all we work in $\mathsf{Top}\_*$ and keep our example of $K(A,n)$ in mind. Here, we define a **sequential pre-spectrum $\mathcal{E}$** to be a sequence $(\mathcal{E}\_n)\_{n\in\mathbb{N}}$ of pointed spaces, along with the data of **structure maps**, which are continuous maps $\Sigma \mathcal{E}\_n\to \mathcal{E}\_{n+1}$. Then, using the adjunction $(\Sigma\dashv\Omega)$, we can turn these structure maps into maps $\mathcal{E}\_n\to\Omega \mathcal{E}\_{n+1}$. If these are isomorphisms[^6] then we say that $\mathcal{E}$ is an **$\Omega$-spectrum**.

Our previous example of $\mathcal{E}\_n=K(A,n)$ then gives us an $\Omega$-spectrum. And we see that spectra can be viewed as a generalisation of infinitely-deloopable objects.

In the bigger picture, every sequential pre-spectrum has a **spectrification**, which is an equivalent $\Omega$-spectrum given by a [certain filtered colimit](https://ncatlab.org/nlab/show/spectrum#OmegaSpectrum), and these $\Omega$-spectra are exactly the fibrant replacements in some model structure.

Generally, we can define [$\Omega$-spectrum objects in any $(\infty,1)$-category](https://ncatlab.org/nlab/show/spectrum+object#via_spectrum_objects), but when people talk about 'spectra' with no reference to a specific category, it's usually implicit that they are working in $\mathsf{Top}\_*$ with weak homotopy equivalences.

But the 'honest' setting for spectra is in a **stable $(\infty,1)$-category**: pointed[^7] $(\infty,1)$-categories $\mathcal{C}$ with finite limits, where the loop $(\infty,1)$-functor $\Omega\colon\mathcal{C}\to\mathcal{C}$ is an _equivalence_, with the inverse given by suspension $\Sigma$. Given some not-necessarily-stable pointed $(\infty,1)$-category $\mathcal{C}$ with finite limits, we can form its **stabilisation** by taking the limit[^8] of iterating the loop space functor on the category of **pointed objects of $\mathcal{C}$**:

$$\mathsf{Stab}(\mathcal{C}) := \lim_{\leftarrow}\big(\ldots\to(*\downarrow\mathcal{C})\xrightarrow{\Omega}(*\downarrow\mathcal{C})\xrightarrow{\Omega}(*\downarrow\mathcal{C})\big).$$

The prototypical example of such a category is exactly what we've been looking at: _$\mathsf{Stab}(\mathsf{Top})$ is the category of $\Omega$-spectra in $\mathsf{Top}\_*$_. In general, we can construct $\mathsf{Stab}(\mathcal{C})$ [exactly by taking the category of spectrum objects](https://arxiv.org/abs/math/0608228) in $(*\downarrow\mathcal{C})$.

A really good introduction to all of this, and where I actually saw most of this for the first time, is [Moritz Groth's _A short course on $\infty$-categories_](https://arxiv.org/abs/1007.2925).

This is all understood much better when we bring operads into the picture. In the next post in this series I'll try to show how certain spectra are 'just commutative monoids', and that commutative monoids in an $(\infty,1)$-category are 'just $E_\infty$-algebras'.

### Nice properties

Before wrapping this post up, I'm just going to mention briefly something that always confused me about spectra that represent cohomology theories.

We can define 'cohomology' in any $(\infty,1)$-category $\mathbb{H}$ by just setting $H(X,A):=\pi_0\mathbb{H}(X,A)$, but if we want this to behave like 'usual' cohomology then we have to impose some restrictions. First of all, if we want our 'cocycles' to classify something (namely principal bundles over $X$) then we have to be working in an _$(\infty,1)$-topos_. Secondly, if we want to obtain a $\mathbb{Z}$-graded cohomology then the simplest way[^10] of doing so is to ask that our coefficient object $A$ be a _component of a spectrum object_, i.e. $A=\mathcal{E}\_n$ for some spectrum object $\mathcal{E}$. Thirdly, if we want our cohomology to have a group structure then we need[^11] $A$ to be a _group object_, which is always the case if $A$ is a component of a spectrum object.[^12] Note that this is abelian if $A$ is at least an $E\_2$-object. Finally, if we want a ring structure then we can ask that the spectrum object $\mathcal{E}$ of which $A$ is a component be an $E_\infty$-ring, or a _ring spectra_.

The point here is that, cohomology can be defined very generally, but if we want to recover something that we really recognise from it then we can basically restrict ourselves to looking at **ring spectra in an $(\infty,1)$-topos**.

## That 'classical fact'

A full and good proof (of the fact in question but also much more besides) can be found in Chapter 4.3 of [Hatcher's _Algebraic Topology_](https://www.math.cornell.edu/~hatcher/AT/AT.pdf). I'll be content here to give a small sketch, as found in e.g. [these lecture notes](http://math.mit.edu/~mbehrens/18.906/notes/lec15.pdf).

By the universal coefficient theorem, there is a short exact sequence

$$0\to \mathrm{Ext}^1_\mathbb{Z}(H_{n-1}(K(A,n),A)) \to H^n(K(A,n),A) \to \mathrm{Hom}_\mathbb{Z}(H_n(K(A,n),A),A) \to0.$$

Then, by the [Hurewicz theorem](https://en.wikipedia.org/wiki/Hurewicz_theorem), we have an isomorphism

$$H^n(K(A,n),A)\xrightarrow{\sim}\mathrm{Hom}_\mathbb{Z}(A,A).$$

Now take the class of $\mathrm{id}\_A$ in $\mathrm{Hom}\_\mathbb{Z}(A,A)$ and look at its image $[\iota\_n]$ in $H^n(K(A,n),A)$. This gives us a natural (in $X$) transformation

$$\begin{align*}
\eta_X\colon\pi_0\mathsf{Top}_*(X,K(A,n))&\to H^n(X,A)\\
[\gamma]&\mapsto \gamma^*([\iota_n])
\end{align*}$$

and we claim that it is a natural isomorphism when we restrict to the subcategory of pointed CW complexes.

**Edit:** This 'classical fact' is really an example of [Eckmann-Hilton duality](https://ncatlab.org/nlab/show/Eckmann-Hilton+duality).

---

# Footnotes

[^1]:  In fact, there's the important point that we can _prove_ that classifying spaces for principal $A$-bundles exist by showing exactly that $\vert N(\mathbb{B}A)\vert$ satisfies all the required properties.
[^2]: Maybe have a look [here](https://ncatlab.org/nlab/show/groupoid+object+in+an+(infinity%2C1)-category#Delooping).
[^3]: Really I'm cheating because this is all still a bit fuzzy for me, and pinning down the details is something that I'm still working on.
[^4]: The nerve functor is often omitted in notation and is implicitly considered as part of the geometric realisation.
[^5]: My use of this phrase almost always means 'everybody says it's true but doesn't give a proof so I guess it must be true', but I will actually discuss this proof at the end of the post because it is so integral to this whole discussion (and because it's not entirely obvious (at least, not to me)).
[^6]: Depending on the setting, this could mean homeomorphisms, or weak homotopy equivalences, or something similar.
[^7]: That is, it has a zero object.
[^8]: Really, taking the $(\infty,1)$-limit in the $(\infty,1)$-category of $(\infty,1)$-categories...
[^10]: I have no idea if this is the _only_ way though.
[^11]: Again, this is sufficient but I don't know if it's necessary.
[^12]: Since the loop space gives an equivalence between $0$-connected pointed objects and group objects (this is Lemma 7.2.2.11 (1) in [Higher Topos Theory](https://arxiv.org/abs/math/0608040)).
[^13]: Although for the following theorem to be true it really needs $X$ to be a e.g. CW complex.