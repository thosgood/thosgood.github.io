---
title: Graded commutative rings and graded and commutative rings
kind: article
tags: ['algebraic-topology']
created_at: 2022-02-11
---

\providecommand{\HH}{\operatorname{H}}

One of the many reasons that teaching is fun is because you get to look back at things that you haven't seen in a while and try to understand them in light of what you've learnt in the meantime.
This means that you sometimes have the unexpected joy of having to teach something that always used to confuse you, but that now seems so much more straightforward!
I experienced this last year when teaching an algebraic topology course: I remember being super lost when it came to the graded ring structure of cohomology and getting very annoyed at Hatcher's book; now I look back and realise that it's really neat!
This post has a slightly different intended audience than normal: I'm just gonna assume that you know a bit about rings in the first half; the second half is aimed for somebody who's a reasonable way through a first course on algebraic topology (e.g. knows what the cup product in cohomology is).

<!-- more -->

# No algebraic topology

## Graded rings

Our starting point is the omnipresent *polynomial ring*: given a ring $S$, we define $S[x]$ to be the set of polynomials in one variable (namely $x$) with coefficients in $S$, so elements of $S[x]$ are of the form
$$
  f = s_n x^n + s_{n-1} x^{n-1} + \ldots + s_1 x + s_0
$$
where the $s_i$ are elements of $R$.
(More generally, we have the *polynomial ring in $n$ indeterminates*: $S[x_1,x_2,\ldots,x_n]$, which is entirely analogous, but with more than one variable; this is important, but we don't need to worry about it too much for now).

These rings are *really* nice, in lots of ways that we won't talk about today, but one *particularly* nice thing that they have is a *grading*, given by the *degree*.
Recall that the degree of a *monomial* is defined to be the "total power", i.e.
$$
  \deg(x^n) = n
$$
(we say *total* power to deal with the case of multiple variables, e.g. $\deg(x^my^n)=m+n$).
The degree behaves nicely under multiplication
$$
  \deg(x^m\cdot x^n) = m+n
$$
and we have a *unique* way of writing *any* polynomial $f\in S[x]$ as a sum of monomials, basically by definition of what it means to be a polynomial:
$$
  f = \sum_{i=0}^n r_i x^i.
$$

So let's do what we always do and generalise this to an abstract structure!

::: {.rmenv title="Definition"}
A ring $R$ is a *graded ring* if there exist abelian groups $(R_d)_{d\in\mathbb{N}}$, where $R_d\subseteq R$ for all $d\in\mathbb{N}$, such that

i. $R\cong\bigoplus_{d=0}^\infty R_d$;
ii. $R_d R_e\subseteq R_{d+e}$.

Given $r\in R\setminus\{0\}$, if there exists some $d\in\mathbb{N}$ such that $r\in R_d$, then we say that $r$ is *homogeneous of degree $d$*, and we write $|r|=d$.
:::

The prototypical example is the thing we started with: the polynomial ring $R=S[x]$ is a graded ring with $R_d\coloneqq\{sx^d \mid s\in S\}$; the more general polynomial ring $R=S[x_1,\ldots,x_n]$ in $n$ variables is a graded ring with $R_d\coloneqq\{s x_1^{m_1}x_2^{m_2}\cdots x_n^{m_n}\mid s\in S, m_1+m_2+\ldots+m_n=d\}$.


## Commutativity

Now let's talk about something confusing: what is a *graded commutative ring*?
Or should we say *commutative graded ring*?
Or should these two things be different?

Well, it makes sense that a graded commutative ring would just be a commutative ring that is graded, i.e. we parse it as "graded (commutative ring)".
Annoyingly, however, this is *not* the way that most algebraists or geometers will parse this!
If you want to talk about commutative rings that are graded, then your best bet is really to just say "a commutative ring that is graded", but if you want to be snappier, then I would advise that you say *commutative graded ring*.
Why am I making such a point out of this?
What do people mean when they actually say "graded commutative ring" then?

The answer lies in "bracketing" the adjectives in a different way, namely: "(graded commutative) ring".
But this just prompts the question: what does it mean for a ring to be "graded commutative"?

::: {.rmenv title="Definition"}
A ring $R$ is *graded commutative* if $R$ is a *graded* ring $R=\bigoplus_{d=0}^\infty R_d$ such that
$$
  rs = (-1)^{|r||s|}sr
$$
for all homogeneous elements $r,s\in R$.
:::

So this is a slightly odd definition: graded commutativity is like commutativity, but with a possible minus sign, depending on the degree of the (homogeneous) elements.^[Note that this condition extends to give some condition on the multiplication of arbitrary elements of $R$, since every element can be written (in a unique way) as a sum of homogeneous elements, by the fact that $R\cong\bigoplus_{d=0}^\infty R_d$.]
To understand this better, let's turn back to our good old friend $S[x]$.
If $S$ is commutative, then $S[x]$ is clearly commutative, but is it graded commutative?
Shockingly, no!
Indeed, we are asking if the following equality holds
$$
  x^2 = x\cdot x \overset{?}{=} (-1)^{|x||x|} x\cdot x = -x^2.
$$
We see that this only happens in two cases:

1. if $2=0$; or
2. if $x^2=0$.

The first one can happen (if $S$ is a field of characteristic $2$, for example, e.g. $\mathbb{Z}/2\mathbb{Z}$), but the second one cannot, by the very definition of $S[x]$.
*But* this second case does happen in the *ring of dual numbers* $S[x]/(x^2)$.

Going back to the polynomial ring $S[x]$, we could also do something entirely different and *define* $x$ to be of *degree $2$*.
That is, we are giving $S[x]$ a *different* graded ring structure: $S[x]\cong\bigoplus_{d=0}^\infty R_d$ where
$$
  R_d =
  \begin{cases}
    \{sx^d \mid s\in S\} &\text{if }d\text{ is even;}
  \\0 &\text{if }d\text{ is odd.}
  \end{cases}
$$
(After a little bit of thought, you can see that this is "the same as" simply looking at $S[y^2]$, where $y$ is an indeterminate of degree $1$ again).
Then we have that
$$
  (-1)^{|x||x|} x\cdot x = x^2
$$
and so this graded ring *is* graded commutative.

A nice little summary table would be helpful right about now (and, just in this table, we're going to make the assumption that **$S$ is commutative**).

| Graded ring | Commutative? | Graded commutative? |
| :---------: | :----------: | :-----------------: |
| $S[x]$ | ✅ | ❌ (**unless** $2=0$ in $S$) |
| $S[x]/(x^2)$ | ✅ | ✅ |
| $S[x^2]$ | ✅ | ✅ |

Let's look at one more example that we're going to need when it comes to doing some algebraic topology: the *exterior algebra* $\Lambda_S[\alpha_1,\ldots,\alpha_n]$ of a ring $S$ can be defined as the graded ring
$$
  \Lambda_S[\alpha_1,\ldots,\alpha_n] \coloneqq S[\alpha_1,\ldots,\alpha_n]/(\alpha_i^2,\alpha_i\alpha_j+\alpha_j\alpha_i)_{1\leq i,j\leq n}
$$
where each $\alpha_i$ is of degree $1$ (although, again, we can modify this if we want to).
Note that $\Lambda_S[\alpha]\cong S[\alpha]/(\alpha^2)$, i.e. *the exterior algebra of $S$ in one variable is exactly the ring of dual numbers*.

The exterior algebra is commutative (if $S$ is), but is it graded commutative?
Well it's enough to check the condition on the generators $\alpha_i$, but we see that
$$
  \alpha_i\alpha_j
  = -\alpha_j\alpha_i
  = (-1)^{|\alpha_i||\alpha_j|}\alpha_j\alpha_i
$$
where the first equality is exactly by the definition of $\Lambda_S[\alpha_1,\ldots,\alpha_n]$ (and note that, if $i=j$, then everything is zero, and we definitely have that $0=0$).

Back to our table:

| Graded ring | Commutative? | Graded commutative? |
| :---------: | :----------: | :-----------------: |
| $S[x]$ | ✅ | ❌ (**unless** $2=0$ in $S$) |
| $S[x^2]$ | ✅ | ✅ |
| $\Lambda_S[\alpha_1,\ldots,\alpha_n]$ | ✅ | ✅ |

(we've removed the row for $S[x]/(x^2)$, since this is just a specific example of the exterior algebra $\Lambda_S[\alpha_1,\ldots,\alpha_n]$ where $n=1$.)


## Freeness

Unrelated to the property of (graded) commutativity is that of being *free*.
For *commutative* rings, being free basically means being isomorphic to a polynomial ring in finitely many variables.
So $S[x]$ is free (as a commutative ring), as is $S[x^2]$, but $S[x]/(x^2)$ is *not* free (as a commutative ring) --- the latter has a nilpotent element (i.e. some $r$ such that $r^2=0$, namely $r=x$) and free commutative rings never have nilpotent elements, so it cannot be isomorphic to a free commutative ring.^[This is very similar to the fact that a group homomorphism must send an element of order $n$ to an element of order $m$ *such that $m$ divides $n$*.]

But note that I've been very careful to say "free *as a commutative ring*", and this is important: $\Lambda_S[\alpha]$ is **not** a free *commutative ring*, but it **is** a free *graded commutative ring*.
What do I mean by this?
I mean that, if we just use the fact that $\Lambda_S[\alpha]$ is a graded commutative ring, *forgetting all about how it's actually defined*, then we can recover the fact that $\alpha_i^2=0$ and $\alpha_i\alpha_j=-\alpha_j\alpha_i$ *without having to ask for it* (...most of the time).

That is, if we know that $\Lambda_S[\alpha_1,\ldots,\alpha_n]$ is graded commutative, then we know that
$$
  \alpha_i\cdot\alpha_i = (-1)^{|\alpha_i||\alpha_i|}\alpha_i\cdot\alpha_i = -\alpha_i\cdot\alpha_i
$$
which rearranges to give
$$
  2\alpha_i^2=0.
$$
But then, if we can *divide by $2$* (i.e. if $2$ is an invertible element) in our ring $S$, then we see that $\alpha^2$ *must be* equal to zero, automatically!
(The other relation that we need to impose, that $\alpha_i\alpha_j=-\alpha_j\alpha_i$ is exactly the definition of being graded commutative (since all our $\alpha_i$ are of degree $1$), so we don't even need to worry about enforcing that one separately!)

Of course, I'm going to put this in the table (and I'll write "gc-ring" to mean "graded commutative ring").

| Graded ring | Commutative? | Graded commutative? | Free (as a gc-ring) |
| :---------: | :----------: | :-----------------: | :-----------------: |
| $S[x]$ | ✅ | ❌ (**unless** $2=0$ in $S$) | ✅ |
| $S[x^d]$ | ✅ | ❌ (**unless** $2$ divides $d$) | ✅ |
| $\Lambda_S[\alpha_1,\ldots,\alpha_n]$ | ❌ (unless $n=1$) ✅ | | ❌ (**unless** $2$ is invertible in $S$) |

By now you have probably noticed that all of the difficulties and subtleties come from how the number $2$ behaves (except for the exterior algebra only being commutative when in one variable, but this isn't a "graded" property, so we'll ignore that one), and this is a very common thing to happen.^[Both number theorists and algebraic geometers get very tired of having to write "let $k$ be a field of characteristic not equal to $2$", since $2$ "behaves badly" for them; some algebraic topologists, on the other hand, get very excited when you say "calculate (co)homology with coefficients in a field of characteristic $2$", since $2$ "behaves nicely" for them. Basically, $2$ is a tricky number.]


# Some algebraic topology

Before diving into the applications, we just need one more abstract remark about graded rings: the tensor product $R\otimes S$ of two graded rings has a natural graded ring structure by setting
$$
  \deg(r\otimes s) \coloneqq \deg(r)+\deg(s)
$$
and defining the multiplication to have a sign that "makes things work nicely":
$$
  (r\otimes s)(r'\otimes s') \coloneqq (-1)^{|r'||s|}(rr')\otimes(ss')
$$
(note that the exponent uses the two "inner" terms, $r'$ and $s$, **not** $r$ and $s$, nor $r'$ and $s'$ (nor $r$ and $s'$, for that matter)).

What does this all have to do with algebraic topology?
Hopefully you've already seen the ring structure on cohomology (of a manifold), given by the cup product.
In fact, the cup product lets us assemble the cohomology groups into a *commutative graded ring* (this is indeed one justification for there being a minus sign in the definition of the cup product: it ensures graded commutativity!).


## Circles and spheres

*In what follows, we say "space" to mean "CW complex that is nice enough to satisfy whatever hypotheses the theorem in question might need".*

Here's a fun fact that we won't prove:

::: {.itenv title="Lemma"}
Let $X$ and $Y$ be spaces.
If $Y$ is such that $\HH^\bullet(Y)$ is *free* (as a graded commutative ring) and *finitely generated*, then
$$
  \HH^\bullet(X\times Y) \cong \HH^\bullet(X)\otimes\HH^\bullet(Y)
$$
(where $\iso$ means "isomorphic *as graded rings*").
:::

Using this, we can look at two examples.

::: {.rmenv title="Example 1"}
We know that
$$
  \HH^n(S^1) =
  \begin{cases}
    \mathbb{Z} &\text{if }n=0,1\text{;}
    0 &\text{otherwise.}
  \end{cases}
$$
If we denote by $\alpha$ the generator of $\HH^1(S^1)$, then
$$
  \alpha^2 \coloneqq \alpha\cup\alpha
$$
is an element of $\HH^2(S^1)$, but this group is zero, and so it must be the case that $\alpha^2=0$.
Thus
$$
  \HH^\bullet(S^1) \cong \mathbb{Z}\langle1\rangle \oplus \mathbb{Z}\langle\alpha\rangle/(\alpha^2)
  = \Lambda_{\mathbb{Z}}[\alpha]
$$
(where here the angled brackets mean "the abelian group generated by these elements").

But we know that $\Lambda_{\mathbb{Z}}[\alpha]$ is free as a graded commutative ring, and it has only one generator so it's also finitely generated; we can apply the Lemma above to get that
$$
  \HH^\bullet(S^1\times S^1)
  \cong \HH^\bullet(S^1)\otimes\HH^\bullet(S^1)
$$
but this is exactly $\Lambda_{\mathbb{Z}}[\alpha_1,\alpha_2]$ (where $\alpha_i$ is the generator of the first cohomology of the $i$-th copy of $S^1$).

Finally, recall that $\Lambda_{\mathbb{Z}}[\alpha_1,\alpha_2]$ is graded commutative but *not* commutative (i.e. $\alpha_1\alpha_2=-\alpha_2\alpha_1$).
:::

::: {.rmenv title="Example 2"}
We know that
$$
  \HH^n(S^2) =
  \begin{cases}
    \mathbb{Z} &\text{if }n=0,2\text{;}
    0 &\text{otherwise.}
  \end{cases}
$$
If we denote by $\beta$ the generator of $\HH^2(S^2)$, then
$$
  \beta^2 \coloneqq \beta\cup\beta
$$
is an element of $\HH^4(S^2)$, but this group is zero, and so it must be the case that $\beta^2=0$.
Thus
$$
  \HH^\bullet(S^2) \cong \mathbb{Z}\langle1\rangle \oplus \mathbb{Z}\langle\beta\rangle/(\beta^2)
  = \Lambda_{\mathbb{Z}}[\beta]
$$
where *$\beta$ is of degree $2$*.

As in the previous example, the Lemma gives us that
$$
  \HH^\bullet(S^2\times S^2)
  \cong \HH^\bullet(S^2)\otimes\HH^\bullet(S^2)
$$
which is exactly $\Lambda_{\mathbb{Z}}[\beta_1,\beta_2]$, but *where $\beta$ is of degree $2$* (we're repeating this because it's important).

Now, $\Lambda_{\mathbb{Z}}[\beta_1,\beta_2]$ is graded commutative (since it's a cohomology ring, and recall that these are always graded commutative, by the sign in the definition of the cup product), but we see that
$$
  \beta_1\beta_2
  = (-1)^{|\beta_1||\beta_2|} \beta_2\beta_1
  = (-1)^{4}\beta_2\beta_1
  = \beta_2\beta_1
$$
and so this cohomology ring is actually commutative!
:::

::: {.itenv title="Corollary"}
The cohomology rings of $S^1\times S^1$ and $S^2\times S^2$ are not isomorphic (because one is commutative and the other is not).
:::


## The Künneth theorem

What happens to our useful lemma if the cohomology ring $\HH^\bullet(Y)$ is finitely generated by *not* free?
That is (by the classification of finite groups), what if it has *torsion*?
The *Künneth theorem* tells us that this torsion is exactly the "correction term" needed to fix the Lemma.

::: {.itenv title="Corollary (to the Künneth theorem)"}
Let $X$ and $Y$ be spaces.
If $Y$ is such that $\HH^\bullet(Y)$ is finitely generated, then
$$
  \HH^\bullet(X\times Y)
  \cong (\HH^\bullet(X)\otimes\HH^\bullet(Y))
  \oplus \operatorname{Tor}_{\bullet+1}(\HH^\bullet(X),\HH^\bullet(Y))
$$
(note that this $\operatorname{Tor}$ term is zero if $\HH^\bullet(Y)$ is free^[Or if we work over a field instead of over $\mathbb{Z}$...], so this really is a generalisation of our previous lemma).
:::

::: {.itenv title="Example"}
We know that
$$
  \HH^n(\mathbb{RP}^2) =
  \begin{cases}
    \mathbb{Z} &\text{if }n=0\text{;}
    \mathbb{Z}/2\mathbb{Z} &\text{if }n=2\text{;}
    0 &\text{otherwise.}
  \end{cases}
$$
Doing some $\operatorname{Tor}$ calculations (use the fact that $\mathbb{Z}$ is free and thus flat (or even just projective) to see that $\operatorname{Tor}(\mathbb{Z},-)=\operatorname{Tor}(-,\mathbb{Z})=0$; use the fact that $\operatorname{Tor}(A,\mathbb{Z}/m\mathbb{Z})\cong\{a\in A\mid ma=0\}$ to see that $\operatorname{Tor}(\mathbb{Z}/2\mathbb{Z},\mathbb{Z}/2\mathbb{Z})\cong\mathbb{Z}/2\mathbb{Z}$), the above Corollary gives us that
$$
  \HH^n(\mathbb{RP}^2\times\mathbb{RP}^2) =
  \begin{cases}
    \mathbb{Z} &\text{if }n=0\text{;}
    (\mathbb{Z}/2\mathbb{Z})^2 &\text{if }n=2\text{;}
    \mathbb{Z}/2\mathbb{Z} &\text{if }n=3{;}
    \mathbb{Z}/2\mathbb{Z} &\text{if }n=4{;}
    0 &\text{otherwise.}
  \end{cases}
$$
We've written the case $n=3$ on a separate line because this is exactly the "correction term" given by the Künneth theorem, i.e. the previous Lemma would have given us everything else but would have said that $\HH^3=0$; Künneth tells us otherwise.
:::

::: {.rmenv title="Exercise"}
Calculate $\HH^\bullet(\mathbb{RP}^2\times\mathbb{RP}^2;\mathbb{Q}/\mathbb{Z})$.

*Hint: use the Universal Coefficient Theorem, or the long exact sequence associated to the short exact sequence $0\to\mathbb{Z}\hookrightarrow\mathbb{Q}\twoheadsrightarrow\mathbb{Q}/\mathbb{Z}\to0$, and recall that $\operatorname{Tor}(A,\mathbb{Q}/\mathbb{Z})\cong\operatorname{tors}(A)$, the torsion part of $A$.*
:::


## Some useful cohomology rings

Real projective spaces have pretty nice cohomology rings, but they differ in presentation depending on the parity of the dimension:

- $\HH^\bullet(\mathbb{RP}^{2n})\cong\mathbb{Z}[\beta]/(2\beta,\beta^{n+1})$, where $|\beta|=2$;
- $\HH^\bullet(\mathbb{RP}^{2n+1})\cong\mathbb{Z}[\beta,\varepsilon]/(2\beta,\beta^{n+1},\epsilon^2,\beta\epsilon)$, where $|\beta|=2$ and $|\varepsilon|=2n+1$ (here $\epsilon$ is the generator of $\HH^{2n+1}$).

What's nice is that, if we work with $\mathbb{Z}/2\mathbb{Z}$ coefficients (instead of $\mathbb{Z}$}), then we can write both cases together as one thing:

- $\HH^\bullet(\mathbb{RP}^n;\mathbb{Z}/2\mathbb{Z})\cong(\mathbb{Z}/2\mathbb{Z})[\alpha]/(\alpha^{n+1})$, where $|\alpha|=1$.

Given that $\mathbb{C}$ is $2$-dimensional over $\mathbb{R}$, complex projective space behaves much nicer, since we don't need to worry about parity:

- $\HH^\bullet(\mathbb{CP}^n)\cong\mathbb{Z}[\beta]/(\beta^{n+1})$, where $|\beta|=2$.

Finally, if you know how to define infinite dimensional projective spaces, then it's a very lovely cheeky little fact that the cohomology rings are just given by "taking the limit $n\to\infty$", i.e.

- $\HH^\bullet(\mathbb{RP}^\infty)\cong\mathbb{Z}[\alpha]$, where $|\alpha|=1$;
- $\HH^\bullet(\mathbb{CP}^\infty)\cong\mathbb{Z}[\beta]$, where $|\beta|=2$.

Nice!
