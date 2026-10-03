---
title: How does cohomology relate to cohomology?
part: Part 3
kind: article
tags: ['maths', 'homological-algebra']
created_at: 2026-10-03
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

Having read the previous part of this series, we know all about the sheaf of holomorphic functions on a complex manifold. This means I now have to hold good on my promise and get back to talking about cohomologies. But...

<!-- more -->

I think it's often helpful to get a glimpse of what we're working towards before we start actually working towards it. I remember the amount of turmoil I experienced writing my thesis by reading the phrase "by a standard spectral sequence argument" and not really knowing what that actually meant when it came to doing an explicit calculation. I think that it's quite common to have the same experience for cohomological arguments. And I'm not saying that this is bad — it really is the case that there are some standard sentences that we would end up saying so repeatedly otherwise — but I think it's nice to see the details for once. So here's a sentence that I could imagine writing (and almost certainly have actually written in correspondence with coauthors) when talking about a cohomological argument:

> By taking a nice enough cover, the standard arguments tell us that we can compute singular cohomology $\mathrm{H}^r(X;\mathbb{C})$ via the Čech–de Rham bicomplex $\operatorname{Tot}^r\check{\mathscr{C}}^\bullet(\Omega_X^\bullet)$.

So what do I mean by "the standard arguments" here? And what is this sentence actually saying? In short, it's a repeated syllogism of statements concerning when various types of cohomology actually coincide.

::: {.rmenv title="Suggestion"}
Before writing more words, let me just say that if you don't find "reading ahead" a helpful practice then you should just skip over the rest of this section. It's all just a big mess of things that we have not yet seen.
:::

Here's what I might write if I wanted to be more explicit about the actual "standard" facts that I'm appealing to:

> By taking a Stein cover $\mathcal{U}$ and using the fact that the sheaves $\Omega_X^i$ are coherent, Cartan's Theorem B tells us that the cohomology of the total complex of the Čech–de Rham bicomplex at $\mathcal{U}$ computes the Čech cohomology of the de Rham complex:
>$$\check{\mathbb{H}}^r(\mathcal{U};\Omega_X^\bullet)\cong\check{\mathbb{H}}^r(X;\Omega_X^\bullet).\tag{1}$$Next, since $X$ is paracompact and, again, Cartan's Theorem B, we know that Čech cohomology computes sheaf cohomology:
> $$\check{\mathbb{H}}^r(X;\Omega_X^\bullet)\cong\mathbb{H}^r(X;\Omega_X^\bullet).\tag{2}$$
> Finally, the (holomorphic) de Rham theorem tells us that the sheaf cohomology of the de Rham complex computes the singular cohomology:
> $$\mathbb{H}^r(X;\Omega_X^\bullet)\cong\mathrm{H}^r(X;\mathbb{C}).\tag{3}$$

Irrelevant of what all the words mean, hopefully you can see the idea here: we want to end up computing this singular cohomology $\mathrm{H}^r(X;\mathbb{C})$ that we saw all the way back in Part 1 (well, almost, modulo the fact that here I've written $\mathbb{C}$ instead of $\mathbb{Z}$, but we can ignore that difference for now), but what we actually know how to compute is something a priori very different, namely this thing denoted $\check{\mathbb{H}}^r(\mathcal{U};\Omega_X^\bullet)$. But because mathematics is our friend we can get to the former from the latter by taking three steps, where each one is some argument saying that "well look I actually computed this very specific thing but it turns out that all the choices that I made didn't actually matter". Indeed, as we will eventually see, the isomorphism in (1) is saying that we didn't have to actually take some colimit over *all possible* covers but we could instead just pick a specific one, as long as it's nice enough; the isomorphism in (2) is saying that we didn't actually have to work with the space $X$ but instead "just" with a colimit over all possible covers of $X$ (but somehow this is actually easier!); and the isomorphism in (3) is saying that we didn't actually have to look at the topological structure of $X$ (recall that we defined singular cohomology by looking at the groups of singular $n$-simplices sitting inside of $X$) but could instead just work with some purely algebraic gadget that we can essentially do linear algebra on.

This sequence of arguments turns up everywhere in calculations of cohomology, but particularly so in geometry, where we are interested in how all the different structures that our spaces have (topological, algebraic, analytic, and maybe more) do or don't work well together. And this general pattern is something that we should keep in mind when we (finally, *finally*) introduce sheaf cohomology, hypercohomology, and Čech cohomology:

> To show that one cohomology "computes" another cohomology we apply **acyclicity** theorems over and over until we get from the thing that we *can* compute to the thing that we *want* to compute.

These "acyclicity" theorems are thus a key part of any explanation of how these cohomologies all talk with one another. Depending on what "flavour" of cohomology you're working with, they will take different forms. Roughly:

- *topological* cohomologies really like *contractible* subsets and *locally constant* coefficients
- *algebraic* cohomologies really like *affine* subsets and *quasi-coherent* coefficients
- *complex-analytic* (resp. *real-analytic*) cohomologies really like *Stein* (resp. *coherent analytic*) subsets and *coherent* coefficients.

There's another beautiful story about Cartan-type acyclicity theorems that is actually a bit of a mystery to me, and I think there is some interesting research (or, at least, literature review and exposition) to be done here.[^15] But not today!

## Quasi-isomorphisms

The main takeaway of that long introduction is that it's going to be a bit hopeless to introduce a bunch of new meanings of the word "cohomology" if we don't have the right language to say when two different meanings do or do not coincide. So let's learn about one of my other favourite mathematical things: **quasi-isomorphisms**. As a brief reminder (because there has been so much rambling in the meantime), recall that a morphism $f^\bullet\colon(C^\bullet,d^\bullet)\to(D^\bullet,e^\bullet)$ of (cochain) complexes is merely a collection of "degree-wise" morphisms $f^i\colon C^i\to D^i$, and if these morphisms happen to commute with the differentials $d^\bullet$ and $e^\bullet$ then we call the morphism a **chain map**.[^16]

::: {.rmenv title="Definition (Quasi-isomorphism)"}
Let $f^\bullet\colon (C^\bullet,d^\bullet)\to(D^\bullet,e^\bullet)$ be a chain map of complexes. We say that $f^\bullet$ is a **quasi-isomorphism** if it "induces an isomorphism in cohomology", i.e. if the induced maps $\sHH^i(f^\bullet)\colon\sHH^i(C^\bullet)\to\sHH^i(D^\bullet)$ are isomorphisms for all $i\in\mathbb{Z}$.
:::

An important exercise is to unwrap what these "induced maps" $\sHH^i(f^\bullet)$ actually are, and to see why we really require $f^\bullet$ to be a chain map. Recall that $\sHH^i(C^\bullet)$ is defined as $\Ker{d^n}/\Im{d^{n-1}}$, and so the "obvious" thing to try is to say that $\sHH^i(f^\bullet)$ is simply the restriction of $f^i$ to $\Ker{d^n}$. That is, we set
$$
    \sHH^i(f^\bullet)
    \coloneqq f^i|\Ker{d^n}
$$
and now just need to show that this is indeed well defined, which means showing that the following two properties hold:

1. The restriction in the source lands in the restriction in the target: $\Im(f^i|\Ker{d^n})\subseteq\Ker e^n$.
2. The map respects the quotients: $[c]=[c']\in\sHH^i(C^\bullet)\iff [(f^i|\Ker{d^n})(c)]=[(f^i|\Ker{d^n})(c')\in\sHH^i(D^\bullet)]$.

Again, the hypothesis that $f^\bullet$ is a chain map (i.e. respects the differentials) is key here.

The very name of quasi-isomorphisms suggest that they should have some relation to isomorphisms. An **isomorphism** of complexes is a chain map with an inverse that is also a chain map. Unravelling this definition, we see that an isomorphism of complexes is really just a chain map $f^\bullet$ such that each $f^i$ is an isomorphism.  Now, it is not hard to show that every isomorphism is also a quasi-isomorphism, but the converse is definitely not true (as we will soon show in an example). But quasi-isomorphisms (just like isomorphisms) satisfy the 2-out-of-3 property: if we have a composable pair of morphisms
$$
    C^\bullet\xrightarrow{f^\bullet}D^\bullet\xrightarrow{g^\bullet}E^\bullet
$$
and we set $h^\bullet=g^\bullet f^\bullet$, then if any two out of the three morphisms $f^\bullet$, $g^\bullet$, and $h^\bullet$ are quasi isomorphisms, then so too is the third. This tells us, for example, that quasi-isomorphisms are closed under composition (apply the statement to $f^\bullet$ and $g^\bullet$). This 2-out-of-3 property is something that will prove to be very useful later on (even if I forget to mention it), because it captures a key behaviour of "morphisms that deserve to be called weak equivalences".

So quasi-isomorphisms are a generalisation of isomorphisms, but why are they a *good* generalisation? Here I'll just give the cheap answer: we're only interested in cochain complexes for their cohomology, so we shouldn't really mind whether or not two complexes are the same, as long as they have the same cohomology. Let's give an example.

Consider the cochain complexes (of abelian groups)
$$
\begin{array}{rrcl}
    C^\bullet \coloneqq & \mathbb{Z} & \xrightarrow{\cdot 2} & \mathbb{Z}
    \\ D^\bullet\coloneqq & 0 & \to & \mathbb{Z}/2\mathbb{Z}
\end{array}
$$
(where we write $\cdot2$ to mean the map $n\mapsto 2n$), and define a chain map $f^\bullet\colon C^\bullet\to D^\bullet$ by
$$
\begin{CD}
    \mathbb{Z} @>{\cdot2}>> \mathbb{Z}
    \\ @VVV @VV{\mod2}V
    \\0 @>>> \mathbb{Z}/2\mathbb{Z}
\end{CD}
$$
We can easily see this to be a chain map, since the path $\to\circ\downarrow$ is zero by virtue of factoring through $0$, and the path $\downarrow\circ\to$ is zero since if we double a number and then take its value modulo 2 we get zero; the diagram commutes.

Note that there is *no way at all* that $f^\bullet$ could ever be an isomorphism, since in particular the map $f^0\colon\mathbb{Z}\to0$ cannot be an isomorphism. But $f^\bullet$ *is* a quasi-isomorphism. To see this, we have to calculate the cohomology of $C^\bullet$ and $D^\bullet$ and show that the induced maps $\sHH^i(f^\bullet)$ are isomorphisms. First, the cohomologies:
$$
\begin{aligned}
    \sHH^i(C^\bullet)
    &= \left( \frac{\Ker(\cdot 2)}{\Im(0\to\mathbb{Z})} \longrightarrow \frac{\Ker(\mathbb{Z}\to0)}{\Im(\cdot2)} \right)
    \\&= \left( \frac{0}{0} \longrightarrow \frac{\mathbb{Z}}{2\mathbb{Z}} \right)
    \\&= \left( 0 \longrightarrow \mathbb{Z}/2\mathbb{Z} \right)
    \\[1em]\sHH^i(D^\bullet) &= \left( \frac{\Ker(0\to0)}{\Im(0\to0)} \longrightarrow \frac{\Ker(\mathbb{Z}/2\mathbb{Z}\to0)}{\Im(0\to\mathbb{Z}/2\mathbb{Z})} \right)
    \\&= \left( \frac{0}{0} \longrightarrow \frac{\mathbb{Z}/2\mathbb{Z}}{0} \right)
    \\&= \left( 0 \longrightarrow \mathbb{Z}/2\mathbb{Z} \right)
\end{aligned}
$$
And now we have to repeat[^17] a very important warning: *two objects being isomorphic is very different from having an explicit isomorphism between them*. Here, for example, we see that the cohomologies $\sHH^\bullet(C)$ and $\sHH^\bullet(D)$ are clearly isomorphic (they are identical!). But the question is *not* "do $C^\bullet$ and $D^\bullet$ have isomorphic cohomologies?"; the question is "does the morphism $f^\bullet$ witness the fact that $C^\bullet$ and $D^\bullet$ have isomorphic cohomologies?". Here the answer is a happy one: $\sHH^{0}(f^\bullet)=0\colon0\to0$ is an isomorphism of the zero object with itself, and $\sHH^{1}(f^\bullet)=\id\colon\mathbb{Z}/2\mathbb{Z}\to\mathbb{Z}/2\mathbb{Z}$ is an identity isomorphism. So $f^\bullet$ is a quasi-isomorphism, despite not being an isomorphism.

Returning to this subtle (but important) distinction between "seeing that two things are isomorphic" and "having a morphism that induces an isomorphism between two things", we can ask ourselves a question: by just looking at $C^\bullet$ and $D^\bullet$ in this example, we knew for a fact that we could never find an isomorphism between them; by just looking at $\sHH^\bullet(C)$ and $\sHH^\bullet(D)$ it seemed very hopeful that we would be able to find a quasi-isomorphism, because these cohomologies were identical, but can we be *sure* that we would have been able to find one?

Before answering this question, it's worth carrying on with the example above (which is a sort of canonical example, largely because it allows us to point out all these weird quirks). If quasi-isomorphisms are a generalisation of isomorphisms, and isomorphisms are morphisms that have inverses, then do quasi-isomorphisms have some sort of "quasi-inverse"? This is where things get nasty (but in a way that turns out to actually be very satisfying, once we get some more homological algebra in our toolkit). We gave a specific quasi-isomorphism $f^\bullet\colon C^\bullet\to D^\bullet$ above, so let's just look at trying to find a "quasi-inverse" for this. Well, even if we don't know what a good definition for a quasi-inverse would be, it makes sense that it should at the very least be a map (maybe not necessarily even a chain map) $g^\bullet\colon D^\bullet\to C^\bullet$ such that... some nice condition is satisfied. But $\Hom(D^\bullet,C^\bullet)=0$! That is, there is only one map (which does happen to be a chain map, trivially) from $D^\bullet$ to $C^\bullet$, and that is the zero map. This means that any condition we try to phrase in terms of $g^\bullet f^\bullet$ or $f^\bullet g^\bullet$, or even something more complicated like $g^jf^i$ and $f^kg^\ell$, is going to be vacuous here, because $g^\bullet$ is identically zero, and anything composed with zero is zero.

OK, so let's actually pin down some definitions and say what's happening here in more straightforward terms. It turns out that the "obvious" definition of quasi-inverse is indeed the good one.

::: {.rmenv title="Definition (Quasi-inverse)"}
Let $f^\bullet\colon C^\bullet\to D^\bullet$ and $g^\bullet\colon D^\bullet\to C^\bullet$ be chain maps. We say that $f^\bullet$ and $g^\bullet$ are **quasi-inverse** to one another if $\sHH^\bullet(f)$ and $\sHH^\bullet(g)$ are inverse to one another (and are thus, in particular, both isomorphisms).
:::

But...

::: {.itenv title="Proposition"}
Not every quasi-isomorphism admits a quasi-inverse. That is, although an isomorphism $\sHH^\bullet(f)$ admits, by definition, an inverse $(\sHH^\bullet(f))^{-1}$, it is *not* the case that there exists some $g^\bullet$ such that $(\sHH^\bullet(f))^{-1}=\sHH^\bullet(g)$.
:::

Here is where I really have to bite my tongue[^18] because this story leads directly into the story of model categories, and homotopy equivalences and weak homotopy equivalences, and Whitehead's theorem, and ... lots of other things that I'd love to talk about. But no! Not today!

Let's just end this meandering post with a question, and an unjustified answer. Namely, if we have some quasi-isomorphism, can we immediately tell whether or not we'll be able to find a quasi-inverse? Well, here's a sufficient condition for a quasi-isomorphism to admit a quasi-inverse: the complexes $C^\bullet$ and $D^\bullet$ consist only of free modules. Here's an *even better* sufficient condition: the complexes $C^\bullet$ and $D^\bullet$ consist only of [**projective** modules](https://en.wikipedia.org/wiki/Projective_module). Both of these conditions might feel a bit odd: they don't actually mention any properties about the quasi-isomorphism itself, just its source and target. But really what we're noticing is a statement about the **hom-space** between $C^\bullet$ and $D^\bullet$; we're saying something about the value of the bifunctor $(C,D)\mapsto\Hom_{\mathrm{q-iso}}(C,D)$ on particularly nice objects.

But here's the *real* question: will I finally get around to talking about sheaf cohomology in the next blog post? Who knows, who knows.

[^15]: See [this question](https://mathoverflow.net/questions/472618/converses-to-cartans-theorem-b) and [this question](https://mathoverflow.net/questions/472300/smooth-analogue-of-cartans-theorem-b) on MathOverflow. For bonus points, write an answer to them!

[^16]: It's only typing this now that I wonder if the terminology **cochain map** is ever used. I've never seen it myself, and it would make a lot more sense, but I suppose that there are already so many "co" in "cohomology of cochain complexes" (and even more if you throw in "coherent" somewhere, even though that's cheating because that doesn't mean the "co" of something "herent").

[^17]: I can't remember if I've already given this warning in this blog post series or if I've just repeated it so many times in my life that I feel like I must have already said it here.

[^18]: Bite my fingers?
