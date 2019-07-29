---
title: Graded homotopy structures
layout: post
category: "maths"
tags: "homotopy-theory category-theory questions"
comments: true
---

As I mentioned in [the previous post]({{ site.baseurl }}{% post_url 2019-07-26-twisting-cochains-and-twisted-complexes %}), I recently saw a talk by [Rachel Hardeman](http://math.ucalgary.ca/math_unitis/profiles/1-7046986) on the A-homotopy theory of graphs, and it really intrigued me. In particular, it seemed to me that there was some nice structure that could be abstractified: that of a "graded homotopy structure", as I've been calling it in my head. Rather than trying to type out everything in [`#math.CT:matrix.org`](https://www.matrix.to/#/#math.CT:matrix.org), I've decided to post it here, in the hope that I might be able to get some answers.

<!--more-->

The main reference is \[RH19\] Rachel Hardeman. _Computing A-homotopy groups using coverings and lifting properties_. [arXiv: 1904.12065](https://arxiv.org/abs/1904.12065).

### Preliminaries

- Graphs $G$ consist of _vertices_ $V(G)$ and _edges_ $E(G)$, where we write the edge between vertices $s$ and $t$ as $[s,t]$. All graphs are assumed to be _simple_ (no multiple edges between any two points or loops on a single point) and have a _distinguished vertex_ $x\in V(G)$. We write $(G,x)$ to mean the graph along with its distinguished vertex.
- A _(weak) graph homomorphism_ $\varphi\colon (G,x)\to(H,y)$ is a map of sets $V(G)\to V(H)$ such that, for all $[s,t]\in E(G)$, either $\varphi(s)=\varphi(t)$ or $[\varphi(s),\varphi(t)]\in E(H)$. It is said to be _based_ if $\varphi(x)=y$.
- The _cartesian product_ $G\mathbin{\square} H$ of the graphs $(G,x)$ and $(H,y)$ is the graph with vertex set $V(G)\times V(H)$, with distinguished vertex $(x,y)$, and with an edge between $(s,u)$ and $(t,v)$ whenever
    + $s=t$ and $[u,v]\in E(H)$; or
    + $u=v$ and $[s,t]\in E(G)$.
- The _path of length $n$_, denoted by $I_n$, is the graph with vertices labelled from $0$ to $n\in\mathbb{N}$, and edges $[i,i+1]$ for $i=0,\ldots,n-1$. The _path of infinite length_, denoted by $I_\infty$, has vertices labelled by $\mathbb{Z}$.
- We say that two graphs homomorphisms $\varphi,\psi\colon(G,x)\to(H,y)$ are _A-homotopic_, written $\varphi\simeq_A\psi$, if there exists some $n\in\mathbb{N}$ and a graph homomorphism $h\colon G\mathbin{\square} I_n\to H$ such that
    + $h(s,0) = \varphi(s)$ for all $s\in V(G)$;
    + $h(s,n) = \psi(s)$ for all $s\in V(G)$; and
    + $h(x,i)=y$ for all $0\leqslant i\leqslant n$.
    
    We say that two graphs $G$ and $H$ are _A-homotopic_ if there exist graph homomorphisms $\varphi\colon G\to H$ and $\psi\colon H\to G$ such that $\psi\circ\varphi\simeq_A\operatorname{id}_G$ and $\varphi\circ\psi\simeq_A\operatorname{id}_H$.
- **N.B.** A-homotopy theory is possibly very different from what you might, at a quick first glance, expect. For example, any two cyclic graphs $C_n$ and $C_m$ (for $m,n\geqslant 3$) are A-homotopic if and only if $m=n$, and $C_n$ is contractible (i.e. homotopic to the graph with a single point and no edges) for $n=3,4$, but not for any $n\geqslant 5$.
- The _A-homotopic fundamental group_ of a graph can be defined, as well as a simplicial structure on the group of cochains, and all this sort of stuff. This (amongst other nice formalisations that we would hope for) is done in \[RH19\].

### "Graded homotopy" structure

Given two A-homotopic graph homomorphisms $\varphi\simeq_A\psi$ we can ask for the _minimal_ such $n\in\mathbb{N}$ in the definition of the A-homotopy. We then say that the A-homotopy is an _$n$-homotopy_, and we extend this definition slightly to allow for the fact that we can trivially consider an $n$-homotopy as an $(n+1)$-homotopy (in $n+1$ various ways, corresponding to the classical idea of simplicial (co)face/(co)degeneracy (depending on your choice of nomenclature) maps). That is, we say $n$-homotopic to mean "$m$-homotopic with $m\leqslant n$".

We say that two graphs $G,H$ are _$n$-homotopic_ if there exist graph homomorphisms $\varphi\colon G\to H$ and $\psi\colon H\to G$ such that $\psi\circ\varphi$ is $m_1$-homotopic to $\operatorname{id}_G$ and $\varphi\circ\psi$ is $m_2$-homotopic to $\operatorname{id}_H$, with $\operatorname{max}\{m_1,m_2\}=n$.

Then we can consider the category $\mathsf{Grph}_n$, which has objects being equivalence classes of $n$-homotopic graphs, and morphisms being equivalence classes of $n$-homotopic graph homomorphisms. This gives us the following structure:

- $\mathsf{Grph}\_0 = \mathsf{Grph}$;
- $\mathsf{Grph}\_\infty = \mathrm{Ho}(\mathsf{Grph})$;
- functors $\mathsf{Grph}\_n \to \mathsf{Grph}\_{n+1}$ that are surjective on objects, where functoriality relies on the fact that $n$-homotopies can be considered as $(n+1)$-homotopies.

We can think of the number $n$ as some sort of "complexity" of the homotopy: small $n$ correspond to "homotopies that can be performed in a few steps" (here it is a good idea to see some of the examples in \[RH19\] to get an idea of how graph homotopies behave).

### Questions

If anybody has any answers to, or comments about, the following questions (or this post in general) then please don't hesitate to get in touch!

1. What is this structure? Some sort of enrichment? Does it already have a name?
2. What other examples exist? For example, it would be nice to get something similar for the category of chain complexes of an abelian category, but I see no way a priori of assigning "complexity" to a homotopy for an arbitrary choice of abelian category. If things are enriched over metric spaces, however, then this is a different story...
3. It seems believable that we could define something analogous with $\mathbb{R}^{\geqslant0}$ instead of $\mathbb{N}$. Could we do so for arbitrary (bounded-below) posets?
4. Does this tie in to the idea of "approximate composition" (c.f. [Walter Tholen's talk on metagories at ACT2019](http://www.cs.ox.ac.uk/ACT2019/preproceedings/Walter%20Tholen%20Approximate%20composition%20(revised).pdf)).
