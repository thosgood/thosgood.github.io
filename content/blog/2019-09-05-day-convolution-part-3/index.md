---
title: Weighted limits, ends, and Day convolution
part: Part 3
kind: article
tags: ['category-theory', 'profunctors']
created_at: 2019-09-05
---

Finally, I find myself with enough motivation to start writing the last part to this series. It's been a while, but hopefully nobody has actually been waiting... This is where we will finally see some of the exciting applications of (co)ends, including tensor products, geometric realisation, and Day convolution. One reason I've got around to writing this post is because coends (or, really, cowedges) appeared to me recently in a tweet about Stokes' theorem, which I found pretty neat indeed --- more details can be found in [this post](/blog/2019/09/04/stokes-coend/).

<!-- more -->

For a refresher on all the definitions, you can check out the two previous parts in this series, because we're just going to dive right in.

# Tensor products

Let $F\colon\mathcal{C}^\mathrm{op}\to\mathcal{D}$ and $G\colon\mathcal{C}\to\mathcal{D}$ be $\mathcal{V}$-functors. Then we define their _tensor product_ to be, **if it exists**, the coend

$$F\otimes_\mathcal{C}G = \int^{c\in\mathcal{C}}F(c)\otimes G(c).$$

As before, we have a non-enriched definition: whenever $\mathcal{D}$ has **all coproducts**, we can define

$$F\otimes_\mathcal{C}G = \int^{c\in\mathcal{C}}F(c)\cdot G(c)$$

where $S\cdot d=\coprod_{s\in S}d$ for any set $S$ and any object $d\in D$.

## Examples

- Consider a ring $R$ as a one-object $\mathsf{Ab}$-enriched. Then a right $R$-module gives an additive functor $R^\mathrm{op}\to\mathsf{Ab}$, and a left $R$-module gives an additive functor $R\to\mathsf{Ab}$. Then their tensor product, as $\mathsf{Ab}$-enriched functors, coincides with their usual tensor product as $R$-modules.

    This example is actually really linked to the theory of _profunctors_, which we will talk about below, but have already talked about in [a previous post](https://thosgood.com/blog/2019/07/14/cauchy-completion-and-profunctors/).
- The co-Yoneda lemma $F \cong \int^{c\in\mathcal{C}} \mathcal{C}(-,c)\otimes F(c)$ can now just be written as

    $$F\cong F\otimes_\mathcal{C}よ$$

    where $よ\colon\mathcal{C}\to\widehat{\mathcal{C}}$ is the Yoneda embedding.

    This lets us state the powerful adage, that "representable functors generalise free modules". To see what this might mean, we state the co-Yoneda lemma applied to a representable functor, as well as a basic theorem about tensor products of free modules, and leave the drawing of connections between the two to the interested reader:

    $$\begin{aligned}
        \operatorname{Hom}_\mathcal{C}(-,c)\otimes_\mathcal{C}F &\cong F(c)\\
        R^n\otimes_R M &\cong M^n.
    \end{aligned}$$
- Geometric realisation of a simplicial set $X$ can also be expressed as a tensor product. If we write

    $$\vert-\vert\colon\Delta\to\mathsf{Top}$$

    to mean the functor that sends $[n]$ to the topological $n$-simplex, then we can write the geometric realisation $\vert X\vert$ of $X$ as

    $$\vert X\vert\cong X\otimes_\Delta\vert-\vert.$$

# Day convolution

As a motivation for the definition of Day convolution, we first recall the classical notion of convolution (albeit phrased in a more categorical language). Consider $\mathbb{N}$ as a **discrete** category with addition as a monoidal product. Let $F,G\colon\mathbb{N}\to\mathsf{Set}$ be functors, which we can think of as _graded sets_. Then their _convolution_ $(F*G)\colon\mathbb{N}\to\mathsf{Set}$ is defined by

$$\begin{aligned}
&(F*G)(n) = \sum_{i+j=n} F(i)\otimes G(j)\\
&= \sum_{i,j=1}^n F(i)\otimes G(j)\otimes\operatorname{Hom}_\mathbb{N}(n,i+j)
\end{aligned}$$

where the second equality follows from the fact that $\mathbb{N}$ is discrete. It might seem like an excessively abstract way of writing some Kronecker delta function, but it is exactly the thing that makes this definition easy to abstractify and generalise.

So now let $F,G\in\widehat{\mathcal{C}}=[\mathcal{C}^\mathrm{op},\mathcal{V}]=\mathsf{PrSh}_\mathcal{V}(\mathcal{C})$ (or whichever other notation you most like that says that $F$ and $G$ are $\mathcal{V}$-valued presheaves). Then we define their _Day convolution_ $(F*G)\in\widehat{\mathcal{C}}$ by

$$(F*G)(c) = \int^{x,x'\in\mathcal{C}} F(x)\otimes G(x')\otimes\operatorname{Hom}_\mathcal{C}(c,x\otimes x')$$

or, if you _really_ like tensor-product notation more than coend notation, by

$$(F*G)(c) = (F\otimes G)\otimes_{\mathcal{C}\times\mathcal{C}}\operatorname{Hom}_\mathcal{C}(c,-\otimes-).$$

As I already mentioned in my [post about profunctors]({{ site.baseurl }}{% post_url 2019-07-14-cauchy-completion-and-profunctors %}), there is a notion of Cauchy completion for presheaves. Something that I often heard say is that the presheaf category _itself_ is the 'free cocompletion' of the original category. There are a bunch of ways of explaining what this means, but my favourite 'proof' is using Day convolution and the co-Yoneda lemma, to show that the Yoneda embedding $よ\colon\mathcal{C}\to\widehat{\mathcal{C}}$ is **monoidal**:

$$\begin{gathered}
    \big( \operatorname{Hom}_\mathcal{C}(-,x)*\operatorname{Hom}_\mathcal{C}(-,x') \big)(c)\\
    \cong \int^{y,y'\in\mathcal{C}}\operatorname{Hom}_\mathcal{C}(y,x)\otimes\operatorname{Hom}_\mathcal{C}(y',x')\otimes\operatorname{Hom}_\mathcal{C}(c,y\otimes y')\\
    \cong \int^{y\in\mathcal{C}}\operatorname{Hom}_\mathcal{C}(y,x)\otimes\operatorname{Hom}_\mathcal{C}(c,y\otimes x')\\
    \cong \operatorname{Hom}_\mathcal{C}(c,x\otimes x')
\end{gathered}$$

where the first isomorphism is by definition, and the last two are by co-Yoneda. That is,

$$\operatorname{Hom}_\mathcal{C}(-,x)*\operatorname{Hom}_\mathcal{C}(-,x') \cong \operatorname{Hom}_\mathcal{C}(-,x\otimes x').$$

That is, _the Yoneda embedding is a (strong) monoidal functor_

$$(\mathcal{C},\otimes_\mathcal{C},I)\hookrightarrow(\widehat{\mathcal{C}},*,よ(I)).$$

Further, if $\mathcal{C}$ is small, then there is an internal hom on $\widehat{\mathcal{C}}$ which makes it _closed_.

Finally, as a fun little fact, which I used at some point in one of my masters theses,^[§4.1 in [Under Spec Z. A reader's companion.](https://github.com/thosgood/papers/blob/master/under-spec-z-readers-companion/under-spec-z.pdf). It's actually something that I'd love to come back to at some point!] whenever $\mathcal{C}$ is small and symmetric, (commutative) monoid objects in the enriched-presheaf category (with Day convolution) are equivalent to (symmetric) lax monoidal functors from $\mathcal{C}$ to $\mathcal{V}$.

## Monoid algebra

Remembering all that we've said above about free modules, and how Day convolution is basically the presheaf version of the tensor product from the original category, I would like to repeat some of what [Alexander Campbell](http://web.science.mq.edu.au/~alexc/) wrote in response to a [question I asked about Day convolution](https://math.stackexchange.com/questions/1650786/day-convolution-intuition) during the writing of my masters thesis.

There is a beautiful formal analogy between Day convolution and monoid algebra, which takes the following form:

| monoid algebra | Day convolution |
| -------------- | --------------- |
| set | category |
| monoid | monoidal category |
| ring $R$ | monoidally cocomplete category |
| $R$-module | cocomplete $\mathcal{V}$-category |
| $R$-algebra | monoidally cocomplete $\mathcal{V}$-category |
| free $R$-module $R^{(X)}$ on a set $X$ | free cocomplete $\mathcal{V}$-category $\widehat{\mathcal{C}}$ on a category $\mathcal{C}$ |
| free $R$-module $R^{(X)}$ on a monoid $M$ with the convolution product | free monoidally cocomplete $\mathcal{V}$-category $\widehat{\mathcal{A}}$ on a monoidal category $\mathcal{A}$ with Day convolution |

where a _monoidally cocomplete_ category is a cocomplete monoidal category $\mathcal{V}$ such that $(-\otimes-)\colon\mathcal{V}\times\mathcal{V}\to\mathcal{V}$ is cocontinuous in each variable.

# Profunctors

Just to have my obligatory "here is something that I don't understand" that all of my posts seem to have, I wrote down in my notes (only a few weeks ago) the following sentence:

_"profunctors! composition is via coends, and this looks like ∃ for composition of relations"_

I have a vague idea of what this means: when we compose relations we do it 'by existence', in that

$$\begin{gathered}
SR(x,y)\\
\iff\\
\exists t\text{ s.t. }R(x,t)\wedge S(t,y)
\end{gathered}$$

and this somehow looks like a coend, but I have no idea (nor, really, the time (nor, really, the skill) to properly think about) how to make this formal. Any ideas?

**Edit.** As always, I asked the lovely people of Twitter whether they could shed any light on what I meant here. As always, I got some great replies:

![sclv](sclv.png)
![emi1ypi](emi1ypi.png)

(the article linked to is [this one](https://bartoszmilewski.com/2019/03/27/promonads-arrows-and-einstein-notation-for-profunctors/), and it is, indeed, great.)
