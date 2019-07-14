---
title: Twisting cochains and arbitrary dg-categories
layout: post
category: "maths"
tags: "category-theory"
comments: true
---

Having recently been thinking about twisting cochains (a major part of my thesis) a bit more, I think I better understand one reason why they are very useful (and why they were first introduced by Bondal and Kapranov), and that's in 'fixing' a small quirk about dg-categories that I didn't quite understand way back when I wrote [this post]({{ site.baseurl }}{% post_url 2018-04-26-derived-dg-triangulated-and-infinity-categories %}) about derived, dg-, and $A_\infty$-categories and their role in 'homotopy things'.

This isn't a long post and could probably instead be a tweet but then this blog would be a veritable ghost town.

<!--more-->

First of all, for the actual definitions of twisting/twisted cochains/complexes (the nomenclature varies wildly and seemingly inconsistently),[^7] I will shamelessly refer the interested reader to ~~some notes I wrote a while back~~. (update: these notes have been subsumed into my PhD thesis)

Secondly, the 'quirk' of dg-categories about which I'm talking[^1] is that, for a lot of people[^2], it is the (pre-)triangulated structure that is interesting.
This means that (as far as I am aware)[^3] an arbitrary dg-category lacks some sort of homotopic interpretation because it has no structure corresponding to _stability_ 'upstairs'.
Twisting cochains then, as they were introduced by Bondal and Kapranov[^4], are a sort of solution to this problem, in that (to quote from where else but the nLab) _"passing from a dg-category to its category of twisted complexes is a step towards enhancing it to a pretriangulated dg-category"_.[^5]
In essence, they give us the 'smallest' 'bigger' dg-category in which we have shifts and functorial cones.

Really I am just parroting back the reasons why these things were initially invented, but it's something that I hadn't fully appreciated, since I've been working with specific types of twisted complexes (ones that somehow correspond to projective/free things and concentrated in a single degree) that really arise in what appears (to me) to be a completely different manner: namely in the setting of (O'Brian), Toledo, and Tong[^6] where they are (to be vague) thought of as resolutions of coherent sheaves, or first-order perturbations of certain bicomplexes by flat connections.

I really have no geometric/homotopic intuition as to why this specific case of twisted complexes corresponds thusly, and haven't been able to find any references at all.
Any ideas?

---

# Footnotes

[^1]: Having hidden this part in the main post and not the excerpt makes me feel like I'm writing the mathematical equivalent of click-bait journalism. Next will come posts with titles such as _"Nine functors that you wouldn't believe have derived counterparts — number six will shock you!"_ and _"You Will Laugh And Then Cry When You See What This Child Did With The Grothendieck Construction"_. I apologise in advance.
[^2]: [weasel words] [citation needed]
[^3]: which is, admittedly, best measured on the Planck scale.
[^4]:  A. I. Bondal, M. M. Kapranov, “Enhanced triangulated categories”, Mat. Sb., 181:5 (1990), 669–683; Math. USSR-Sb., 70:1 (1991), 93–107.
[^5]: [https://ncatlab.org/nlab/show/twisted+complex](https://ncatlab.org/nlab/show/twisted+complex)
[^6]: A bunch of papers, but in particular e.g. D. Toledo and Y. L. L. Tong, "Duality and Intersection Theory in Complex Manifolds. I.", Math. Ann., 237 (1978), 41—77.
[^7]: Although for me, at least, I (tend to) use _twisted complex_ to refer to the concept of Bondal and Kapranov, and _twisting cochain_ to refer to the concept of (O'Brian), Toledo, and Tong.