---
title: Virtual Double Categories Workshop
kind: article
tags: ['category-theory']
created_at: 2022-12-03
---

I now realise two things: firstly, I haven't posted anything in really quite a while; secondly, I should have written this specific blog post a week ago.
Over the past five days, [Bryce Clarke](https://bryceclarke.github.io) and I have been running the Virtual Double Categories Workshop (a "fun" pun, since the workshop was entirely online, and there is a notion of a double category called "virtual").
The speakers were incredible, both in terms of the talks they gave, in their attitude and enthusiasm for the workshop, and in the variety of their interests.
You can find abstracts, slides, and recordings of the talks on [the workshop webpage](https://bryceclarke.github.io/virtual-double-categories-workshop/), but if you want to hear a bit more about my personal interest in double categories and how this workshop came about, then read on.

<!-- more -->

Back in 2019 I wrote [a very cursory post](https://thosgood.com/blog/2019/07/15/more-than-one-less-than-three/) about 2-categories and double categories because I'd heard so much about them at CT2019, and I figured I should start learning something about them.
Originally I found them interesting just for their own sake: I think I've always found definitions particularly interesting in mathematics, and seeing a new structure that's meant to generalise or build upon something you already know is pretty fascinating to me.
But then thesis writing reared its head and I went back to the maths I was focusing on, which didn't seem to have much relevance to 2-categorical stuff.

Anyway, fast forward a bunch of years to this summer, when I was in Glasgow for ACT2022, talking about [some joint work](https://doi.org/10.3934/mine.2023036) (summarised in two blog posts, [here](https://topos.site/blog/2022/04/diagrammatic-equations-and-multiphysics-part-1/) and [here](https://topos.site/blog/2022/04/diagrammatic-equations-and-multiphysics-part-2/)) with Evan Patterson, Andrew Baas, and James Fairbanks on a category-theoretic approach to (P)DEs using the language of diagram categories, and suddenly double categories seemed to turn up again.
Firstly, Evan and I had been discussing a "higher" version of initial functors, which appealed to some inherent 2-categorical structure found in diagram categories, and which might resolve some of the more conceptually unsatisfying things we had come across in the theoretical aspect of this diagrammatic differential equations work.
Secondly, it looked like moving up to double categories would be necessary if we wanted to extend the work to talk about multi-domain/mixed-dimensional problems.
Thirdly, and somewhat unrelatedly, I saw Bryce again, having first spoken to him (very briefly) all the way back in CT2019.

It would be exceedingly generous to describe my understanding of lenses as even "passable", and yet I can quite honestly say that some of my favourite maths talks I've seen over the past few years have been Bryce's on [his work on internal lenses](https://arxiv.org/abs/2009.06835) and, more recently, on their links to [algebraic weak factorisation systems](https://www.youtube.com/watch?v=UyBz2uS7Ark).
Bryce has always been very welcoming with the questions I've asked him after his talks, which have usually been basically the same: "why does this remind me so much of the story of derived categories and localisation?" (something I've written about a few times before --- most recently [here](https://topos.site/blog/2021/11/left-adjoints-lenses-and-localisation/)).
Anyway, we got to talking over lunch one day, and he mentioned that he was thinking of organising an online workshop on double categories, and wanted to know a bit about how I've helped to run some online seminars in the past.
Knowing that I would attend such a workshop anyway, I offered to help with the technical aspects, and then a few months later he emailed me a list of speakers he thought would be good to invite, and things started to fall into place.
Organising an online event is, in many many ways, much simpler than an in-person one --- no room bookings, catering, accommodation, etc. --- and yet it's somehow a bit stressful in an entirely different way (*will people turn up?* *what if my internet cuts out?* *what if a speaker's internet cuts out?* *what time zone is best to do each talk in?*).
But last week things ran pretty much as smoothly as possible, and it seemed like everybody involved got something out of the workshop.
Once again, I'd really like to thank all of the speakers --- I wish I had the time and energy to write about all of the talks individually, but let me just mention a few that were particularly relevant to the thing I've been thinking about recently.

Before I go any further, I really do recommend that you look at the abstracts on [the workshop webpage](https://bryceclarke.github.io/virtual-double-categories-workshop/) yourself, because the variety of topics, given that all speakers were asked to talk about double categories, is really quite astonishing: formal category theory, size issues, cybernetics, higher homotopy theory, coloured symmetric sequences, monoidal things, rewriting theory, and operads, to name but a few.

Lyne Moser gave [a talk on representation theorems for enriched categories](https://www.youtube.com/watch?v=RBngz7WXaJw), investigating the question of when universal properties could be stated in terms of existence of representable objects.
This is something which works perfectly fine in the 1-categorical setting (a limit exists if and only if a certain functor is representable if and only if a certain terminal object exists), but becomes difficult the moment you move up to 2-categories.
The thing that really stood out to me though was an explanation of how 2-categories relate to double categories, given by answering the even bigger, more general question that I had been wondering about: how do enriched categories relate to internal categories?
To say that a category is $\mathcal{V}$-enriched means that its hom-sets are actually objects of $\mathcal{V}$, but to say that it is internal to $\mathcal{V}$ *also* means (in particular) that its hom-sets are actually objects of $\mathcal{V}$.
It turns out that $\mathcal{V}$-enriched categories sit fully faithfully inside categories internal to $\mathcal{V}$, and the inclusion has a right adjoint.
Lyne explained how this could be used to give an alternative proof of these representation theorems.

John Bourke [spoke about different flavours of factorisation systems via double categories](https://www.youtube.com/watch?v=Zz8NXrDzac4), and this reminded me of the left-adjoint/lenses/localisation story that I mentioned always asking Bryce about.
I had wondered if there was something interesting to be gained from looking at a double category whose arrows in one direction were fibrations, and in the other direction were cofibrations, but John showed that one "should" instead look at *two* double categories: both with arbitrary arrows in one direction, and then arrows from the left (resp. right) part of the factorisation system in the other direction.
Using this, he explained how to axiomatise various types of factorisation systems in the language of double categories.
A particularly interesting question/suggestion was raised by somebody (whose name escapes me, I'm sorry) [after the talk](https://youtu.be/Zz8NXrDzac4?t=3300): maybe it would be worth looking at the *triple* category which has arbitrary morphisms in one direction, and then the left and right parts of the factorisation system in the other two directions.
Something that I've been thinking about ever since that conversation is how, if you take two squares
$$
  \begin{CD}
    X @>{f}>> X'
  \\@V{i}VV @VV{i'}V
  \\Y @>>> Y'
  \end{CD}
  \qquad\qquad
  \begin{CD}
    X @>{f}>> X'
  \\@V{p}VV @VV{p'}V
  \\Z @>>> Z'
  \end{CD}
$$
where $f$ is arbitrary, $i$ and $i'$ are in the left part of the factorisation system, and $p$ and $p'$ in the right part, then you can think about "gluing them together along $f$" to get the diagram
$$
  \begin{CD}
    Y @>>> Y'
  \\@A{i}AA @AA{i'}A
  \\X @>>> X'
  \\@V{p}VV @VV{p'}V
  \\Z @>>> Z'
  \end{CD}
$$
which looks exactly like a 2-morphism of spans, or a cell in $\mathbb{S}\mathrm{pan}_{\mathrm{LR}}$ (where spans have their left leg in the left part of the factorisation system, and their right leg in the right part).
In the case where you don't quite have a factorisation system, but something "close", this category of spans turns up in geometry: a colleague (and friend) here at Stockholm recently wrote a paper (["A descent principle for compact support extensions of functors"](https://arxiv.org/abs/2204.08968)) about how such spans can be used to describe when arbitrary cohomology theories have compactly supported versions.
I'd love to better understand what is actually going on here, even without talking about factorisation systems: if we glue together two double categories, we get some double category of spans; can we formalise this, and does it tell us something?I'd love to better understand what is actually going on here, even without talking about factorisation systems: if we glue together two double categories, we get some double category of spans; can we formalise this, and does it tell us something?

One last talk I'd like to mention is Matteo Capucci's [talk on categorical systems theory and categorical cybernetics](https://www.youtube.com/watch?v=wtgfyjFIHBQ), where he mentioned the specific example of lenses and how they form a double category.
Something that's already "well known" (see e.g. Example 3.8 in ["Generalized Lens Categories via functors $\mathcal{C}^\mathrm{op}\to\mathsf{Cat}$"](https://arxiv.org/abs/1908.02202)) is how the Grothendieck construction/category of elements/generalised lens construction (depending on your preferred nomenclature) can give you the category of ringed spaces: objects are pairs $(X,\mathcal{O}_X)$, with $X$ a space and $\mathcal{O}_X$ a sheaf of rings on $X$; morphisms $(X,\mathcal{O}_X)\to(Y,\mathcal{O}_Y)$ are pairs $(f_0,f^\sharp)$, with $f_0\colon X\to Y$ and $f^\sharp\colon f_0^*\mathcal{O}_Y\to\mathcal{O}_X$.
But sometimes we want to consider the category of sheaves on spaces as having different morphisms --- if the space is the same, then we want the map of sheaves to go in the "forwards" direction: $\varphi\colon(X,\mathcal{O}_X)\to(X,\mathcal{O}'_X)$ should be a morphism of sheaves $\varphi\colon\mathcal{O}_X\to\mathcal{O}'_X$.
These two notions of morphisms of pairs consisting of a space and a sheaf on the space (one where we think of the pair as a ringed space, and the other where we think of the pair as an element of $\mathsf{Sh}(X)$ for some fixed $X$) seem to be exactly the two notions that Matteo described.
It seems like an interesting question for algebraic geometers: is this double category of "sheaves on spaces" useful?
At the very least, it seems to be a nice and tidy way of expressing the two flavours of sheaf morphism geometers usually care about!

Finally, I would like to thank Andrée Ehresmann, who surprised us at [the end of David Jaz Myers' talk](https://www.youtube.com/watch?v=zB_ifewP8Yk) with a few words, telling us a little bit about the history of double categories (since it was indeed her late husband who first wrote down a definition).
This was a lovely touch to the end of the workshop.

There are so many other things I would like to write about from all the other talks, but I'm rather tired from the week of late nights, and I still haven't gotten back into the swing of blogging, so I'm going to leave it here for now.
As always, I'd love to hear from any of you if you have any thoughts --- I'm not on Twitter any longer (and I never got around to fixing comments on this blog), but you can always drop me an email, or I'm now semi-active (but rarely) [on Mathstodon](https://mathstodon.xyz/@thosgood).
