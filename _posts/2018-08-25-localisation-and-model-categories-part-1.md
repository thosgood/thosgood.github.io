---
title: Localisation and model categories
part: Part 1
layout: post
category: "maths"
tags: "category-theory homotopy-theory"
comments: true
---

After some exceptionally enlightening discussions with Eduard Balzin recently, I've made some notes on the links between model categories, homotopy categories, and localisation, and how they all tie in together.
There's nothing particularly riveting or original here, but hopefully these notes can help somebody else who was lost in this mire of ideas.

<!--more-->

_Notational note:_ we write $\mathcal{C}(x,y)$ instead of $\mathrm{Hom}_\mathcal{C}(x,y)$.



## Localisation of categories

Let $(\mathcal{C},\mathcal{W})$ be a pair, with $\mathcal{C}$ a category and $\mathcal{W}$ a wide subcategory (that is, a subcategory containing all the objects of $\mathcal{C}$, or, equivalently, a set of morphisms in $\mathcal{C}$).
This data is known as a _relative category_, which is a weaker version of a category with weak equivalences, or a homotopical category, or other such notions.

Often we want to _localise_ $\mathcal{C}$ along $\mathcal{W}$, i.e. 'formally invert all morphisms in $\mathcal{W}$'.
A nice way of making this rigorous is by defining the localisation $\mathcal{C}[\mathcal{W}^{-1}]$ (also written $\operatorname{Ho}(\mathcal{C})$ or $W^{-1}\mathcal{C}$)[^3] by a universal property:[^4]

$$\begin{array}{lcr}
    \mathcal{C} & \xrightarrow{\mathcal{W}\,\mapsto\,\text{iso}_\mathcal{D}} & \mathcal{D}\\
    \quad\searrow & & \nearrow_{\exists!}\\
    & \mathcal{C}[\mathcal{W}^{-1}] &
\end{array}$$

That is, any category (along with a functor into it) such that all morphisms in $\mathcal{W}$ become isomorphisms _must_ factor _uniquely_ through $\mathcal{C}[\mathcal{W}^{-1}]$.

Since our definition is in terms of a universal property, **if** the localisation of a category exists then it is unique.


### Gabriel-Zisman

There is a reasonably concrete way of constructing the localisation that is called _Gabriel-Zisman_ (or sometimes _zigzag_) _localisation_.
It has a few issues, which we discuss below, after giving a definition.
This is the localisation that most people will first study in the case of constructing the derived category of complexes, or some other such example, in a course on homological algebra or algebraic geometry.

We define the objects of $\mathcal{C}[\mathcal{W}^{-1}]$ to be those of $\mathcal{C}$, and the morphisms to be _zigzags_ of morphisms: a morphism $x\to y$ is given by a directed graph whose vertices are objects of $\mathcal{C}$, and whose edges are labelled by arrows in $\operatorname{Arr}(\mathcal{C})\sqcup\operatorname{Arr}(\mathcal{W}^\text{op})$, **modulo certain equivalence relations**.[^1]
That is, a morphism from $x=a_0$ to $y=a_{n+1}$ is given by a string of objects $a_1,\ldots,a_n\in\mathcal{C}$ with maps between them: either a map $a_i\to a_{i+1}$ in $\mathcal{C}$, or a map $a_i\leftarrow a_{i+1}$ in $\mathcal{W}$.

Note that, if $\mathcal{W}$ contains all identity maps (for example), then we can always insert identity maps in our zigzags to ensure that they are always of the form $f_1g_1\ldots f_ng_n$ with $f_i\in\operatorname{Arr}(\mathcal{C})$ and $g_i\in\operatorname{Arr}(\mathcal{W}^\text{op})$.

As you can see, arbitrary morphisms in this category can be unreasonably large (in terms of the data describing them), and so we might hope that, by placing some conditions on $\mathcal{W}$, we can globally bound the length of the zigzags.
If fact, if $\mathcal{W}$ is a _[calculus of fractions](https://ncatlab.org/nlab/show/calculus+of+fractions#definition)_ then we can show that all the zigzags are actually just (co)roofs (depending on the handedness of the calculus of fractions):

$$x\to a\xleftarrow{\small\mathcal{W}} y \quad\text{or}\quad x\xleftarrow{\small\mathcal{W}}a\to y.$$

Note that we **still** have an equivalence relation: two morphisms $x\xleftarrow{\mathcal{W}}a\to y$ and $x\xleftarrow{\mathcal{W}}b\to y$ are equivalent if there exists some roof $a\xleftarrow{\mathcal{W}}e\to b$ such that 'everything commutes'.[^2]

One potential problem with this construction (depending on how much you care about these things) is that the localisation might live only in some bigger universe, and so you have to start worrying about that.


### Dwyer-Kan

Of course, just constructing a category is not usually enough these days, and we instead want to give it some higher structure.
Enter _Dwyer-Kan_ (or _simplicial_) localisation.

This is a way of constructing an $(\infty,1)$-category $L_\mathcal{W}\mathcal{C}$, realised as a _simplicial category_.
We talk more about simplicial categories later on, but first we quote Julia E. Bergner from ["A model category structure on the category of simplicial categories"](https://arxiv.org/abs/math/0406507):

_Note that the term “simplicial category” is potentially confusing. As we have already stated, by a simplicial category we mean a category enriched over simplicial sets._
_If $a$ and $b$ are objects in a simplicial category $\mathcal{C}$, then we denote by $\mathrm{Hom}\_\mathcal{C}(a,b)$ the function complex, or simplicial set of maps $a\to b$ in $\mathcal{C}$._
_This notion is more restrictive than that of a simplicial object in the category of categories._
_Using our definition, a simplicial category is essentially a simplicial object in the category of categories which satisfies the additional condition that all the simplicial operators induce the identity map on the objects of the categories involved._

First of all, note that we now require that $(\mathcal{C},\mathcal{W})$ be a _category with weak equivalences_: all isomorphisms are in $\mathcal{W}$, and if any two of $\{f,g,g\circ f\}$ are in $\mathcal{W}$ then so too is the third.
For example, any model category or homotopical category is automatically a category with weak equivalences.

Now then, the definition by universal property is (modulo some technical $\infty$-details) what you would expect: $L_\mathcal{W}\mathcal{C}$ is an $(\infty,1)$-category such that $\mathcal{C}$ injects into $L_\mathcal{W}\mathcal{C}$ with every morphism in $\mathcal{W}$ becoming an equivalence (in the $(\infty,1)$-sense) in $L_\mathcal{W}\mathcal{C}$, and such that any other such $(\infty,1)$-category factors 'uniquely' through this.

One such way of constructing this localisation is by _hammock localisation_.
For any $x,y\in\mathcal{C}$ we define their $\mathrm{Hom}$ as the simplicial set $L^\mathrm{H}(x,y)$ given by

$$L^\mathrm{H}(x,y) := \coprod_{n\in\mathbb{N}}\mathcal{N}(\operatorname{H}_n(x,y))/\sim$$

where $\mathcal{N}$ is the nerve (which sends a category to a simplicial set), and both the categories $\operatorname{H}_n(x,y)$ and the equivalence relation $\sim$ remain to be defined.

For each $n\in\mathbb{N}$ the category $\operatorname{H}_n(x,y)$ has objects being length-$n$ zigzags, as in Gabriel-Zisman localisation[^5], and the morphisms are 'hammocks'

$$\begin{array}{ccccccccc}
    &&a_1&\to&a_2\xleftarrow{\small\mathcal{W}}&\ldots&a_n&\\
    &^{\small\mathcal{W}}\swarrow&&&&&&\searrow\\
    x&&\downarrow_{\small\mathcal{W}}&&\downarrow_{\small\mathcal{W}}&\ldots&\downarrow_{\small\mathcal{W}}&&y\\
    &_{\small\mathcal{W}}\nwarrow&&&&&&\nearrow\\
    &&b_1&\to&b_2\xleftarrow{\small\mathcal{W}}&\ldots&b_n&
\end{array}$$

i.e. commutative diagrams of zigzags, where the 'linking' arrows are all in $\mathcal{W}$.
The equivalence relations are the 'natural' ones: we can insert or remove identity maps, and compose any composable morphisms.

### Comparison

Now then, we can ask how this 'new' localisation is related to the 'old' one, and we can answer this question with the following lemma.

**Lemma.** $\pi_0(L_\mathcal{W}\mathcal{C}(x,y))\simeq\mathcal{C}[\mathcal{W}^{-1}]$.

For this post, that's it, but my next post will talk about how we can extend these ideas to localise _quasi-categories_, and how the Bergner model structure on simplicial categories comes into the story.
This will, in particular, let us formalise the fact that taking the homotopy category of a category (whenever this makes sense, e.g. for quasi-categories) is somehow equivalent to localising the category along weak equivalences.
The lemma that we'll look at is the following (where we've yet to define the right-hand side).

**Lemma.** $\mathcal{C}[\mathcal{W}^{-1}]\simeq\mathrm{h}L\mathcal{C}$.

## References

- Julia E. Bergner, "A model category structure on the category of simplicial categories", [arXiv:math/0406507](https://arxiv.org/abs/math/0406507).
- V. Hinich, "Dwyer-Kan localization revisited", [arXiv:1311.4128](https://arxiv.org/abs/1311.4128).
- W.G. Dwyer and D.M. Kan, "Calculating simplicial localizations", [_available online_](https://www3.nd.edu/~wgd/Dvi/CalculatingSimplicialLocalizations.pdf).
- Pierre Gabriel, Michel Zisman, "Calculus of Fractions and Homotopy Theory", [_available online_](http://web.math.rochester.edu/people/faculty/doug/otherpapers/GZ.pdf).

---

# Footnotes

[^1]: These are just to ensure that composition and the identity morphism behave as expected. See [the nLab](https://ncatlab.org/nlab/show/localization#general_construction) for details.
[^2]: I think of the diagram you want to show commutes as a tiny house of cards, two layers high.
[^3]: There are so many things that 'homotopy category' or '$\operatorname{Ho}(\mathcal{C})$' or '$\operatorname{h}(\mathcal{C})$' can mean, so the context is always very important
[^4]: This diagram is horribly formatted. I am lost without `tikz-cd`.
[^5]: But, recalling what we said there, since $\mathcal{W}$ contains all isomorphisms then we can assume that our zigzags always alternate between arrows in $\mathcal{C}$ and arrows in $\mathcal{W}^\text{op}$.