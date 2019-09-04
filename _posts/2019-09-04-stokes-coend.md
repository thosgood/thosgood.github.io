---
title: Everything is Stokes'; everything is coend
layout: post
category: "blog"
tags: "category-theory"
comments: true
---

For category theorists, the idea that "everything is a Kan extension" is a familiar one, as is the slightly more abstract version "everything is a (co)end". For differential geometers, the idea that "everything is Stokes' theorem" is sort of the equivalent adage. In an entirely typical turn of events, it seems that these two seemingly unrelated aphorisms can be linked together, as I found out today on Twitter.

<!--more-->
---

Today, [`@ququ7`](https://twitter.com/ququ7) tweeted/twote/twut that, [a few years back, Tim Campion had told him how Stokes' theorem is a result about coends](https://twitter.com/ququ7/status/1169048827703287814). All I want to do here is share this great little snippet, but I won't be doing much more than just repeating exactly the contents of the above tweet, so you might as well just go check it out there!

Here's the idea. We look at $$\mathbb{N}$$ as a poset, the category $$\mathsf{Vect}_\mathbb{R}$$ of real-vector spaces, and fix some manifold $$X$$. Then we have two pretty standard functors.

Firstly, we have $$C^X:\mathbb{N}^\mathrm{op}\to\mathsf{Vect}_\mathbb{R}$$, which sends $$n\in\mathbb{N}$$ to the free vector space $$C_n=\langle\varphi\colon Y\to X\rangle_\mathbb{R}$$, where $$\varphi\colon Y\to X$$ are smooth maps from compact, $$n$$-dimensional, oriented manifolds $$Y$$ with boundary, and acts on morphisms by sending $$n\to n+1$$ to the map $$\partial\colon C_{n+1}\to C_n$$, given by taking the boundaries of our manifolds $$Y$$.

Secondly, there is the de Rham functor $$\Omega_X\colon\mathbb{N}\to\mathsf{Vect}_\mathbb{R}$$, which sends $$n\in\mathbb{N}$$ to the space $$\Omega_X^n$$ of smooth $$n$$-forms on $$X$$, and sends $$n\to n+1$$ to the exterior derivative $$\mathrm{d}\colon\Omega_X^n\to\Omega_X^{n+1}$$.

Now we use the usual tensor product on $$\mathsf{Vect}_\mathbb{R}$$ to get a functor

$$C^X\otimes\Omega_X\colon\mathbb{N}\times\mathbb{N}^\mathrm{op}\to\mathsf{Vect}_\mathbb{R}.$$

We claim that we can make $$C^X\otimes\Omega_X\to\mathbb{R}$$ into a **cowedge**, i.e. that, for all $$n\in\mathbb{N}$$, we can find morphisms $$w_n\colon C_n^X\otimes\Omega_X^n\to\mathbb{R}$$ such that, for any $$f\colon m\to n$$ (and here we can restrict to $$m\to m+1$$, since these are the morphisms in $$\mathbb{N}$$ that generate all the others (that aren't the identity)), the square

$$\begin{array}{ccc}
    C_{m+1}^X\otimes\Omega_X^m & \xrightarrow{\partial\,\otimes\,1} & C_m^X\otimes\Omega_X^m\\
    {\scriptstyle 1\,\otimes\,\mathrm{d}}\bigg\downarrow && \bigg\downarrow{\scriptstyle w_m}\\
    C_{m+1}^X\otimes\Omega_X^{m+1} & \xrightarrow{w_{m+1}} & \mathbb{R}
\end{array}$$

commutes.

The surprising fact, then, is that Stokes' theorem tells us that taking $$w_n$$ to be defined by

$$\int\colon(\varphi\colon Y\to X)\otimes\omega \mapsto \int_Y \varphi^*\omega$$

gives us exactly what we want. Indeed, Stokes' theorem (in some form) says that

$$\int_{\partial Z}\tau=\int_Z \mathrm{d}\tau$$

and, since pullbacks commute with $$\mathrm{d}$$, when we replace $$\tau$$ with $$\varphi^*\omega$$, we get that the above square commutes. Neat!

What is not entirely clear to me, however, is if this is really a fact about _coends_, since then we would need to show that this cowedge is universal. This is something for me to think about the next time I'm bored on the tram.

---

All in all, this is a bit similar to an abstract version of de Rham's theorem, which says that the above integration map (when we replace $$C_n$$ by _singular_ cochains) is a quasi-isomorphism, and the commuting square sort of encodes the fact that integration respects the differentials of the two complexes. (This is what [Daniel Litt](https://twitter.com/littmath) pointed out [in a reply](https://twitter.com/littmath/status/1169081052100530177)).

One other question that I do have is the following: is there something to be gained by writing $$C_X$$ as the functor represented by $$X$$, and using the coend version of the Yoneda lemma? I don't know, but would love to find out!