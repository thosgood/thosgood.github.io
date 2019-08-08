---
layout: post
title: Loop spaces, spectra, and operads
part: Part 1
category: "maths"
tags: "category-theory spectra algebraic-topology operads"
comments: true
---

_[See part 2 [here]({{ site.baseurl }}{% post_url 2017-12-11-spectra-part-2 %}) and part 3 [here]({{ site.baseurl }}{% post_url 2018-03-12-spectra-part-3 %})]_

I have been reading recently about spectra and their use in defining cohomology theories. Something that came up quite a lot was the idea of **$E_\infty$-algebras**, which I knew roughly corresponded to some commutative version of $A_\infty$-algebras, but beyond that I knew nothing. After some enlightening discussions with one of my supervisors, I feel like I'm starting to see how the ideas of spectra, $E_\infty$-algebras, and operads all fit together. In an attempt to solidify this understanding and pinpoint any difficulties, I'm going to try to write up what I 'understand' so far.

<!--more-->

The rough idea is to study loop spaces and consider their 'generalisation' as homotopy pullbacks, then to define **spectrum objects** in stable $(\infty,1)$-categories.  We also consider why we can call $A_\infty$-algebras 'generalised loop spaces'.
Then we will have a look at the $E_\infty$ and $A_\infty$ operads and try to describe the algebras over them, before seeing how this is linked to the idea of **spectra** (spectrum objects in the category of topological spaces).

After this, I might do a series on the uses of spectra, like 'nice' cohomology theories in $(\infty,1)$-topoi, and 'brave new geometry' in the framework of Toën and Vezzosi's homotopical algebraic geometry.

_There probably won't be many references or pictures to begin with, but I will try to come back and add some at some point in the hopefully not-too-distant future._

## Loop spaces

### Classical approach

Given some topological space $X$, we have many good reasons to be interested in its fundamental group. That is, we are interested in what happens to **loops** (maps from $S^1$ to $X$) in our space when we consider everything up to homotopy. With this in mind, we define the **(pointed) loop space $\Omega(X,x)$ of $X$ at some point $x\in X$** as the mapping space

$$\Omega(X,x):=\mathrm{Map}_*\big(S^1,(X,x)\big)$$

which has a base point given by the constant map to $x$, and where we consider $S^1$ as a pointed space with some (fixed) base point $s\in S^1$ (e.g. embed $S^1$ into $\mathbb{R}^2$ and let $s=(1,0)$).

Now, by definition, we have an isomorphism of groups $\pi_0\Omega(X,x)\cong\pi_1(X,x)$, since elements of the latter are classes of homotopy-equivalent paths, which are the same as classes of points of the former, where we identify points if there is a path between them.
This suggestive isomorphism makes us wonder if there are 'higher' loop spaces $\Omega^i(X,x)$ such that $\pi_i(X,x)\cong\pi_0\Omega^i(X,x)$.
The answer is, as you would hope, yes.
In fact, we can just iterate loop spaces to obtain such objects: we define the **$i$-fold loop space** as

$$\Omega^i(X,x):=\Omega\big(\Omega^{i-1}(X,x)\big).$$

### Suspensions and smashing

This definition of higher loop spaces might be a tad surprising in so far as one might have expected 'higher loops' to be defined as maps from 'higher spheres', and thus to have defined the $i$-fold loop space as

$$\Omega^i(X,x):=\mathrm{Map}_*\big(S^i,(X,x)\big).$$

It is a beautiful convenience that these two proposed definitions agree, and the story goes as follows.

The category $\mathsf{Top}_*$ of pointed topological spaces admits the structure of a symmetric monoidal category,[^1] where the product is the **smash product**, given by

$$X\wedge Y:=\frac{X\times Y}{X\vee Y}$$

and where $X\vee Y$ is the **wedge sum**, given by identifying base points.
It would be tantamount to a crime to not put in any pictures here, so below are some examples.

**INSERT PICTURES**

In fact, $\mathsf{Top}\_\*$ is a *closed* symmetric monoidal category:[^2] we have the adjunction $(\wedge\dashv\mathsf{Top}_*)$, and thus the natural isomorphism

$$\mathsf{Top}_*(X\wedge Y, Z)\cong\mathsf{Top}_*(X,\mathsf{Top}_*(Y,Z)).$$

In particular then, taking $Y=S^1$, we see that

$$\mathsf{Top}_*(X\wedge S^1, Z)\cong\mathsf{Top}_*(X,\Omega(Z,z))$$

naturally in both $X$ and $Z$, so defining the **(reduced)[^3] suspension** of $X$ as $\Sigma X:=X\wedge S^1$ gives us an adjunction $(\Sigma\dashv\Omega)$.
But now we notice that _if we can show that $\Sigma S^i\simeq S^{i+1}$_ then

$$\mathsf{Top}_*(S^i,(X,x))\cong\mathsf{Top}_*(S^{i-1},\Omega(X,x))\cong\ldots\cong\mathsf{Top}_*(S^1,\Omega^i(X,x))$$

whence the two possible definitions of higher loop spaces agree.

We can actually prove a stronger statement: $S^i\wedge S^j\simeq S^{i+j}$.
To 'see' this, we consider $S^i$ as a cell complex with cells $e^0\sqcup e^i$.
Then

$$S^i\wedge S^j\simeq\frac{e^0\sqcup e^j\sqcup e^i\sqcup e^{i+j}}{e^0\sqcup e^i\sqcup e^j}\simeq e^0\sqcup e^{i+j}.$$

### Homotopy pullbacks

We claim that the loop space construction can also be described as the homotopy pullback of $X$ along the base point $x\colon*\to X$. That is, we want to realise

$$\begin{array}{ccc}
    A &\to &* \\
    \downarrow & \lrcorner&\downarrow \\
    * &\to &X
\end{array}$$

as the loop space $\Omega(X,x)$ we defined previously.
But now we use a 'simple' trick:[^4] replace the point with the contractible space $\\\{\gamma\colon[0,1]\to X \mid \gamma(0)=x\\\}$, and map this into $X$ by sending $\gamma$ to $\gamma(1)$. Then $A$ is exactly the space of maps $D^1\to X$ based at $x$ (i.e with $\gamma(0)=x$) such that $\gamma(1)=x$ as well, and this is exactly $\Omega(X,x)$.

Dually, the (reduced) suspension can be realised as the homotopy pushout

$$\begin{array}{ccc}
    X &\to &* \\
    \downarrow & \ulcorner&\downarrow \\
    * &\to &B
\end{array}$$

or, said in a different way,[^5] as the mapping cone of the terminal map $X\to *$.

### Sneak peek at $A_\infty$-algebras

In one of Stasheff's theses, in the 60s, he formalised the idea of algebras that behave 'like loop spaces' in that they have a multiplication structure that is only associative _up to some higher homotopies_. These are called **$A_\infty$-algebras**, and there are plenty of classic introductions to them in their own right. The 'most classic' is probably _[Keller, Bernhard (2001). Introduction to A-infinity algebras and modules](https://arxiv.org/abs/math/9910179)_, which also describes (in §2.2) what I'm going to briefly sketch out below (and will cover in more detail in the future): how loop spaces are 'almost associative algebras'.

Given two loops, $\gamma_1$ and $\gamma_2$ in $X$, we can define their 'product' $\gamma_1\cdot\gamma_2$ as their composition: we 'do/follow/trace out' the loop $\gamma_1$ followed immediately by the loop $\gamma_2$. Clearly we have some identity element under this product, as well as inverses, and associativity is 'obvious' because following the first loop then the second, and _then_ the third is the same as following the first, and _then_ the second and the third, right?

I mean, obviously here there is some caveat so that the actual answer is _no_, but I think that making this mistake is in some way a good thing, because it means that we're thinking homotopically without maybe even realising it.[^6] The problem with associativity comes from the fact that we have picked some model of $S^1$, namely $[0,1]$, and so our composed loops have to respect this. That is, we can't just define $\gamma_1\cdot\gamma_2$ as the obvious map $[0,2]\to X$; we have to scale the paths so that $\gamma_1\cdot\gamma_2\colon[0,1]\to X$. This is easy enough: we do $\gamma_1(t/2)$ for $0\leqslant t\leqslant\frac12$ and $\gamma_2((t+1)/2)$ for $\frac12\leqslant t\leqslant1$.
But the problem then arises that $(\gamma_1\cdot\gamma_2)\cdot\gamma_3\neq\gamma_1\cdot(\gamma_2\cdot\gamma_2)$ (this might be better explained in the pictures below), although they are clearly homotopic. Then, however, we have a similar problem when we want to look at $\gamma_1\cdot\gamma_2\cdot\gamma_3\cdot\gamma_4$, but now we have many[^7] ways of bracketing this. All possible ways will be homotopic, of course, but there is a lot of structure contained in this information of _how_ the different choices are homotopic, and if we can somehow remember all of this then maybe we will gain something from it.

**INSERT PICTURES**

---

# Footnotes

[^1]: Careful here: we need to be working with '[nice enough](https://ncatlab.org/nlab/show/convenient+category+of+topological+spaces)' spaces, otherwise this product [isn't associative (not even weakly)](https://mathoverflow.net/a/76594/73622).
[^2]: This needs proving, but I'm not gonna do that here because half of the fun of writing these posts is that I can just talk about the ideas themselves, and not repeat proofs that I don't want to have to type out. It's also nice to escape from the usual 'definition, theorem, proof' format. But for a proof of this particular claim see e.g. [the nLab](https://ncatlab.org/nlab/show/pointed+object#ClosedMonoidalStructure) (although they also refer elsewhere for a proof so I feel less bad for doing so).
[^3]: There is also the notion of a **non-reduced suspension**, but in a lot of cases these two constructions give objects that are weakly homotopic to one another.
[^4]: This trick will turn up again in a future part of this series, when we talk about the **little discs operad**.
[^5]: See [here](https://ncatlab.org/nlab/show/mapping+cone#idea) for a nice picture as well as some clever words
[^6]: You always have to find some positive way of saying 'I got that wrong'.
[^7]: Sometimes 5 can seem like a really big number.