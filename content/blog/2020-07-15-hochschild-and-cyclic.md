---
title: Hochschild and cyclic homology (briefly)
kind: article
tags: ['algebraic-topology', 'homotopy-theory']
created_at: 2020-07-15
---

Once again I feel the urge to type something nice, but have nothing new of my own to share. I did recently find, however, some notes I once wrote after hearing the phrase "Hochschild homology" for what felt like the hundredth time, so I thought I'd share them here. They're not particularly enlightening, and I can't claim to add any insight, but I often use my own blog as a reference for definitions that I once knew but later forgot, so this will at least serve that purpose!

<!-- more -->

# Unmotivated definitions

There are a bunch of different definitions of the _Hochschild complex_ $C_\bullet(A,N)$ for a bimodule $N$ over a (commutative) algebra $A$. Let's have a look at them. Throughout, we make use of the _enveloping algebra_ $A^e$ of $A$, which is defined by $A^e=A\otimes A^\mathrm{op}$ (which makes it look a bit like the endomorphism algebra, but with $\mathrm{op}$ instead of duals). Useful to know is the fact that a bimodule over $A$ is exactly the same thing as a bimodule over $A^e$.

Note that, when we've defined the Hochschild complex $C_\bullet(A,N)$, we can define _Hochschild homology_ of an algebra $A$ as simply $$\mathrm{HH}_\bullet(A) = \mathrm{H}_\bullet(C_\bullet(A,A))$$ using the fact that $A$ is a bimodule over itself.

## Definition 1 (Bar complex)

We define $$C_\bullet(A,N)=N\otimes_{A^e}\mathrm{B}_\bullet A,$$ where $B_\bullet A$ is the _Bar construction_ applied to $A$. For nice details about what this means, I would probably pick up my copy of Emily Riehl's [Categorical Homotopy Theory](http://www.math.jhu.edu/~eriehl/cathtpy.pdf). Either way, we can then define the differential by the omnipresent formula $$\partial_n = \sum_{i=0}^n (-1)^i\mathrm{d}_i \colon C_n(A,N) \to C_{n-1}(A,n)$$ where, here, for $0\leqslant i<n$, $$\mathrm{d}_i\colon n\otimes a_1\otimes\ldots\otimes a_n \mapsto n\otimes a_1\otimes\ldots\otimes a_ia_{i+1}\otimes\ldots\otimes a_n$$ (so for $i=0$ we get $na_1\otimes a_2\otimes\ldots\otimes a_n$), and $$\mathrm{d}_n\colon n\otimes a_1\otimes\ldots\otimes a_n \mapsto na_n\otimes a_1\otimes\ldots\otimes a_{n-1}.$$

## Definition 2 (Tor)

If we already know about $\operatorname{Tor}$, then we can simply define $$C_\bullet(A,N) = \operatorname{Tor}_{A^e}^\bullet(N,A).$$

## Definition 3 (Infinity things)

Even cheekier is the definition using $(\infty,1)$-categories: $$C_\bullet(A,N) = N\otimes_{A^e} A,$$ where the tensor product is taken in the $(\infty,1)$-category of chain complexes.

# Some motivation

So why do we care? Well here's a nice fact that, for the moment, might still seem rather unmotivated.

**Fact.** Let $X$ be a simply connected topological space. Then $$\mathrm{H}^\bullet(\mathcal{L}X;\mathbb{R}) \simeq \mathrm{HH}_\bullet(C^\bullet(X;\mathbb{R})),$$ where $C^\bullet(X;\mathbb{R})$ is the (usual) singular cochain complex of $X$ with coefficients in $\mathbb{R}$, and $\mathcal{L}X$ is the free loop space of $X$.

Why do we care about this? Well, because of the de Rham theorem: on a smooth manifold, real cohomology is isomorphic to de Rham cohomology. This shows itself by the following lovely theorem:

**Jones' theorem.** Let $X$ be a simply connected smooth manifold. Then $$\mathrm{H}^\bullet(\mathcal{L}X;\mathbb{R}) \simeq \mathrm{HH}_\bullet(\Omega_X^\bullet).$$

(Another nice fact about Hochschild homology (that we also won't prove) is that $\mathrm{HH}_\bullet(k[G]) \simeq \mathrm{HH}_\bullet(\mathcal{L}\mathcal{B}G)$.)

OK, so this is all well and good, but can we something a bit more concrete? Yes, we can.

# Circles (and the free loop space)

If we want to realise the circle $S^1$ as the geometric realisation of a simplicial set, then we have to define some simplicial set $S_\bullet$ such that $S_0 = \{*\}$ and $S_1 = \{\tau\}$ with face maps $f_0(\tau)=f_1(\tau)=*$. That is, our $1$-simplex $\tau$ is being glued together at its two edges to make a circle.

But we also need to worry about degeneracies, e.g. $s_0(*)\in S_1$. Generally, in $S_n$ we have the elements $s_0^n(*)$ and $(s_{n-1}\circ\ldots\circ s_i\circ s_{i-2}\circ\ldots\circ s_0)(\tau)$ for $i=1,\ldots,n$ (and this, in fact, suffices, by the degeneracy relations). Thus $|S_n|=n+1$, and, in fact, $S_n\simeq\mathbb{Z}/(n+1)\mathbb{Z}$, where $s_0^n(*)\leftrightarrow0$ and $(s_{n-1}\circ\ldots\circ s_i\circ s_{i-2}\circ\ldots\circ s_0)(\tau)\leftrightarrow i$.

Now, the geometric realisation of the _cosimplicial_ space $\operatorname{Hom}(S_\bullet,X)$, for some topological space $X$, is $$\|\operatorname{Hom}(S_\bullet,X)\| = \operatorname{Hom}_\mathsf{cosimpTop}(\Delta^\bullet,\operatorname{Hom}(S_\bullet,X)).$$ But, if $X$ is simply connected, then $$\|\operatorname{Hom}(S_\bullet,X)\| \simeq \operatorname{Hom}_\mathsf{Top}(|S_\bullet|,X) = \mathcal{L}X$$ where the last equality can be taken as the _definition_ of the free loop space $\mathcal{L}X$ of $X$.

**Claim.** $C_\bullet(A,A) \simeq C_\bullet(S_\bullet\otimes A)$.

In the above, $C_\bullet$ on the right-hand side denotes the _Moore complex_ of a simplicial group: $C_n(G_\bullet) = \bigcap_{i=1}^n\operatorname{Ker}f_i^n$; $\partial_n= f_0^n\colon C_n(G_\bullet)\to C_{n-1}(G_\bullet)$, and $S_\bullet\otimes A$ is the simplicial group with $A$ in degree $0$, $A\otimes_k A$ in degree $1$, $A\otimes_k A\otimes_k A$ in degree $2$, and so on, and where the $(n+1)$ maps from $(S_\bullet\times A)_n$ to $(S_\bullet\times A)_{n-1}$ are given by applying the multiplication $\mu$ of $A$, but after first applying a cyclic permutation of the elements of the tensor product. So, for example, from $A\otimes A\otimes A$ to $A\otimes A$ we have three maps: $\operatorname{id}\otimes\mu$ and $\mu\otimes\operatorname{id}$, as well as $(\mu\otimes\operatorname{id})\circ\sigma_{(231)}$, where $\sigma_{(231)}$ is the cyclic permutation $(123)\mapsto(231)$.

# HKR

It would be remiss of me to not even mention the Hochschild-Kostant-Rosenberg theorem, so here we go: if $R$ is a nice enough $k$-algebra, then we have an isomorphism of graded $R$-algebras $$\Omega^\bullet(R/k)\simeq\mathrm{HH}_\bullet(R);$$ dually, there is an isomorphism between wedge products of derivations and Hochschild _cohomology_, $$\bigwedge_R^\bullet\operatorname{Der}(R,R)\simeq\mathrm{HH}^\bullet(R).$$

There we go, I've mentioned it.

# A glance at cyclic homology

Jones' theorem told us about the cohomology of the free loop space of $X$, bu can we say anything about the _cyclic_ loop space of $X$? This is the homotopy quotient $\mathcal{L}X/^hS^1$ by the [canonical action](https://ncatlab.org/nlab/show/free+loop+space+object#CircleAction) of $S^1$ on $\mathcal{L}X$. Then $$\mathrm{H}^\bullet(\mathcal{L}X/^hS^1)\simeq\mathrm{HC}_\bullet(C^\bullet(X))$$ where, again, $C^\bullet(X)$ is the complex of singular chains, and $\mathrm{HC}_\bullet$ is the _cyclic homology_. But how do we define cyclic homology?

Let $\lambda\colon C_n(A,A)\to C_n(A,A)$ be the automorphism of the Hochschild complex given by cyclic permutation (and a sign), i.e. $$\lambda\colon a_0\otimes a_1\otimes\ldots\otimes a \mapsto (-1)^n a_n\otimes a_0\otimes\ldots\otimes a_{n-1}.$$ Then we define the _cyclic homology complex_ $C_\bullet^\lambda(A,A)=C_\bullet(A,A)/\operatorname{Im}(\operatorname{id}-\lambda)$, and the _cyclic homology_ $\mathrm{HC}_\bullet(A)=\mathrm{H}_\bullet(C_\bullet^\lambda(A))$.
