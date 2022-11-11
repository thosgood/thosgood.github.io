---
title: Simplicial Chern-Weil theory
kind: article
tags: ['category-theory', 'algebraic-geometry', 'simplicial-things']
created_at: 2020-03-29
---

This week just gone I uploaded two preprints to the arXiv:

1. [Simplicial Chern-Weil theory for coherent analytic sheaves, part I](https://arxiv.org/abs/2003.10023);
1. [Simplicial Chern-Weil theory for coherent analytic sheaves, part II](https://arxiv.org/abs/2003.10591).

Both have been extracted from my PhD thesis (which I've just sent off to the referees) and contain about 90% of the main mathematical content of my thesis, but with about 90% fewer inane footnotes and digressions.
There are also a few appendices in my thesis which explain the background of some of the subjects in a bit more detail, which I think are quite nice, but I'll probably turn the good ones into blog posts at some point in the coming months.

So what are these two papers about?
And why is it split into two parts?

<!-- more -->

# The main goal

In 1980, H.I. Green wrote their thesis ["Chern classes for coherent sheaves"](https://pugwash.lib.warwick.ac.uk/record=b1751746~S1), which, as the title so succinctly implies, gave a construction of Chern classes of coherent (analytic) sheaves.
What was special about this construction, however, was that it used simplicial methods to mirror the classical Chern-Weil construction of characteristic classes, which shouldn't really be possible, at a first glance.

As a brief recap, for anybody who doesn't know what some of these words mean:

- The idea of Chern-Weil theory is that you take a _[connection](https://en.wikipedia.org/wiki/Connection_(vector_bundle))_ on a vector bundle, calculate its curvature, and then take the trace, to end up with something that you can show really is a characteristic class.
- Connections are things from differential geometry and Lie theory that have a _lot_ of interpretations, so just go check out some other source to learn about these ([these notes](http://pi.math.cornell.edu/~goldberg/Notes/AboutConnections.pdf) are a really nice introduction).
- Characteristic classes are classes in cohomology that "describe" principal $G$-bundles, and common examples include Chern classes, Stiefel-Whitney classes, Pontryagin classes, and Euler classes (with each one corresponding to a certain choice of $G$, roughly). For homotopy/category theorists, the most familiar construction is probably that where you look at the generators of the cohomology of $BG$ and then pull them back along the unique map to $X$ corresponding to your principal $G$-bundle.
- Coherent sheaves are a type of particularly nice sheaf, and are somehow analogous to _finitely-generated_ modules. In general, algebraic geometers like to study a space $X$ by studying the category of sheaves on $X$, and coherent sheaves are some of the most well behaved. Another very nice type of sheaf is the _locally free_ sheaf, which is somehow equivalent to a vector bundle, or principal $\mathrm{GL}_n$-bundle.
- The distinction between coherent _analytic_ sheaves and coherent _algebraic_ sheaves is the distinction between our ringed spaces: _analytic_ geometry means we study a complex-analytic manifold with its $\mathbb{C}^n$-induced subspace topology, and look at holomorphic functions on it; _algebraic_ geometry means we study a complex-analytic manifold with the Zariski topology, and look at regular functions on it (and this is where the language of _schemes_ normally comes into play).

So the problem is that Chern-Weil theory doesn't really work in the setting that Green was interested in: holomorphic vector bundles on complex-analytic manifolds _rarely_ have holomorphic connections (in fact, the first Chern class is exactly the obstruction towards admitting a global holomorphic connection, and so the moment something has a non-zero first Chern class, we can't use this method to calculate the Chern classes!).
Even worse, coherent analytic sheaves do _not_, in general, admit resolutions by vector bundles (i.e. locally free sheaves), unlike coherent _algebraic_ sheaves, which always do admit such resolutions.

So there are two problems with trying to do Chern-Weil theory on coherent analytic sheaves:

1. global holomorphic connections rarely exist, and
2. coherent analytic sheaves are rarely resolved by locally free sheaves.

Green managed to solve both of these problems by using everybody's favourite abstraction of triangles: simplices!

# Part I and Part II

First of all: what have I actually done, except read Green's thesis many times over the last three-and-a-bit years?
Well, although Green gives a very explicit construction, he doesn't really say too much about why it works, or how to generalise it to get an abstract framework, and these are the two main points that I've tried to work on.

There are two papers because they have different goals: Part I aims to introduce some definitions about what a simplicial connection should really be, as well as proving that it satisfies a bunch of nice properties, and that Green's construction is a specific example of this slightly more abstract notion; Part II, on the other hand, is a lot more hands-on, and applies the abstract nonsense of Part I to show that Chern-Weil theory 'works', as well as showing some calculations (done 'manually', without Green's construction) that are proved to explicitly agree with what Green gives (but that also contain some extra data: they are lifts of closed elements in the de Rham complex (i.e. those which Green constructs) to closed elements in the Čech-de Rham bicomplex).

In a sense, Part I deals with the formalities of the construction, and Part II shows how it works on vector bundles, which, justified by some things in Part I, is enough to show us how it works for coherent analytic sheaves.

## Simplicial connections

Building simplicial connections is somehow quite easy, once you get past all the fiddly notation.
Indeed, they are basically connections on each simplicial degree of a locally free sheaf on the nerve that satisfy some sort of gluing condition.
Of course, we need to define what a 'locally free sheaf on the nerve' is, and we do that too — these things have previously been called _simplicial sheaves_, but since they are not simplicial objects in the category of sheaves (I mean, if they were to be anything, they would be _co_simplicial for a start), I was pretty careful to give them a less misleading (albeit much less catchy) name.

Then we can define some particularly nice families simplicial connections, namely _admissible_ simplicial connections.
These are defined so that we can apply ('generalised') invariant polynomials (such as the trace) to their curvatures and get something well defined.

Finally, there is an even nicer type of simplicial connection, which are those that are _generated in degree zero_.
We show that, for sufficiently nice complexes of locally free sheaves on the nerve, being generated in degree zero does indeed imply admissibility.
This is nice because simplicial connections that are generated in degree zero are really _so_ much nicer to work with than arbitrary admissible ones.

## Simplicial resolutions

Green used objects called _holomorphic twisting resolutions_, pioneered by Toledo and Tong, as well as one of his supervisors (O'Brian), to construct resolutions of coherent analytic sheaves by locally free sheaves on the nerve.
This can be seen almost as a strictification result: twisting cochains (the things that make up a twisting resolution) are the data of a bunch of homotopies that hold up to higher homotopies that themselves hold up to higher homotopies... and so on; what Green constructs from such a thing is actually a nice complex of 'simplicial sheaves' that satisfies a bunch of really useful properties.

What is shown in my thesis (and the Part I preprint) is that we can lift everything to the level of $(\infty,1)$-categories (presented here by relative categories and complete Segal spaces, following the work of Rezk and Barwick & Kan).
This is pretty fiddly work, since Green's construction is somehow not functorial, but we can get around this.
We also need to be super careful by what we mean when we say 'a complex of coherent sheaves', since, in the _algebraic_ world, this can mean one of two equivalent things: a (cochain) complex in the category of coherent sheaves, or a complex in the category of sheaves such that its internal cohomology (i.e. the cohomology of the cochain complex) consists of coherent sheaves.
In the analytic world, however, these two things are not necessarily equivalent: we know that they are in low dimensions, but have no general results (as far as I can tell).
Annoyingly, Green's construction works on complexes of actually coherent sheaves, but the category that is really of interest (even in the analytic world) is the category of complexes with coherent cohomology.
But we can get around this by using some clever argument found in Toën and Vezzosi's [HAG II](https://hal.archives-ouvertes.fr/hal-00772955/document), amongst other technical results.

In the end, we can construct an equivalence of $(\infty,1)$-categories that reassures us that, yes, indeed, coherent sheaves (meaning complexes with coherent cohomology) are indeed equivalent to sufficiently nice complexes of locally free sheaves on the nerve endowed with sufficiently nice simplicial connections, and so we really can apply Chern-Weil.

# The rest

There are some other results and points of view in my thesis that I'd like to talk about, but I figured that the shorter I keep this post, the more chance of people actually reading it!
Anyway, it's nice to take a break from this subject for a little while, and spend some time thinking about another side project...
