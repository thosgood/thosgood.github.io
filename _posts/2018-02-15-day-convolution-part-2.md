---
layout: post
title: Weighted limits, ends, and Day convolution
part: Part 2
category: "maths"
tags: "category-theory"
comments: true
---

_[See part 1 [here]({{ site.baseurl }}{% post_url 2017-12-08-day-convolution-part-1 %})]_

Using the idea of weighted limits, defined in the last post, we can now talk about **ends**.
The idea of an end is that, given some functor $F\colon \mathcal{C}^\mathrm{op}\times\mathcal{C}\to\mathcal{D}$, which we can think of as defining both a left and a right action on $\prod_{c\in\mathcal{C}}F(c,c)$, we wish to construct some sort of universal subobject[^1] where the two actions coincide.
Dually, a motivation behind the **coend** is in asking for some universal quotient of $\coprod_{c\in\mathcal{C}}F(c,c)$ that _forces_ the two actions to agree.

<!--more-->

**Edit:** If you actually want to learn this stuff then have a look at either of Emily Riehl's books ([Categorical Homotopy Theory](http://www.math.jhu.edu/~eriehl/cathtpy.pdf) and [Category Theory in Context](http://www.math.jhu.edu/~eriehl/context.pdf)).
I honestly don't think there is a better teaching of this anywhere else in the literature.

## Ends

### Definitions and settings

We can define ends in enriched categories in a pretty slick manner, and in not-necessarily-enriched categories in a still-not-too-messy way.

First, let $\mathcal{C}$ and $\mathcal{D}$ be $\mathcal{V}$-enriched categories (with $\mathcal{V}$ a closed symmetric monoidal category) and $F\colon \mathcal{C}^\mathrm{op}\times\mathcal{C}\to\mathcal{D}$ a $\mathcal{V}$-functor.
Then the **end** of $F$, written $\int_\mathcal{C} F$ is (_if it exists!_) the $\mathrm{Hom}_\mathcal{C}$-weighted limit of $F$:

$$\int_{c\in\mathcal{C}} F(c,c) := \mathrm{lim}^{\mathrm{Hom}_\mathcal{C}} F.$$

Dually, the **coend** of $F$, written $\int^\mathcal{C} F$, is

$$\int^{c\in\mathcal{C}} F(c,c) := \mathrm{colim}^{\mathrm{Hom}_{\mathcal{C}^\mathrm{op}}} F.$$

Alternatively now, suppose that we have some $F\colon \mathcal{C}^\mathrm{op}\times\mathcal{C}\to\mathcal{D}$ between not-necessarily-enriched categories.
We can still define the end by using **wedges**.
A **wedge** $e\colon w\to F$ is the data of an object $e\in\mathcal{D}$ and morphisms $e_c\colon w\to F(c,c)$ such that, for any $f\colon c\to c'$, the following diagram commutes:

$$\begin{array}{ccc}
w & \xrightarrow{e_{c'}} & F(c',c')\\
^{e_c}\Big\downarrow\,\,\,\, & & _{F(f,\mathrm{id})}\Big\downarrow\qquad\\
F(c,c) & \xrightarrow{F(\mathrm{id},f)} & F(c,c')
\end{array}$$

Then we can define the end as a _universal_ wedge $w$ (if it exists), i.e. any other wedge $w'$ factors uniquely through $w'\to w$

### Examples

I'm going to talk more about the exciting examples and applications of ends (tensor products of categories, geometric realisation, and Day convolution) in the next post in this series, but I would feel awful if I didn't mention at least a couple here.

One application of ends is in defining **natural transformations**, which shows how overarching the concept is.
It is pretty much a triviality (from the definitions)[^4] that

$$[\mathcal{C},\mathcal{D}](F,G) \cong \int_{c\in\mathcal{C}} \mathcal{D}\big(F(c),G(c)\big).$$

This is a nice way of saying it, because it means that we can get the enriched natural transformations of enriched functors "for free" by defining them in exactly this way.

Another nice example ([from the nLab](https://ncatlab.org/nlab/show/end#enriched_functor_categories)) is when we take $\mathcal{V}=\mathbb{R}_{\geqslant0}\cup\{\infty\}$, with the monoidal product given by addition.
Then a $\mathcal{V}$-enriched category is a metric space, and the hom objects tell us the distance between points.
Further, given two maps $f,g\colon X\to Y$ between two metric spaces, the distance between the maps is exactly the enriched functor-category[^5] (given by the end)

$$[X,Y](f,g) = \int _{x\in X} Y(f(x),g(x)) = \sup_{x\in X} Y(f(x),g(x)) = \sup_{x\in X} \|f(x),g(x)\|_Y.$$

Finally, for the moment, there is the example of **Kan extensions**.
If we have some $\mathcal{V}$-enriched category $\mathcal{D}$ that is tensored[^6] over $\mathcal{V}$, and some functors $F\colon\mathcal{C}\to\mathcal{D}$ and $p\colon\mathcal{C}\to\mathcal{B}$, then the **left Kan extension** of $F$ along $p$ is given by the coend:

$$\mathrm{Lan}F = \int^{c\in\mathcal{C}} \mathrm{Hom}(p(c),-)\odot F(c)$$

where $\odot$ is the co-power.

In particular then, we see that the generalisation of limits to weighted limits is 'at least as general as' the idea of Kan extensions.

## Manipulation and ninja Yoneda

It's often useful to know the following fact: *continuous functors preserve ends (and, dually, cocontinuous functors preserve coends)*.
In particular,

$$\begin{align*}
    \mathcal{D}\left( d,\int_\mathcal{C} F \right) &\cong \int_\mathcal{C} \mathcal{D}(d,F)\\
    \mathcal{D}\left( \int^\mathcal{C} F, d \right) &\cong \int_\mathcal{C} \mathcal{D}(F,d).
\end{align*}$$

We can also rephrase the Yoneda lemma[^3] in terms of ends, as well as finding a **co-Yoneda lemma**.[^2]
The Yoneda lemma (in the setting of $\mathcal{V}$-enriched categories) reads

$$[\mathcal{C}^\mathrm{op},\mathcal{V}](\mathcal{C}(-,c),F) \cong F(c)$$

and so can be rephrased as

$$F \cong \int_{c\in\mathcal{C}} \mathcal{C}(c,-)\otimes F(c)$$

whence we find the co-Yoneda lemma:

$$F \cong \int^{c\in\mathcal{C}} \mathcal{C}(-,c)\otimes F(c).$$

## Much better references

If you really want to read about ends then you my friend are in the wrong place.
Here are some papers and blog posts that I found interesting and really well written:

1. [This is the (co)end, my only (co)friend](https://arxiv.org/abs/1501.02503)
2. [Coends in conformal field theory](https://arxiv.org/abs/1604.01670)
3. [Ends](https://golem.ph.utexas.edu/category/2014/01/ends.html), on the the n-Category Café
4. [Ends and coends](https://bartoszmilewski.com/2017/03/29/ends-and-coends/), on Bartosz Milewski's Programming Cafe

---

# Footnotes

[^1]: A subobject of an object $y$ is a (class of isomorphisms of) monomorphism(s) into $y$.
[^2]: This presentation of the (co-)Yoneda lemma is [sometimes referred to](https://mathoverflow.net/a/20451) as the _ninja Yoneda lemma_.
[^3]: When phrased in terms of ends, this is sometimes called _Yoneda reduction_.
[^4]: One thing that I've learnt whilst reading about category theory, or even just modern maths in general, is that it is very tempting to _accept_ that something is a triviality without really thinking about _why_ it's trivial. Many a time have I thought that I knew that something was trivial only to fail to be able to explain it to somebody when asked. My new year's resolution is to always prove that trivialities are trivial.
[^5]: I'm not sure if this should be 'enriched functor-category' or 'enriched-functor category'. My first thought was the latter, because it's the category of enriched functors, but I suppose that it's clearer that our natural transformations are also enriched if we describe this as 'the functor category enriched over $\mathcal{V}$'. But then, I tend to overuse hyphens when there's more than one adjective, just to be extra safe.
[^6]: 'Tensor' is another name for 'co-power', i.e. a $\mathcal{V}$-category $\mathcal{E}$ is **tensored over $\mathcal{V}$** if all pairs of objects $(x,k)$, where $x\in\mathcal{E}$ and $k\in\mathcal{V}$, have a **co-power**: an object $k\odot x$ along with a natural isomorphism $\mathcal{C}(k\odot x, -) \cong \mathcal{V}(k, \mathcal{C}(x,-))$, where $\mathcal{V}(-,-)$ is the internal hom in $\mathcal{V}$.