---
title: Torsors and principal bundles
layout: post
category: "maths"
tags: "algebraic-topology"
comments: true
excerpt: "I haven't posted anything in forever, and one of my supervisor's strong pedagogical beliefs is that 'affine vector spaces should be understood as $G$-torsors, where $G$ is the underlying vector space acting via translation', which makes a nice short topic of discussion, whence this post."
---

In my thesis, switching between vector bundles and principal $\mathrm{GL}\_r$-bundles has often made certain problems easier (or harder) to understand.
Due to my innate fear of all things differentially geometric, I often prefer working with principal bundles, and since reading Stephen Sontz's (absolutely fantastic) book [Principal Bundles — The Classical Case](https://www.springer.com/fr/book/9783319147642), I've really grown quite fond of bundles, especially when you start talking about all the lovely $\mathbb{B}G$ and $\mathbb{E}G$ things therein[^1][^3].
Point is, I haven't posted anything in forever, and one of my supervisor's strong pedagogical beliefs is that _'affine vector spaces should be understood as $G$-torsors, where $G$ is the underlying vector space acting via translation'_,[^4] which makes a nice short topic of discussion, whence this post.

<!--more-->

We briefly[^2] recall the definition of a principal $G$-bundle over a space $X$, where $G$ is some _topological_ group.

**Definition.** A _principal $G$-bundle over $X$_ is a fibre bundle $P\xrightarrow{\pi}X$ with a continuous right action $P\times G\to P$ such that

1. $G$ acts _freely_;
2. $G$ acts _transitively_ on the orbits; and
3. $G$ acts _properly_.

It is maybe helpful to think of the following 'dictionary':

+ free = injective (i.e. $\exists x$ s.t. $gx=hx\implies g=h$)
+ transitively = surjective (i.e. $\forall x,y$ $\exists g$ s.t. $gx=y$)
+ properly = something that you care about if you care about infinite sequences or Hausdorffness or things like that (i.e. the inverse image of $G\times X\to X\times X$ given by $(g,x)\mapsto(gx,x)$ preserves compactness)

Thus the fibres $F$ are homeomorphic to $G$, and also give the orbits, and the orbit space $P/G$ is homeomorphic to $X$.

Another definition is now useful.

**Definition.** A _$G$-torsor_ is a space upon which $G$ acts _freely_ and _transitively_.

**Motto.** $G$-torsors _are_ principal $G$-bundles over a point _are_ affine versions of $G$.

What do we mean by this last 'equivalence'?
Just that $G$-torsors retain all the structure of $G$, but don't have some specified point that acts as the identity.
Here are some nice examples.

+ $\mathrm{GL}\_r$-torsors are vector spaces; $\mathrm{GL}\_r$-bundles are vector bundles.
+ $O(r)$-torsors are vector spaces with an inner product.
+ $\mathrm{GL}\_r^+$-torsors are oriented vector spaces (where $\mathrm{GL}\_r^+$ is the connected component of $\mathrm{GL}\_r$ consisting of matrices with determinant strictly positive).
+ $\mathrm{SL}\_r$-torsors are vector spaces with a specified isomorphism $\det V\xrightarrow{\sim} k$, where $\det V:=\wedge\_{i=1}^r V$, and $k$ is our base field. Note that this is weaker than a choice of basis: it is a choice of an $\mathrm{SL}\_r$-conjugacy class of bases.

---

# Footnotes

[^1]: About which I recently had a nice little Twitter conversation with [John Baez](https://twitter.com/johncarlosbaez); his replies starting [here](https://twitter.com/johncarlosbaez/status/1056999200125157376) are really quite nice. P.S. if you are not on Twitter then I would highly recommend it: the maths community is really friendly and interesting, and if you have a little question to ask then chances are you'll get a bunch of nice responses. Also a chance to talk to people across the globe in a completely different time zone. Don't get me wrong, Twitter has _many_ problems, but you can ignore most of them and just follow the people that you like.
[^2]: In particular we really sort of assume that the reader already knows what one of these is and are just writing this for some mild effort towards self-containedness. (Bonus question for anybody actually reading this: what is the word/phrase I can't think of that means 'self-containedness' but is actually a real word/phrase?)
[^3]: (which I won't talk about here because (a) I think there are many other places to read about this that are much better than something that I could write; and (b) I should be working on my thesis but I'm sort of using this post as a method of procrastination/searching for inspiration).
[^4]: An earlier version of this post incorrectly said '$\mathrm{GL}_r$-torsor'; thanks to [Barbara Fantechi for pointing this out!](https://twitter.com/BarbaraFantechi/status/1057701336291123200)