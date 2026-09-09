---
title: How does cohomology relate to cohomology?
part: Part 1
kind: article
tags: ['maths', 'homological-algebra', 'category-theory', 'algebraic-topology']
created_at: 2026-08-08
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

There are so many things called cohomology and so many ways of writing the letter "H". And I'm not even talking about the distinction between de Rham cohomology and singular cohomology and absolute Hodge cohomology: I really just mean the difference between writing $\mathbb{H}^q(X;\Omega^p)$ and $\mathrm{H}^q(X,\Omega^p)$. Why does one use a semicolon and the other a comma, and one an $\mathbb{H}$ and the other an $\mathrm{H}$? And what about that one time that I saw somebody write $\mathscr{H}$?

I remember being so confused by this during my PhD, and as a result all my notes from those days are a nightmare to read. Normally this wouldn't matter at all, but for various reasons I'm interested in revisiting some of my old calculations. So here we go: I'm finally going to set my notation straight, and clear up as many of my past confusions as possible.

<!-- more -->

# Internal cohomology

Firstly, let's forget all about spaces and that geometry nonsense and talk about the one thing[^1] that matters: cochain[^2] complexes. I really don't have the energy today to write a good introduction to *why* we care about complexes nor *why* their cohomology is an interesting thing to study.[^3] Again, this blog post is really just about fixing some notation and stating some classical theorems. With that in mind, let's speed through.

We pick some nice[^4] category $\mathcal{A}$ and we decide that, for some reason that I really won't get into here, we care deeply about the category $\dgCh{\mathcal{A}}$ of *cochain complexes*. This is the category whose objects are of the form
$$
    \ldots
    \xrightarrow{d^{n-1}} C^n
    \xrightarrow{d^n} C^{n+1}
    \xrightarrow{d^{n+1}} \ldots
$$
where $(C^n\mid n\in\mathbb{Z})$ are objects of $\mathcal{A}$ and $(d^n\mid n\in\mathbb{Z})$ are morphisms in $\mathcal{A}$ *such that* $d^n\circ d^{n-1}=0$, i.e. any composite of these morphisms (called *differentials*) is zero;
the morphisms between objects in this category are maybe not what you expect, because they're simply the degree-wise morphisms, i.e. $f^\bullet\colon C^\bullet\to D^\bullet$ is just a collection of morphisms $f^n\colon C^n\to D^n$ in $\mathcal{A}$ satisfying absolutely no conditions whatsoever.
However, we are often interested in those morphisms that respect the differentials, i.e. those such that everything commutes:
$$
\begin{CD}
    \ldots @>{d^{n-1}}>> C^n @>{d^n}>> C^{n+1} @>{d^{n+1}}>> \ldots
\\  @. @VV{f^{n-1}}V @VV{f^n}V @.
\\  \ldots @>{e^{n-1}}>> D^n @>{e^n}>> D^{n+1} @>{e^{n+1}}>> \ldots
\end{CD}
$$
We call such morphisms **chain maps**, and denote the category of cochain complexes with chain maps by $\Ch{\mathcal{A}}$.

Now, here's our first and most fundamental definition today, where we're already going to be using slightly non-standard terminology.

::: {.rmenv title="Definition (Internal cohomology)"}
Let $C^\bullet\in\Ch{\mathcal{A}}$ be a cochain complex. Its **internal cohomology** is the $\mathbb{Z}$-graded collection of abelian groups $(\sHH^n(C^\bullet)\mid n\in\mathbb{Z})$, where we define
$$
    \sHH^n(C^\bullet)
    \coloneqq \frac{\Ker d^n}{\Im d^{n-1}}
$$
:::

Isn't that neat!

# Singular cohomology

With the definition of internal cohomology in our pockets, we can take it out and show it to our second-best friend: homotopy theory. In return, homotopy theory shows us *its* favourite fun little gadget: simplices.

People[^5] love to say that you can understand something by studying maps into it. So if we have some space $X$ then maybe we can understand it better by looking at how the topological simplices $\Delta^n=\{(t_0,\ldots,t_n) \mid \sum_{i=0}^n t_i=1\}\subset\mathbb{R}^{n+1}$ map into $X$. This leads us to define the **singular $n$-simplices in $X$** as the set
$$
    \sigma_n(X)
    \coloneqq \{\sigma\colon\Delta^n\to X\}
$$
of continuous maps. We can think of this set $\sigma_n(X)$ as an abelian group by just letting ourselves write down purely formal (finite) sums of such maps, like $2\sigma-5\tau$. When we do this we will refer to the elements not as singular $n$-simplices but instead as **singular $n$-chains**. Here's where we come back to talking about complexes: these abelian groups actually sit together really nicely in a complex
$$
    \ldots
    \xleftarrow{\partial_{n-1}} \sigma_{n-1}(X)
    \xleftarrow{\partial_n} \sigma_n(X)
    \xleftarrow{\partial_{n+1}}
    \ldots
$$
where we define the **boundary operator** $\partial_n$ by taking an alternating sum of omitted indices. What do we mean by that? Well, the topological $n$-simplex $\Delta^n$ has, in particular, $(n+1)$-many vertices, say $v_0,\ldots,v_n$. So every singular $n$-simplex $\sigma\colon\Delta^n\to X$ describes, in particular, $(n+1)$-many points $\sigma(v_0),\ldots,\sigma(v_n)$ in $X$. It's not true that we can entirely recover the whole image $\sigma(\Delta^n)\subseteq X$ from just these vertices, but they do describe a lot of information. For example, any subset $S$ of them uniquely defines a subspace of $\sigma(\Delta^n)$, simply by looking at the image of the subspace of $\Delta^n$ given by the span (i.e. convex hull) of the vertices in that subset. Notationally, we like to write $[\sigma_{s_1},\ldots,\sigma_{s_k}]$ to mean this "restriction" of $\sigma$ to the subset of vertices $S=\{s_1,\ldots,s_n\}$. This means that we can define
$$
    \begin{aligned}
        \partial_n\colon
        \sigma_n(X)
        &\longrightarrow \sigma_{n-1}(X)
    \\  \sigma
        &\longmapsto \sum_{i=0}^n (-1)^i [s_1,\ldots,s_{i-1},s_{i+1},\ldots,s_n]
    \end{aligned}
$$
If we want to really use some good notation that will save us a lot of time in the long run, we might write this "all the vertices apart from the $i$-th one" using some standard notation:
$$
    [s_1,\ldots,\widehat{s_i},\ldots,s_n]
    \coloneqq [s_1,\ldots,s_{i-1},s_{i+1},\ldots,s_n]
$$

Ok, great, but what about the fact that our arrows are all going left-to-right? Our differentials $\partial_n$ are *decreasing* degree, not increasing it! Indeed, this isn't a cochain complex at all, it's a regular old *chain* complex. Well we can fix this using the standard trick of turning things into co-things in algebra: taking duals. Pick some $\mathbb{Z}$-module[^6] $A$ and define the **singular $n$-cochains in $X$** as
$$
    \sigma^n(X)
    \coloneqq \Hom_{\Mod{\mathbb{Z}}}\big(\sigma_n(X),A\big)
$$
which is itself also a $\mathbb{Z}$-module. Actually, even better than this: $\Hom_{\Mod{\mathbb{Z}}}(-,A)$ is a (contravariant) *functor* and thus gives us morphisms
$$
    \Hom_{\Mod{\mathbb{Z}}}(\partial_n(-), A)
    \eqqcolon \partial^{n-1}
    \colon \sigma^{n-1}(X)\to\sigma^n(X).
$$
So we get the cochain complex that we've been hoping for all this time:
$$
    \ldots
    \xrightarrow{\partial^{n-1}} \sigma^n(X)
    \xrightarrow{\partial^n} \sigma^{n+1}(X)
    \xrightarrow{\partial^{n+1}} \ldots
$$
whence, finally, another cohomology definition!

::: {.rmenv title="Definition (Singular cohomology)"}
Let $X$ be a topological space. Its **singular cohomology** is the $\mathbb{Z}$-graded collection of abelian groups $(\HH^n(X;A)\mid n\in\mathbb{Z})$, where we define the $n$-th singular cohomology group as the $n$-th internal cohomology group of the cochain complex of singular cochains:
$$
    \HH^n(X;A)
    \coloneqq \sHH^n(\sigma^\bullet(X)).
$$
:::

There are three important things to note at this point:

1. *We never really specified anything about the abelian group $A$.*

    Indeed, we really should have called this **singular cohomology with coefficients in $A$**, but I was being lazy. From now on though I promise to follow what is the standard convention: *if we don't specify $A$, then we mean that $A=\mathbb{Z}$*. That is, "singular cohomology" means $\HH^n(X;\mathbb{Z})$.

2. *We're using a fancy $\sHH$ for internal cohomology but basically nobody does this.*

    Yeah, this is something that I went back and forth on for a while when writing this blog post. On one hand, I think it would be very nice and tidy and helpful to use different notation for different things, and indeed the very purpose of this post is to clear up what all the different notation means. On the other hand, it's sometimes detrimental to "lie" about standard conventions, even if they do feel like a slight abuse of notation. In the end, I looked at the first draft of this post, where I wrote $$\HH^n(X;A)\coloneqq\HH^n(\sigma^\bullet(X))$$
    and decided that I really didn't like it, and quite liked using $\sHH$ for internal cohomology. Anyway, I'm already being pedantic enough to insist on saying *internal* cohomology every single time, so I might as well use a different letter for it.

3. *I have said absolutely nothing about homology, or why we care about singular (co)homology, or what we learn at all about the topological space $X$ by doing this, or...*

    Yeah I've skipped a lot. I just really didn't want to fall into the trap of writing the homotopical equivalent of the Haskell community's "monads are burritos" introductory post where I say "homology counts holes and cohomology counts obstructions". Not because I think it's bad to have such posts, but because there are only finitely many units of energy in my fingers and brain to write blog posts, and I really don't wanna get any more sidetracked than I already am by writing this extended remark.

[^1]: I am joking of course, but "in every joke there is a kernel of truth"...
[^2]: Already I'm going to be making some choices about conventions that reveal my mathematical upbringing, but oh well.
[^3]: Can't use up all my blog post topics in one go!
[^4]: Maybe "nice" means "abelian", but it's really just that shorthand for saying "it's whatever it needs to be in order for everything I say to make sense (and ideally even be true)".
[^5]: By which I mean category theorists, of course.
[^6]: We start saying "$\mathbb{Z}$-module" instead of abelian group now. The definition is entirely equivalent, but it points us in the right direction for talking about abelian categories of modules over a ring.
