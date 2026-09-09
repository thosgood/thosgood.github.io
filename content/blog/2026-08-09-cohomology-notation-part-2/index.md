---
title: How does cohomology relate to cohomology?
part: Part 2
kind: article
tags: ['maths', 'category-theory', 'algebraic-geometry', 'complex-geometry']
created_at: 2026-08-09
---

\newcommand{\dgCh}[1]{\mathsf{Ch}(#1)}
\newcommand{\Ch}[1]{\mathsf{Ch}^0(#1)}
\newcommand{\Mod}[1]{#1\text{-}\mathsf{mod}}
\newcommand{\HH}{\mathrm{H}}
\newcommand{\sHH}{\mathscr{H}}
\newcommand{\bHH}{\mathbb{H}}
\newcommand{\Ker}{\operatorname{Ker}}
\renewcommand{\Im}{\operatorname{Im}}
\newcommand{\Hom}{\operatorname{Hom}}
\newcommand{\id}{\mathrm{id}}
\newcommand{\Op}[1]{\mathsf{Op}(#1)}
\newcommand{\Cat}[1]{\mathsf{#1}}
\newcommand{\op}{\mathrm{op}}

*Edit:* Having now completed the full draft of this post, it turns out that I'm actually just going to talk about sheaves and holomorphic functions for a really long time. Stay tuned for the *next* part in this series, where I actually will get back to talking about cohomology!

<!-- more -->

In the last post, we saw "the" definition of cohomology, namely that of **internal cohomology** of a cochain complex $\sHH^n(C^\bullet)$. From this definition, we then described how to build **singular cohomology** of a topological space $\HH^n(X;A)$. Maybe it will be useful to start recording these definitions in a table that we can add to as we go along. Let's see what we have so far:

| Cohomology | Input                                        | Notation            |
| ---------- | -------------------------------------------- | ------------------- |
| internal   | cochain complex $C^\bullet$                  | $\sHH^n(C^\bullet)$ |
| singular   | topological space $X$; coefficient group $A$ | $\HH^n(X;A)$        |

Ok, nice! Let's add some more rows to this table, and let's bring some sheaves into the story.

# Sheaves

Just as I didn't really want to end up writing a blog post about *why* we care so much about cohomology, I don't really want to write one right now about sheaves. So, for fun, I'm going to start by giving "the other" definition of sheaf, for a change of pace. Then after a few paragraphs of digression I'll give the usual, slightly less whimsical, definition so that we can get back to talking about what really matters: which type of "H" we're going to use for our next cohomology definition.

What's a sheaf? Well for the purposes of today's post it's just one space nicely indexed by another space: a **sheaf** $Y$ on a **base space** $X$ is a continuous map $\pi\colon Y\to X$ that we impose a condition on. What condition, I hear you ask? Well, we're not going to ask that $\pi$ be a homeomorphism (i.e. a topological isomorphism) because then this wouldn't be very interesting at all.[^7] But we can ask that $\pi$ be a *little* bit of a homeomorphism. For example, maybe it becomes a homeomorphism when we restrict it to some subset $Y'\subset Y$. That could be interesting, right? We wouldn't be saying that $Y\cong X$, but merely that $Y'\cong X'$ for some subsets $Y'\subset Y$ and $X'\subset X$. Oh, how about this: there are actually *lots* of subsets of $Y$ on which $\pi$ restricts to a homeomorphism. Hmm, how many? That's a good question. Let's just go the whole way and say that there's one (not necessarily unique) for each point in $Y$. And since we're dealing with topological spaces, we should probably make sure that all of these subsets are actually open subsets.

Great! We've rediscovered the definition of a **local homeomorphism**: for all $y\in Y$ there exists an open neighbourhood $V_y\subseteq Y$ such that $U_y\coloneqq\pi(V_y)\subseteq X$ is open and $\pi|V_y$ is a homeomorphism $\pi|V_y\colon V_y\cong U_y$. We are then simply defining a sheaf on $X$ as a local homeomorphism into $X$. Unfortunately, while this definition is very good for some purposes (e.g. defining pullback sheaves, or sheafification of a presheaf, or carrying out representability arguments) it is less convenient when we want to start throwing some algebra into the picture. So let's switch back to the *other* definition of a sheaf.

We know that a local homeomorphism $\pi\colon Y\to X$ lets us view $Y$ as being made up of open subsets of $X$, at least locally. So since $\pi$ isn't a "global" homeomorphism, it doesn't really make sense for us to try to find a "global" inverse to $\pi$, i.e. a map $\sigma\colon X\to Y$ such that $\pi\circ\sigma=\id_X$ and $\sigma\circ\pi=\id_Y$. But we could do exactly the same trick, and try to find "local" inverses. However, we will run into a problem here: there is a real asymmetry in the definition of local homeomorphism, and a rather nasty subtlety to some natural terminology. In fact, this is a problem that we see all over the place once we start looking at formalisms of so-called **weak equivalences**, namely that there is a very big difference between two objects "being weakly equivalent" and there actually existing a weak equivalence between them. More concretely, it seems (and is!) natural to say that $Y$ **is locally homeomorphic to** $X$ if every point $y\in Y$ has an open neighbourhood $V_y$ such that there exists some homeomorphism $\pi_{V_y}\colon V_y\cong U_y\coloneqq\Im(\pi_{V_y})\subseteq X$. This looks *very* similar to our definition of local homeomorphism but with one key difference: we did not specify some "global" map $\pi\colon Y\to X$ at the start. So yes, if we have some local homeomorphism $\pi\colon Y\to X$ then it is indeed true that $Y$ is locally homeomorphic to $X$, but the converse does *not* necessarily hold, because we don't know that we will be able to "glue together" all the $\pi_{V_y}$ to get a map $\pi\colon Y\to X$. For example, if there exist some $V_y$ and $V_{y'}$ that overlap ($V_{yy'}\coloneqq V_y\cap V_{y'}\neq\varnothing$) but $\pi_{V_y}$ and $\pi_{V_{y'}}$ are not equal on this overlap ($\pi_{V_y}|V_{yy'}\neq\pi_{V_{y'}}|V_{y''}$) then how should we define our tentative map $\pi$ on this overlap? Should it be equal to $\pi_{V_y}$ or $\pi_{V_{y'}}$? Even if we make a choice, we now need to prove that we won't run into any problems anywhere else with any other intersections, and then we need to worry about intersections of *three* open subsets, and then of *four*, and... and so on. The classical example of such a case is any sufficiently non-trivial manifold, say the sphere $S^2\subset\mathbb{R}^3$. By definition of being a manifold[^8], it is indeed locally homeomorphic to $\mathbb{R}^2$, but there cannot[^9] exist any local homeomorphism $S^2\to\mathbb{R}^2$. As a bonus annoying quirk, note that there *is* a local homeomorphism in the other direction: $\mathbb{R}^2\to S^2$, given by the inverse[^10] to [stereographic projection](https://en.wikipedia.org/wiki/Stereographic_projection).

This asymmetry means (although I'm not suggesting that this is obvious) that we shouldn't expect to be able to find even a local inverse to a local homeomorphism, but instead only a *one-sided* local inverse. That is, given a local homeomorphism $\pi\colon Y\to X$, we might have *some* success in finding maps $X\supseteq U\xrightarrow{\sigma_U} V\subseteq Y$  such that $\pi\circ\sigma_U=\id_U$. So let's turn this into a definition! Given a sheaf $\pi\colon Y\to X$ and an open subset $U\subset X$, we define the **set of sections of $Y\xrightarrow{\pi}X$  over $U$** as
$$
    \Gamma(U,Y\xrightarrow{\pi}X)
    \coloneqq \{\sigma\colon U\to Y \mid \pi\circ\sigma = \id_U\}.
$$
But if we leave out any specific choice of open subset $U$ we obtain a (contravariant) functor from the category (really, the poset; morphisms are given by inclusion of one open subset into another, and this doesn't involve any choice or extra data) $\Op{X}$ of open subsets of $X$ to the category of sets:
$$
    \begin{aligned}
        \Gamma\colon
        \Op{X}^\op
        &\longrightarrow \Cat{Set}
    \\  U
        &\longmapsto \Gamma(U,Y\xrightarrow{\pi}X)
    \end{aligned}
$$
This functor is particularly nice, since it satisfies exactly the kinds of properties that we were worried about before when asking whether or not some $\pi_{V_y}$ and $\pi_{V_{y'}}$ would be able to "glue" on the overlap $V_{yy'}$. We could phrase this property in terms of "unique gluing of compatible local sections", or in terms of "descent", but I'm actually going to opt for neither of those and just keep things a bit vague. That is, a sheaf (from this perspective) is a **presheaf** (i.e. a functor $\Op{X}^\op\to\Cat{Set}$) that comes from this construction of starting with a local homeomorphism.

If this were a real introduction to sheaves, then I would talk about structure sheaves and, in particular, the sheaf of holomorphic functions, which is sort of "the original" sheaf. However, this is not a real introduction to sheaves! We'll be content for now to just point out one generalisation: what if we replace the category $\Cat{Set}$ by something with algebraic structure, e.g. the category of abelian groups? If we do this then we get **sheaves of abelian groups**, and these are the guys that we really care about in the story of sheaf cohomology. To give just one concrete example, I will actually talk a tiny bit about the sheaf of holomorphic functions. If you don't really know about holomorphic functions, then don't worry, because I'll just say some things that I promise are true and you can just believe me and get on with your life.

# The sheaf of holomorphic functions

To pick one of the myriad of (eventually equivalent) definitions, a **holomorphic** function $f\colon\mathbb{C}\to\mathbb{C}$ is a function that is everywhere complex-differentiable. That is, for all $z_0\in\mathbb{C}$, the limit
$$
    f'(z_0)
    \coloneqq \lim_{z\to z_0} \frac{f(z)-f(z_0)}{z-z_0}
$$
exists, i.e. is a well-defined complex number, i.e. gives a well-defined function $f'\colon\mathbb{C}\to\mathbb{C}$. The thing that makes holomorphic functions so wonderful (and also so tough to work with) is the sneaky little detail about what we mean when we say "the limit as $z$ approaches $z_0$". In real analysis, working in $\mathbb{R}$, there are basically just two ways that one number $x$ can approach another number $x_0$: either $x$ gets smaller and smaller until it is really close to $x$, or it gets larger and larger until it is really close to $x$. That is, $\mathbb{R}$ just looks like a line. But $\mathbb{C}$ is a whole plane, and this means that $z$ can approach $z_0$ in infinitely many interesting ways. For example, it could approach it along *any* straight line coming out of $z_0$, or it could "spiral inwards", or do something even more fancy. The fact that there are so many possible ways that $z$ could approach $z_0$ means that this limit existing is a really strict requirement. And, as is usual in mathematics, the more strictly defined an object is, the more well behaved it is. This leads to a bunch of other (again, equivalent) definitions of holomorphic functions, and we'll focus on one in particular: a function $f\colon\mathbb{C}\to\mathbb{C}$ is holomorphic if and only if it is **analytic**, i.e. if an only if, for all $z_0\in\mathbb{C}$, we can find a (nice) open neighbourhood $U_{z_0}\subseteq\mathbb{C}$ on which $f$ can be expressed as a power series centred at $z_0$:
$$
    f|U_{z_0}
    = \sum_{i=0}^\infty a_i(z-z_0)^i
    = a_0 + a_1(z-z_0) + a_2(z-z_0)^2 + \ldots.
$$

Lots of nice functions are holomorphic. For example, any polynomial is holomorphic: in short, a polynomial is just a finite power series, so it's definitely analytic. All the trigonometric functions that we know and love (when suitably extended from being defined only on the real numbers to being defined on all the complex numbers) are holomorphic, and this is because the complex exponential function $z\mapsto e^{\lambda z}$ is holomorphic (for any fixed $\lambda\in\mathbb{C}$). Holomorphic functions are also closed under all the sensible operations: point-wise addition, subtraction, product, and multiplication by a scalar (and thus form a ring, and a $\mathbb{C}$-vector space; they form a $\mathbb{C}$-algebra), and even division, as long as the denominator is never zero anywhere.[^11] They're also closed under composition.

However, holomorphic functions are very "rigid". Here are two fundamental theorems that demonstrate what we mean when we say that:

::: {.itenv title="Picard's little theorem"}
If $f\colon\mathbb{C}\to\mathbb{C}$ is holomorphic, then exactly one of the following statements is true:

1. $\Im(f)=\mathbb{C}$
2. $\Im(f)=\mathbb{C}\setminus\{z_0\}$ for some specific $z_0\in\mathbb{C}$
3. $f$ is constant.
:::

::: {.itenv title="Identity theorem"}
Let $U\subseteq\mathbb{C}$ be a non-empty, connected, open subset. If $f\colon U\to\mathbb{C}$ is holomorphic, then the following statements are equivalent:

1. There exists some $z_0\in\mathbb{C}$ such that $f^{(n)}(z_0)=0$ for all $n\in\mathbb{N}$ (where $f^{(n)}$ denotes the $n$-th derivative of $f$).
2. $f$ is the constant zero function.
:::

So Picard's little theorem tells us that non-constant holomorphic functions cannot have their image squished down into some small open subset; holomorphic functions really have to have complete free roam of the complex plane. In fact, it generalises another fundamental theorem, namely **Liouville's theorem**, which says that any holomorphic function that is bounded must actually in fact be constant. Liouville's theorem, although weaker, can actually be used to prove the fundamental theorem of algebra, as well as another "rigidity" property of holomorphic functions: if $f$ and $g$ are holomorphic functions, and $g$ dominates $f$ (i.e. $|f(z)|\leqslant|g(z)|$ for all $z\in\mathbb{C}$), then actually $g$ and $f$ are basically just the same function (i.e. there exists some $\lambda\in\mathbb{C}$ such that $f=\lambda g$).

The identity theorem tells us, in particular, that if $f$ is constant on any connected open subset of $\mathbb{C}$, *no matter how small*, then it is *globally* constant. This is *really* strong: the global behaviour of a holomorphic function can be entirely determined by its behaviour on the smallest possible open disc you could imagine! Indeed, it turns out that a holomorphic function (defined on any non-empty connected open set) is always entirely determined by its restriction to *any* non-empty open subset. This is very very not true for real analytic functions, or smooth functions, or anything familiar back in the world of real analysis!

These facts have a lot of consequences for the geometry of holomorphic functions. We can define holomorphic functions of many variables, i.e. $f\colon\mathbb{C}^n\to\mathbb{C}$, in a way that turns out to be surprisingly simple: Hartog's theorem (or Osgood's lemma, if we are a bit more careful) tells us that we just need to ask for $f$ to be holomorphic in each variable. This is surprising because the same is not true in real analysis! The famous[^12] counter-example is
$$
    f(x,y)
    \coloneqq
    \begin{cases}
        \frac{xy}{x^2+y^2} &\text{if }(x,y)\neq(0,0)
    \\  0 &\text{if }(x,y)=(0,0)
    \end{cases}
$$
which is differentiable in each variable, but it is not even continuous (at the origin) in both variables. Once we know how to talk about multivariable holomorphic functions, we can define **complex manifolds** as topological spaces that are locally biholomorphic to (i.e. there exists a holomorphic map with holomorphic inverse) open[^13] subsets of $\mathbb{C}^n$. And now, *finally*, we can get back to the sheaf of holomorphic functions.

If we have any space $X$ whatsoever, then it's usually interesting to study the functions *on* that space[^14], by which we mean maps $X\to A$, where $A$ is some suitably relevant space, and where the maps preserve whatever interesting structure is common between $X$ and $A$. For example, in the setting of complex geometry, we are interested in holomorphic functions from a complex manifold into the complex plane: $f\colon X\to\mathbb{C}$. But now these rigidity theorems come into play: if $X$ is a *compact* complex manifold (e.g. complex projective space, or the vanishing of some (homogeneous) polynomials inside complex projective space) then *every* holomorphic function $X\to\mathbb{C}$ is actually just a constant function. This is bad news! Looking at functions on a space no longer helps us recover that space up to isomorphism, and that will make a lot of category theorists very sad. This will also make a lot of real-analysis fans sad, because there are lots and lots of smooth functions from a smooth manifold into $\mathbb{R}$.

There are two (not mutually exclusive) ways of fixing this.

One way is to say "well maybe we should just ignore the compact spaces". This is actually a surprisingly good idea, in some senses. It is true that this means we will be leaving the world of projective geometry, and thus throwing away a gargantuan bunch of useful tools that Chow's theorem (or, more generally, [GAGA](https://en.wikipedia.org/wiki/Algebraic_geometry_and_analytic_geometry)) would have let us borrow from algebraic geometry. It's also true that we're throwing away a hypothesis that makes a *lot* of things a lot easier (finite things are so much simpler than infinite things!). But the reward is that we'll start seeing a lot more **Stein manifolds** around, and these are my best friend. I actually have a draft blog post about Stein manifolds, non-algebraic complex geometry, and model categories, so I'm going to just leave this sentence as an unexplained cliffhanger for now.

The other way is to go back to sheaf theory, and so this is the one that we'll be exploring here. It turns out, by the above theorems about holomorphic functions, and a little bit more complex analysis, that if we have some complex manifold $X$ (compact or not, we now don't care) then around any point $x\in X$ we can always find a small enough open neighbourhood $U_x\subseteq X$ such that the set of holomorphic functions on $U_x$ is actually the same as the set of holomorphic functions on $\mathbb{C}^n$. That's a lot of holomorphic functions! If anything, that's maybe too many holomorphic functions... When we have some really small $U_x$ and another really small $U_{x'}$, what are we going to do on $U_{xx'}\coloneqq U_x\cap U_{x'}$? There are two ways we can think of $\{f\colon U_{xx'}\to\mathbb{C}\}$ as being equal to $\{f\colon\mathbb{C}^n\to\mathbb{C}\}$, and what if they're not the same? But hopefully some alarm bells are ringing in your head now: we've already had this exact same conversation! Let's build a sheaf!

Given a complex manifold $X$ we define its **sheaf of holomorphic functions** (usually denoted by $\mathcal{O}_X$) to be given by
$$
    \begin{aligned}
        \mathcal{O}_X\colon
        \Op{X}
        &\longrightarrow \Cat{Ab}
    \\  U
        &\longmapsto \{f\colon U\to\mathbb{C} \mid f\text{ is holomorphic}\}
    \end{aligned}
$$
Note that we could have chosen to land in the category of $\mathbb{C}$-algebras, but we'll just look at the underlying abelian group for now. But why is this thing a *sheaf*? That's an argument we're not going to get into today. I'm just going to say that it is, and you can either just believe me or (much better) think about it and do some internet/book searching. But the argument that needs to be given is, in essence, that if we have open subsets $U,V\subseteq X$ with a non-empty overlap $U\cap V\neq\varnothing$, and holomorphic functions $f_U\colon U\to\mathbb{C}$ and $f_V\colon V\to\mathbb{C}$ *such that* $f_U=f_V$, then there actually exists a unique holomorphic function $f_{U\cup V}\colon U\cup V$ on the *union* such that $f_U=f_{U\cup V}|U$ and $f_V=f_{U\cup V}|V$. That is, if we have a collection of holomorphic functions on little open subsets, and whenever they could possibly be simultaneously defined they actually all agree, then we never really had a collection of little holomorphic functions but instead just secretly had one big holomorphic function the whole time, that recovers the little ones by restriction.

This sheaf is amazing. In fact, it's so amazing that there's a whole theorem just saying how amazing this sheaf is, and it's such an incredible theorem that I would argue that it deserves the name of "fundamental theorem of complex geometry". In fact, because this is our blog post and we can do what we like, let's just make that true now.

::: {.itenv title="Fundamental theorem of complex geometry"}
Let $X$ be a complex manifold. Then the sheaf $\mathcal{O}_X$ of holomorphic functions on $X$ is amazing.
:::

If we wanted to use some more standard terminology here, we would substitute the word "amazing" for the word "coherent", and our theorem then becomes the following:

::: {.itenv title="Oka coherence"}
Let $X$ be a complex manifold. Then the sheaf $\mathcal{O}_X$ of holomorphic functions on $X$ is a **coherent** sheaf.
:::

The story of coherent sheaves, however, really will have to wait for another day.

[^7]: This isn't really entirely true, but it's true enough for now.

[^8]: As a short aside to this already far-too-long aside, this interplay between manifolds and local homeomorphisms can be made much more explicit, in that we can actually *define* manifolds in terms of sheaves. This is a beautiful story, but one for another time.

[^9]: "Proof left as an exercise to the reader." In short, we'll find that the best we can do is build a local homeomorphism from the sphere *minus a single point* into $\mathbb{R}^2$.

[^10]: That is, think of $\mathbb{R}^2$ as a big piece of graph paper on a table, and think of $S^2$ as a globe. Place the globe with the south pole touching the origin of the graph paper (thus with the north pole also directly above the origin). We define the desired map $\psi\colon\mathbb{R}^2\to S^2$ by setting $\psi(x)$ to be the (unique!) point on the globe where the straight line from $x$ to the north pole (which "leaves" the flat plane of the table, existing in the 3-dimensional ambient space) intersects the globe.

[^11]: The desire to talk about the absolutely beautiful story of meromorphic functions and Riemann–Roch theorems is very strong, but I'm trying *so hard* to get back to defining sheaf cohomology as quickly as I can.

[^12]: i.e. the one found [on Wikipedia](https://en.wikipedia.org/wiki/Hartogs%27s_theorem_on_separate_holomorphicity), and the one that I remember from my undergraduate degree.

[^13]: If I were being careful then I would say some more adjectives in front of the word "open".

[^14]: I recently got to record [some very fun videos with my friend Jason](https://topos.institute/work/lectures/2-torials/2026-07-28_hosgood_geometry/) on why we are interested in functions "on a space".

