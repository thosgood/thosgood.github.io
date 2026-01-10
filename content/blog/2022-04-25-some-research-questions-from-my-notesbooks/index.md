---
title: Some research questions from my notebooks
kind: article
tags: ['algebraic-geometry', 'category-theory', 'simplicial-things']
created_at: 2022-04-25
---

One thing that the past few years have taught me is that I am not good at doing maths all by myself. In fact, I would go as far as to say I am completely useless and unmotivated. I do much better when I have co-authors to give me deadlines and friends to talk to, but, for obvious reasons, the past two years have not been good for this. Not really the ideal time for first postdocs, but alas, that's life.

I recently found an old notebook with some vague questions and research ideas in it, and then realised that I have had no motivation to work on any of these alone, so why not put them out there for other people to see?

<!-- more -->

A common fear amongst early-career mathematicians seems to be getting scooped: having somebody solve the questions you were working on before you do, maybe even by having read your work and using it as a launchpad. This is very understandable, since we live in a horrible academic world where publishing is everything, and trying to publish some results that you've arrived at *after* somebody else, no matter how shortly or how differently, suddenly becomes a *lot* harder, which makes getting a job next year *much* more difficult, and...
Because of this, I've always been a bit cautious in writing what I'm working on. But, in the context of my life, the world around me, and some other things, I realise that these fears aren't really very well founded for me right now. There's no point in me worrying about other people using my ideas to solve problems before I do if *I'm not even working on applying my ideas myself*. Not only that, it's not like I'm sitting on some goldmine of potential paths to solutions of big long-standing open problems --- I just have a few small ideas about small things, none of them are particularly profound or ingenious (in fact, now that I read back what I've written, I see that they're basically all just "*what if you did X, but with the Čech nerve instead?*"). If anything, I shouldn't be worried about people scooping my ideas, but the opposite: trying to get anybody to listen at all!

So I figured I might as well just open up some of^[Apart from one paper which I'm currently working on with a co-author, because that's not just my story to share. But this will hopefully hit the arXiv... within a year? I dunno, I've been saying that about this specific paper for the past two years, so we'll see what actually happens.] my "research" in the hopes that one of you might see one of the questions I have and think "oh, that's interesting, I wonder if Tim would like to talk about this sometime" (to which I would almost certainly (time and obligations permitting) answer, "yes, that would be very lovely").


# Some simplicial things

*(These questions are about using the Čech nerve, and sometimes the notion of (pre)sheaves on the Čech nerve --- cf. e.g. Definition 2.2.1 in "[Simplicial Chern-Weil theory for coherent analytic sheaves, Part I](https://arxiv.org/abs/2003.10023)".)*

## Barycentric global sections always exist

Take a presheaf $\mathscr{F}$ (of $\mathbb{R}$-modules, say) on some space $X$, and pick a bunch of local sections $\{s_i\in\Gamma(U_i,\mathscr{F})\}_{i\in I}$, where $\{U_i\}_{i\in I}$ is an open cover of $X$. Since we only have a presheaf, there's no reason for these local sections to glue to give a global section. *But* if we pull back our presheaf along the Čech nerve then we can consider the "barycentric global section" $\sum_{j=0}^p t_j s_j$ on any $U_{\alpha_0\ldots\alpha_p}$. This is like the "uniform average" of all the sections: if we fibre integrate then we'd get e.g. $\frac1{p+1}\sum_{i=0}^p s_{\alpha_j}$ on each $U_{\alpha_0\ldots\alpha_p}$.

Is this ever useful at all, as a sort of "second best thing" for a global section that you know doesn't exist?

## Čech nerves of things

Consider some complex-analytic "thing" (i.e. manifold, space, whatever) $X$ that is locally algebraic (whatever that might mean). If we take the Čech nerve then is the resulting simplicial "thing" an *algebraic* simplicial "thing" $\widetilde{X}$? In the case where $X$ is *not* algebraic, can we measure how far away it is from being so by looking at the simplicial "thing" $\widetilde{X}$?

A simpler, similar question: is the Čech nerve of an affine cover of an (algebraic) scheme an "affine object" in the category of simplicial schemes?

*(This last question should be something already well known, but I just don't know the answer myself.)*


# Some analytic geometry

*(These questions are about taking things that we know how to do in the smooth or the algebraic world, and trying to do them in the complex-analytic world.)*

## Chern--Weil for stacks

One way of cheekily summarising some of the results from [my PhD thesis](https://tel.archives-ouvertes.fr/tel-02882140) would be that "sheaves on the Čech nerve sometimes allow you to apply smooth methods to complex-analytic things", and the application of this that I considered was Chern--Weil theory via the Atiyah exact sequence. So is it possible to extend some results concerning Chern--Weil theory via the Atiyah exact sequence on differentiable stacks to the complex-analytic case?

*(This question was prompted by seeing two papers on the arXiv by Indranil Biswas, Saikat Chatterjee, Praphulla Koushik, and Frank Neumann: [`2012.08442`](https://arxiv.org/abs/2012.08442) and [`2012.08447`](https://arxiv.org/abs/2012.08447).)*

## Holomorphic Deligne cohomology

This is one that I've been thinking about ever since the middle of my PhD, and it was actually the original problem that I'd hoped to solve (but that turned out to be much more difficult than we'd first thought). Deligne cohomology in the *smooth* setting is really well understood --- for example, Urs Schreiber has written SO much about this (and all very very lovely, albeit nearly entirely far over my head) under the name of *differential cohomology*. But at some point quite early on there is a partition of unity argument, which means that it fails in the holomorphic case. Indeed, there are lots of little worked examples you can do that show that Deligne cohomology in the complex-analytic world really is quite different.

One "simple" concrete problem is the following: given a holomorphic vector bundle (not even an arbitrary coherent analytic sheaf!), write down *Čech representatives* for its Chern classes *in Deligne cohomology*. Just the first part (Čech representatives) was done^[Well, the method was explained, but the actual computations were basically left as an exercise to the reader --- I was one such reader, and I wrote them down in *my* PhD thesis.] in [Green's 1980 PhD thesis](http://wrap.warwick.ac.uk/40592/); just the second part (holomorphic Deligne cohomology) was done in [Grivaux's 2009 thesis](http://jgrivaux.perso.math.cnrs.fr/articles/Chern.pdf). There is a (beautiful and very good) paper by Brylinski and McLaughlin ("[Cech Cocycles for Characteristic Classes](https://projecteuclid.org/journals/communications-in-mathematical-physics/volume-178/issue-1/%C4%8Cech-cocycles-for-characteristic-classes/cmp/1104286562.pdf)") that seems to give an answer, but only gives a proof in the smooth setting, and when I sat down (many *many* times) and tried to work through it myself, the degrees in the holomorphic setting seemed to be exactly the wrong ones that you would get from trying to treat smooth Deligne cohomology like holomorphic Deligne cohomology (i.e. bidegree $(2p,0)$ instead of $(p,p)$, if I remember correctly). It is also one of those answers where they say "ok, here are all the ingredients you need, so just put them together", but then don't just write down the explicit representatives (something that always frustrates me: if putting the pieces together is hard, then say it's hard; if it's easy, then why not just do it?!).

To reduce this problem down to the very simplest form: given a rank-$2$ holomorphic vector bundle defined by transition functions $g_{\alpha\beta}$, write down a Čech cocycle *in terms of the $g_{\alpha\beta}$* representing the second Chern class in *Deligne cohomology*.

*(For example, we know how to do this in de Rham cohomology: you can take $\operatorname{tr}(\omega_{\alpha\beta}g_{\alpha\beta}\omega_{\beta\gamma}g_{\alpha\beta}^{-1})$ or, equivalently (via some algebraic manipulations), $\operatorname{tr}(\omega_{\alpha\beta}(\omega_{\alpha\gamma}-\omega_{\alpha\beta}))$, where $\omega_{\alpha\beta}=\operatorname{d}\log g_{\alpha\beta}=g_{\alpha\beta}^{-1}dg_{\alpha\beta}$, and you can then extend this to give a closed element of the Čech-de Rham bicomplex.)*


# Some analytic sheaves

*(More complex-analytic geometry, this time dealing with holomorphic vector bundles and their generalisations.)*

## Complexes of coherent sheaves

If you're dealing with sheaves in algebraic geometry, then you might care about whether or not they're coherent. Given that we like to think of complexes of sheaves instead of just single sheaves (e.g. we like working in the derived category), we are interested in the derived category $D^\mathrm{b}\mathsf{Coh}(X)$ of (bounded) complexes of coherent sheaves. But there's another category which arises quite often in practice, namely the category $D^\mathrm{b}_{\mathsf{Coh}}(\mathsf{Sh}(X))$ of complexes of sheaves that are not necessarily coherent, but whose (internal, i.e. "kernel of the differential of the complex modulo the image of the differential") cohomology consists of coherent sheaves. The latter sounds like it should be more general, but in nice algebraic cases the two are actually equivalent! This follows from a result in SGA 6:

- **SGA 6, II, Corollaire 2.2.2.1.** If $X$ is a Noetherian scheme, then the canonical fully faithful functor $D^\mathrm{b}(\mathsf{Coh}(X))\hookrightarrow D(\mathsf{Sh}(X))$ identifies the codomain with the full subcategory $D^\mathrm{b}_{\mathsf{Coh}}(\mathsf{Sh}(X))$ of the domain.

Now there's another related result, which follows from applying the above corollary to a specific case:

- **SGA 6, I, Exemples 5.11 (+ II, Corollaire 2.2.2.1).** If $X$ is a smooth scheme, then there is a canonical equivalence of triangulated categories $\mathsf{Perf}(X)\xrightarrow{\sim}D^{\mathrm{b}}(\mathsf{Coh}(X))$.

This says that, for *smooth* schemes, pseudo-coherence is equivalent to perfectness (being *locally* resolved by locally free sheaves).

Now, the analogue of this second statement is still true in the analytic case: coherent analytic sheaves always have *local* locally free resolutions. But the first statement is a corollary to Proposition 2.2.2, which uses the fact that "every quasi-coherent module is the filtrant colimit of its coherent submodules", and this is *not* true in the analytic case (in fact, this raises a question I'll talk about after this one).

So are these two categories, "complexes of coherent sheaves" and "complexes of sheaves with coherent cohomology" equivalent in the analytic setting? In the specific case where $X$ is a smooth compact analytic *surface*, yes! This is Corollary 5.2.2 of Bondal and Van den Bergh's "[Generators and representability of functors in commutative and noncommutative geometry](https://arxiv.org/abs/math/0204218)". But in higher dimensions, it is (as far as I can tell) still an open question.

I don't have any particular insight into this problem, except that I think (yet again) that sheaves on the nerve might have something to say about this. Furthermore, I haven't read the details of Bondal and Van den Bergh's proofs, nor those in SGA 6, so probably the following is obvious (or even tautological, actually), but it's intriguing that these hypotheses ($X$ is smooth, compact, and a surface) are exactly those found in Schuster's "[Locally free resolutions of coherent sheaves on surfaces](https://www.degruyter.com/document/doi/10.1515/crll.1982.337.159/html)" which shows that, under these hypothesis, coherent analytic sheaves can be *globally* resolved by locally free sheaves (the *resolution property*).

## The resolution property

Whether or not coherent analytic sheaves can be *globally* resolved by locally free sheaves (instead of just *locally* resolved) is controlled by the so-called *resolution property*, mentioned above. We say that something (e.g. a stack) *has the resolution property* if every coherent sheaf admits a surjection from a locally free sheaf --- what happens if we change this to "... a surjection from a locally free sheaf *on the nerve*"? This could be useful for Riemann--Roch for Artin stacks: these have the resolution property when they are quotients of quasi-projective schemes by reductive groups, but not in general (and so this assumption appears in Toën's Riemann--Roch paper). It could also be useful for a formal GAGA theorem, cf. Geraschenko and Zureick-Brown's "[Formal GAGA for good moduli spaces](https://arxiv.org/abs/1208.2882)".

## Analogies between algebraic and analytic geometry

Here I'm just going to refer you to a previous blog post of mine: "[Some questions about complex-analytic geometry](/blog/2021-09-24-some-questions-about-analytic-geometry/)". The main one here is "*how should we define the notion of quasi-coherence for an analytic sheaf?*", followed immediately by "*why did we pick this definition, and not the others?*". One possible answer is "read Scholze and Clausen's lecture notes on condensed mathematics, Conrad's paper on relative ampleness in rigid geometry, and Eschmeier and Putinar's book *Spectral Decompositions and Analytic Sheaves*, and see if you can put all the pieces together".

Just for the sake of it, here are some possible contenders for the definition of quasi-coherence for an analytic sheaf $\mathscr{F}$ of $\mathcal{O}_X$-modules:

1. being *of local presentation*, i.e. for all $x\in X$ there exists an open $U\subseteq X$ on which there is an exact sequence
    $$\mathcal{O}_X^{\oplus I}|U \to \mathcal{O}_X^{\oplus J}|U \to \mathscr{F}|U \to 0$$
2. being the filtrant colimit of its coherent subsheaves
3. being *Fréchet quasi-coherent*, or, equivalently, admitting a global "topologically free" resolution
4. something analogous to arising from the right Kan extension of something like the pseudofunctor $\mathsf{CRing}\to\mathsf{Cat}$ defined by $R\mapsto\mathsf{Mod}_R$ (very vague, I know).

I know that there are [examples of 1. that do not satisfy 2.](https://math.stackexchange.com/questions/2840594/gaga-and-quasicoherent-sheaf/2841087#2841087), but I actually don't know how the other notions interact at all.
