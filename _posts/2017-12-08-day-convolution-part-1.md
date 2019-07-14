---
layout: post
title: Weighted limits, ends, and Day convolution
part: Part 1
category: "maths"
tags: "category-theory"
comments: true
---

A motto of category theory is that 'Kan extensions are everywhere'. As a
simplification of this, '(co)limits are in a lot of places'. By rephrasing
the definition of a limit we end up with something that looks invitingly
generalisable. This is how we can stumble across the idea of a
**weighted limit**. In this post I'm going to assume that you are already
convinced of the usefulness and omnipresence of limits and not talk too much
(if at all) about why they are interesting in their own right.

<!--more-->

**Edit:** If you actually want to learn this stuff then have a look at either of Emily Riehl's books ([Categorical Homotopy Theory](http://www.math.jhu.edu/~eriehl/cathtpy.pdf) and [Category Theory in Context](http://www.math.jhu.edu/~eriehl/context.pdf)).
I honestly don't think there is a better teaching of this anywhere else in the literature.

*This is the first in a series of notes that are basically summaries of various
pages on the nLab, along with a few other sources. There is nothing original
here, except any mistakes.*


## Motivation

We start by rephrasing what it means for an object to be the limit of a functor
in terms of representable presheaves.

### Part 1

Let $$F\colon I^\mathrm{op}\to\mathsf{Set}$$ be a presheaf on a small category
$$I$$. Then the limit of $$F$$ over $$I$$ is the hom-set

$$\lim_I F := [I,\mathsf{Set}] (\underline{\{*\}},F)$$

where $$[I,\mathsf{Set}]$$ is the functor category, and $$\underline{\{*\}}$$ is the
constant functor to a singleton set. Since the covariant hom functor commutes
with set-valued limits, we can use the Yoneda lemma, as always, to work with
$$\hat{Y}(\lim_I F) = \mathrm{Hom}_{\mathsf{Set}}(-,\lim_I F)$$ and see that

$$\mathrm{Hom}_{\mathsf{Set}}(S,\lim_I F) \cong \lim_I\mathrm{Hom}_{\mathsf{Set}}(S,F(-))$$

for any set $$S$$.

### Part 2

If we now find ourselves in the more general case of having a functor 
$$F\colon I^\mathrm{op}\to\mathcal{C}$$ for some arbitrary (small) category
$$\mathcal{C}$$ then we can use the above trick: we define the presheaf
$$\widehat{\lim}_I F$$ by using the set-valued limit above, i.e.

$$(\widehat{\lim}_I F)(c) \cong \hat{\mathcal{C}}(\hat{Y}(c), \widehat{\lim}_I F) := \lim_I\mathsf{Set}(\hat{Y}(c),F(-))$$

where $$\hat{\mathcal{C}}$$ is the presheaf category
$$[\mathcal{C}^\mathrm{op},\mathsf{Set}]$$, and we write $$\mathcal{D}(x,y)$$ to
mean $$\mathrm{Hom}_\mathcal{D}(x,y)$$. But by the definition of the limit given
at the start, this can be rewritten (''setting
$$F = \mathsf{Set}(\hat{Y}(c),F(-))$$'') as

$$(\widehat{\lim}_I F)(c) \cong \hat{I}\big(\underline{\{*\}},\mathsf{Set}(\hat{Y}(c),F(-))\big).$$

It can then be shown that the limit of $$F$$, as defined in any other classical
way, is exactly an object representing the presheaf $$\widehat{\lim}_I F$$, i.e.

$$\mathcal{C}(c, \lim_I F)\cong\hat{I}\big(\underline{\{*\}},\mathsf{Set}(\hat{Y}(c),F(-))\big)$$

## Generalisation

There are two things in the above that look interesting to try to
generalise:

1.  Consider something more complicated than terminal cones: replace
    $$\underline{\{*\}}$$ with some arbitrary functor $$W\in\hat{I}$$ (that will be
    called the **weight**);
2.  Work in $$\mathcal{V}$$-enriched categories rather than just
    $$\mathsf{Set}$$-enriched (i.e small) ones.

This leads to the following definition. Let $$\mathcal{C}$$ be a
$$\mathcal{V}$$-enriched category, and $$W\colon I^\mathrm{op}\to\mathcal{V}$$ and
$$F\colon I^\mathrm{op}\to\mathcal{C}$$ functors. The **$$W$$-weighted limit of $$F$$**
is (if it exists) an object $$\lim^W F\in\mathcal{C}$$ that represents (for
$$c\in\mathcal{C}$$) the functor

$$[I,\mathcal{V}]\big(W,\mathcal{C}(c,F(-))\big)\colon\mathcal{C}^\mathrm{op}\to\mathcal{V}.$$

In particular, if $$\mathcal{C}=\mathcal{V}$$ then you can show that
$$\lim^W F\cong [I,\mathcal{V}](W,F)$$.

_In the next post we'll have a look at *why* this generalisation is of
any interest, and how we can use it to define (co)ends._

