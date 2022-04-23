---
title: Some research questions from my notebooks
kind: article
tags: ['algebraic-geometry', 'category-theory', 'simplicial-things']
created_at: 2022-04-25
draft: true
---

One thing that the past few years have taught me is that I am not good at doing maths all by myself. In fact, I would go as far as to say I am completely useless and unmotivated. I do much better when I have coauthors to give me deadlines and friends to talk to, but, for obvious reasons, the past two years have not been good for this. Not really the ideal time for first postdocs, but alas, that's life.

I recently found an old notebook with some vague questions and research ideas in it, and then realised that I had really no reasons whatsoever to keep them to myself.

<!-- more -->

A common fear amongst early-career mathematicians seems to be getting scooped: having somebody solve the questions you were working on before you do, maybe even by having read your work and using it as a launchpad. This is very understandable, since we live in a horrible academic world where publishing is everything, and trying to publish some results that you've arrived at *after* somebody else, no matter how shortly or how differently, suddenly becomes a *lot* harder, which makes getting a job next year *much* more difficult, and...

Because of this, I've always been a bit cautious in writing what I'm working on. But, in the context of my life, the world around me, and some other things, I realise that these fears aren't really very well founded right now. There's no point in me worrying about other people using my ideas to solve problems before I do if *I'm not even working on applying my ideas myself*. Not only that, it's not like I'm sitting on some goldmine of potential paths to solutions of big long-standing open problems --- I just have a few small ideas about small things, and none of them are particularly profound or ingenious anyway! If anything, I shouldn't be worried about people scooping my ideas, but the opposite: trying to get anybody to listen to my ideas at all!

So I figured I might as well just open my research up^[Apart from one paper which I'm currently working on with a coauthor, because that's not just my story to share. But this will hopefully hit the arXiv... within a year? I dunno, I've been saying that about this paper for the past two years, so we'll see what actually happens.] in the hopes that one of you might see one of the questions I have and think "oh, that's interesting, I wonder if Tim would like to work on that with me" (to which I would almost certainly (time and obligations permitting) answer, "yes, that would be so lovely").


### Some simplicial things

All of these questions are about using the Čech nerve, and sometimes the notion of (pre)sheaves on the Čech nerve (cf. Definition 2.2.1 in "[Simplicial Chern-Weil theory for coherent analytic sheaves, Part I](https://arxiv.org/abs/2003.10023)").

#### Barycentric global sections always exist

Take a presheaf $\mathcal{F}$ (of $\mathbb{R}$-modules, say) on some space $X$, and pick a bunch of local sections $\{s_i\in\Gamma(U_i,\mathcal{F})\}_{i\in I}$, where $\{U_i\}_{i\in I}$ is an open cover of $X$. Since we only have a presheaf, there's no reason for these local sections to glue to give a global section. *But* if we pull back our presheaf along the Čech nerve then we can consider the "barycentric global section" $\sum_{j=0}^p t_j s_j$ on any $U_{\alpha_0\ldots\alpha_p}$. This is like the "uniform average" of all the sections: if we fibre integrate then we'd get e.g. $\frac12(s_\alpha+s_\beta)$ on each $U_{\alpha\beta}$.

Is this ever useful at all?

#### Čech nerves of things

Consider some complex-analytic "thing" (i.e. manifold, space, whatever) $X$ that is locally algebraic (whatever that might mean). If we take the Čech nerve then is the resulting simplicial "thing" an *algebraic* simplicial thing $\widetilde{X}$? In the case where $X$ is *not* algebraic, can we measure how far away it is from being so by looking at the simplicial thing $\widetilde{X}$?

A simpler, similar question: is the Čech nerve of an affine cover of an (algebraic) scheme an "affine object" in the category of simplicial schemes? *(This should be something already well known, but I just don't know the answer myself.)*


### Some analytic geometry

- Chern--Weil for stacks
- Chern classes in (*holomorphic*) Deligne cohomology


### Some analytic sheaves

- questions from https://thosgood.com/blog/2021/09/24/some-questions-about-analytic-geometry.html
- Coh vs CCoh


### Some questions at my thesis defence

- non-quotient Artin stacks
- Equivariant cohomology and fibre integration
