---
title: Some questions about complex-analytic geometry
kind: article
tags: ['complex-geometry', 'algebraic-geometry', 'category-theory']
created_at: 2021-09-24
---

Despite being an analytic/algebraic geometer by name (and title, and qualification, and academic upbringing, and ...), there are so many gaps in my knowledge, even when it comes to simple foundational things.
One thing which I have always tried to do during my academic "career", however, is to be the person who asks the first stupid question, so that others can feel less nervous about asking their (certainly less stupid) questions.
Thus: this blog post.

I am going to explain what I do know, talk about what I don't, and then ask some semi-concrete questions that I'm hoping people will be able to help me out with!

<!-- more -->

# The algebraic dictionary

In the case of algebraic geometry, we have a nice dictionary which lets us translate between the language of *sheaves*, of *bundles*, and of *modules*.
I'm sure that many of you will have seen at least the first and last column of this table before; the middle one talks about what sort of *resolutions* we can find.

| Sheaves | Bundles¹ | Modules² |
|:--------|:--------|:--------|
| locally free | vector bundles | finitely generated and projective |
| coherent | complexes of vector bundles | finitely generated |
| quasi-coherent | complexes of vector bundles | arbitrary |

¹ *For quasi-projective Noetherian schemes.*

² *For Noetherian affine schemes.*

Of course, there are some very important caveats here, noted above (i.e. we need to be working over sufficiently nice spaces in order for these correspondences to hold).

Note that here we can write a quasi-coherent sheaf as a (filtered) colimit of its coherent subsheaves, hence the fact that it can also be resolved by a complex of vector bundles (just maybe a really really big and unwieldy one).


# The analytic dictionary

Now, I don't really work very much in the algebraic setting: I'm more interested in the case of holomorphic things on Stein spaces, and so on.
So here's my attempt at filling in the analogous table.

| Sheaves | Bundles | Modules |
|:--------|:--------|:--------|
| locally free | vector bundles | ??? |
| coherent | complexes of vector bundles on the Čech nerve | ??? |
| "quasi-coherent" | ??? | ??? |

As you can see, it is far from complete, but let's start with the things that I *do* know (since this won't take very long to talk about).

It is still the case that locally free sheaves on a complex-analytic manifold correspond to vector bundles, and, by the results of [Green's 1980 thesis](http://wrap.warwick.ac.uk/40592/) (or [mine](https://tel.archives-ouvertes.fr/tel-02882140/)), we can show that coherent (analytic) sheaves (on a complex-analytic manifold) can be resolved, not quite by complexes of vector bundles, but by a sort of up-to-homotopy version of this, namely *Green complexes*, or *complexes of vector bundles on the Čech nerve*.

For the last row of the "Bundles" column, things get a bit complicated.
Indeed, it's not really universally accepted (as far as I know) what "the" "good" definition of quasi-coherent even *is* in the complex-analytic case.
The reason why we don't really want to use the same definition as in the algebraic case (i.e. having a local presentation) is that such objects are not very well behaved at all.
For example, as mentioned above, we know that any quasi-coherent algebraic sheaf is the filtered colimit of its coherent subsheaves, but the analogous statement in the analytic setting is *very much not true*.
In particular, [there exist quasi-coherent (in the sense of the algebraic definition) analytic sheaves on Stein spaces that have non-zero first sheaf cohomology](https://math.stackexchange.com/questions/2840594/gaga-and-quasicoherent-sheaf/2841087#2841087).
This is bad, because any coherent analytic sheaf on a Stein space has zero higher sheaf cohomology, and so there is absolutely no hope of recovering such quasi-coherent sheaves as colimits of their coherent subsheaves.
(Indeed, it's *really* bad, because it's not just that we don't *quite* recover the quasi-coherent sheaf from the colimit, but we're *really* far away from doing so, because we're trying to get something non-zero from a bunch of things that are zero!)

There is the notion of *Fréchet* quasi-coherence, which I have read is a good substitute, but I don't fully understand *why*, nor if it is somehow "*the*" good substitute (indeed, I haven't even fully internalised the definition, since it really is something quite analytic).
Theorem 4.3.6 in *Spectral Decompositions and Analytic Sheaves* tells us the following:

*Let $X$ be a finite-dimensional Stein space, and let $\mathscr{F}$ be a Fréchet $\mathscr{O}_X$-module. The following conditions are equivalent:*

1. *$\mathscr{F}$ is quasi-coherent;*
2. *$\mathscr{F}$ admits globally topologically free resolutions on the left;*
3. *$\mathscr{F}$ is acyclic on $X$ and admits, locally on $X$, topologically free resolutions to the left.*

Here, when they write "quasi-coherent", they mean "Fréchet quasi-coherent".
So maybe this is useful somehow, because it characterises this notion of quasi-coherence in terms of a resolution property, but I'm not sure if that answers my question or not.
Indeed, I'm (yet again) still not entirely sure what these "globally topologically free resolutions" look like, and how they might relate to things that I already know.

Then, of course, there's the elephant in the room (or dictionary, I suppose): what goes in the right-hand column?
That is, what even *is* $\operatorname{Spec}$ in the analytic setting?
I know that this can be sort of understood through the framework of analytic spaces, in the sense of Grauert et al, but I can't quite complete the whole story in my head from what I've read.
I've been meaning to read Brian Conrad's "[Relative ampleness in rigid geometry](https://aif.centre-mersenne.org/item/?id=AIF_2006__56_4_1049_0)", since I think this might hold some answers, but I've been too scared by the appearance of the word "rigid" in the title to actually properly dive in...


# Questions

Anyway, there you go: there are lots of things that I, having a PhD in complex-analytic geometry stuff, really should know the answer to, but don't.
Here are my "precise" questions:

1. How can I fill in this analytic dictionary?
2. In fact, what even is $\operatorname{Spec}$ in the analytic setting?
3. Is *Fréchet* quasi-coherent the good thing to put in the analytic dictionary? That is, what analogous properties does Fréchet quasi-coherence satisfy to make it the "right" notion? e.g. does it arise as the right Kan extension of the pseudofunctor from commutative rings to categories which sends a ring to the category of modules over that ring?
4. More specifically, is it true that Fréchet quasi-coherent sheaves can be recovered as filtered colimits of their 

Sadly I still haven't set up comments on this blog (it's on my (ever-growing) to-do list), so having a conversation might be a bit tricky, but Twitter might be a good place to do this (on [this thread](https://twitter.com/tim_hosgood/status/1441413679367532544), for example), or you can just drop me an email --- I'd love to hear from anybody!
