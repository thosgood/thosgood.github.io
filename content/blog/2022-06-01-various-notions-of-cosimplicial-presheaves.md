---
title: Various notions of (co)simplicial (pre)sheaves
kind: article
tags: ['category-theory', 'simplicial-things']
created_at: 2022-05-30
---

For the first time, I have released into the wild a preprint of which I am the sole author, and had no real supervision. This is a scary moment indeed — how do I know that I haven't written complete made-up nonsense? It's true that I talked with a couple of close colleagues about the results, and they nodded in vague agreement, but the responsibility of checking the actual formal details is all on me. Even worse, I wanted to include some results about something that I don't really have any formal experience with. Anyway, I hope the resulting paper is at least mildly "good" (whatever that might mean). It's called "Various notions of (co)simplicial (pre)sheaves", and will be up on the arXiv soon (and I'll update this post with a link when it's live).

<!-- more -->

# Where this paper came from

Ever since my PhD thesis, I've been thinking on-and-off about these things called "sheaves on the Čech nerve", which were introduced by Green[^1], and then later in a different way by Toledo and Tong[^2], in order to do some nice homotopical construction in complex geometry.
The vague idea is that a sheaf $\mathcal{F}$ on a space $X$ can be split up into finer parts, with an individual sheaf $\mathcal{F}^p$ for each simplicial level of the Čech nerve of (a cover of) $X$, i.e. instead of just describing what $\mathcal{F}$ looks like on all of $X$, we describe what it looks like on all the open sets in a cover of $X$ (this is $\mathcal{F}^0$), and then what it looks like on each pairwise intersection $U\cap V$ of open sets from the cover (this is $\mathcal{F}^1$), and then what it looks like on each triple-wise intersection $U\cap V\cap W$ of open sets from the cover (this is $\mathcal{F}^2$), and... and so on.
One reason for wanting to do this is that sometimes we want to endow our sheaf $\mathcal{F}$ with some extra structure or data (such as a [*Koszul connection*](https://en.wikipedia.org/wiki/Connection_(vector_bundle)#Formal_definition), in the case of Green/Toledo--Tong) that might not exist globally (as is indeed the case for holomorphic connections), *but* that exists *locally* --- decomposing our sheaf $\mathcal{F}$ into different simplicial levels over the Čech nerve lets us do exactly this!

Anyway, what always annoyed me about this story (however petty this might be) was the terminology: a bunch of sheaves $(\mathcal{F}^p)_{p\in\mathbb{N}}$ living over a simplicial space $(X_p)_{p\in\mathbb{N}}$ were called *simplicial sheaves*, but they're *not* simplicial objects in the category of sheaves on $X$, and, even worse, they don't actually really even look very simplicial (the morphisms all end up going the wrong way, making them look *co*simplicial).
So is there any relation between these things (which I gave the uninventive but fairly descriptive name of *sheaves on a simplicial space*) and actual simplicial sheaves?
Since the only reference that I know of which actually talks about these sheaves on simplicial spaces is Green's aforementioned thesis (and Toledo--Tong's aforementioned summary of it), I couldn't find if anybody else actually even cared about these objects, let alone cared enough to figure out if they also deserved the name of "simplicial sheaves".


# An unexpected application

When I finally got the motivation to sit down and write things down, I realised that there was also another pretty large gap in what I knew about these things: the second thing you normally learn about after learning about sheaves is *sections* of a sheaf.
So what is a section of a sheaf on a simplicial space?
In one of life's little coincidences, when I started thinking about this specific question seriously, I was working in an office three floors above Vincent Wang-Maścianica, who patiently helped me to understand the basics of string diagrams as well as some other stuff that he was working on.
The reason this is a coincidence is because, one afternoon (to mildly dramatise the story) he saw a diagram on my board and said "oh, I didn't realise you were studying X", to which I replied, "I'm not, I'm thinking about sections of sheaves on simplicial spaces", to which we both replied "oh... interesting".

The upshot of the ensuing conversations with Vincent left me reasonably convinced that I could find an application for sheaves on simplicial spaces outside their one appearance in complex geometry: they could be used to describe "stuff, stuff relating that stuff, and the order in which those relations should evolve".
To give a more concrete example of this, consider the following scenario: we have some objects $x_1,\ldots,x_n$ in a category that has a nice notion of tensor product (e.g. a symmetric monoidal category), and we want to understand what endomorphisms of $x_1\otimes x_2\otimes \ldots\otimes x_n$ look like.
One way of getting such endomorphisms is to build them up from smaller endomorphisms!
For example, say we have objects $A$, $B$, $C$, and $D$, and an endomorphism $f\in\operatorname{End}(A\otimes B)$ and another endomorphism $g\in\operatorname{End}(B\otimes C\otimes D)$.
Then we can get an endomorphism on $A\otimes B\otimes C\otimes D$ by composing $f$ and $g$, after extending them by identity morphisms: $(\mathrm{id}_A\otimes g)\circ(f\otimes\mathrm{id}_C\otimes\mathrm{id}_D)$.
But of course we could have also composed these in the other order, doing $g$ first and then $f$, or we could have even picked different endomorphisms, or we could have had *more* endomorphisms on tensor products of *different* subsets of our objects.

In the paper, I (timidly) make the argument that all of these choices can be bundled up into one sheaf on a simplicial space, and then that a single choice of all the data described above corresponds to a *section* of this sheaf.
There are some caveats in this construction (for example, the method that I describe requires that we fix the number and type of endomorphisms beforehand), but I think that most of them could probably be done away with by somebody who actually knows something about these very restrictive sorts of string diagrams (e.g. if there are some "generating" shapes of these diagrams then you could maybe consider building a simplicial space for each one and then gluing them altogether with some limit-y process).

![String diagrams of a certain form correspond to sections of a specific sheaf on a simplicial space.](/assets/post-images/2022-05-30-endomorphism-construction.png)

Really, the only reason that I actually include this construction at all (beyond wanting to make people in another field aware of these objects that I find so fascinating) is in the hope that somebody comes along and makes it much better!
I think it could be extended to describe much more general string diagrams, with copies and deletes and whatnot, but this is not something that I have the knowledge to do on my own.

This application is, I think, not particularly useful, and might just be an example of "if all you have is a hammer, then everything looks like a nail", or even just a tautology ("of *course* sections of a sheaf on a simplicial space describe such things --- they're just objects in the totalisation of the cosimplicial simplicial mapping space from a cofibrant replacement of a point, and the simplicial nature is exactly describing the notion of linear order", or something like this, says some hypothetical expert), but "hey ho", thought I, "why not just write it down anyway --- maybe somebody else will also like to think about such things from this point of view".


# What's actually in the paper

The paper is mostly a survey, but contains some proofs of what I'm calling "pre-folklore results" --- results which I think would be folklore if I'd ever actually heard anybody else care about them!

The first two sections (after the introduction) define three (or really four) notions of "simplicial sheaf" and describes how they relate to one another; the next section recalls a technical construction that shows how to understand this story in the specific setting of (locally) ringed spaces via a lovely construction[^3] of lax homotopy limits of model categories by Bergner; the final section is split into two, and contains a summary of the application of sheaves on simplicial spaces to coherent sheaves in complex geometry, and then this semi-conjectural construction relating sections of a sheaf on a simplicial space to string diagrams describing endomorphisms generated by endomorphisms.

If anybody does actually read this and have any comments, corrections, criticisms, or complaints, then please do let me know --- you can leave a comment here, or email me, or tweet at me, or whatever you like.
Happy reading!

![The three main notions of simplicial sheaf.](/assets/post-images/2022-05-30-three-notions.png)

[^1]: H.I. Green. “Chern classes for coherent sheaves”. PhD Thesis. University of Warwick, (1980). [pugwash.lib.warwick.ac.uk/record=b1751746~S1](https://pugwash.lib.warwick.ac.
uk/record=b1751746~S1)
[^2]: Domingo Toledo and Yue Lin L Tong. "Green’s theory of Chern classes and the Riemann-Roch formula". In: *The Lefschetz Centennial Conference, Part 1*, Amer. Math. Soc. (1987). DOI:[10.1090/conm/058.1/860421](https://doi.org/10.1090/conm/058.1/860421)
[^3]: Julia E. Bergner. "Homotopy limits of model categories and more general homotopy theories". (2012). arXiv:[1010.0717v2](https://arxiv.org/abs/1010.0717v2)
