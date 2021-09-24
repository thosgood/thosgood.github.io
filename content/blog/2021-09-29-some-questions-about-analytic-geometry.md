---
title: Some questions about complex-analytic geometry
kind: article
tags: ['complex-geometry', 'algebraic-geometry', 'category-theory']
created_at: 2021-09-29
---

(Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.)

<!-- more -->

# The algebraic dictionary

(explain this table)

| Sheaves | Bundles¹ | Modules² |
|:--------|:--------|:--------|
| locally free | vector bundles | finitely generated and projective |
| coherent | complexes of vector bundles | finitely generated |
| quasi-coherent | complexes of vector bundles | arbitrary |

¹ _For quasi-projective Noetherian schemes._

² _For Noetherian affine schemes._

Note that here we can write a quasi-coherent sheaf as a (filtered) colimit of its coherent subsheaves, hence the fact that it can also be resolved by a complex of vector bundles (just maybe a really really big one).


# The analytic dictionary

| Sheaves | Bundles | Modules |
|:--------|:--------|:--------|
| locally free | vector bundles | ??? |
| coherent | complexes of vector bundles on the Čech nerve | ??? |
| "quasi-coherent" | ??? | ??? |

(we write "quasi-coherent" in scare quotes because we don't just mean "the algebraic definition", since this doesn't play nicely in the analytic world! e.g. the fact that every quasi-coherent sheaf on a scheme is a filtered colimit of its coherent subsheaves is _not_ true in the analytic setting; there are quasi-coherent sheaves on Stein spaces that have non-zero first sheaf cohomology, cf. [this math.stackexchange answer](https://math.stackexchange.com/questions/2840594/gaga-and-quasicoherent-sheaf/2841087#2841087))

(this thing that Daniel Litt said on Twitter about coherent sheaves corresponding to... their global-sections module?)


# Questions

(first, let me ask the questions vaguely)

1. How can I fill in this analytic dictionary?
2. In fact, what even is $\operatorname{Spec}$ in the analytic setting?
3. Is _Fréchet_ quasi-coherent the good thing to put in the analytic dictionary?

(now, in some more detail)

1. **to-do**

2. **to-do**

3. What analogous properties does Fréchet quasi-coherence satisfy to make it the "right" notion? e.g. does it arise as the right Kan extension of the pseudofunctor from commutative rings to categories which sends a ring to the category of modules over that ring? Here are some properties that I know it does satisfy: (**to-do** Theorem 4.3.6 from _Spectral Decompositions and Analytic Sheaves_)
