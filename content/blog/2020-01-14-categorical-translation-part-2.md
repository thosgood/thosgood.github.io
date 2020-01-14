---
title: Categorical translation for mathematical language (Part 2)
kind: article
tags: ['category-theory', 'translation', 'software']
created_at: 2020-01-14
---

After my [previous post](https://thosgood.com/blog/2019/11/07/categorical-translation-part-1.html), I got the chance to _(a)_ spend a bit of time thinking about things, and _(b)_ talk to [Jade Master](https://sites.google.com/view/jadeedenstarmaster/home) on Twitter.
Rather than going back to edit my original post, I decided to turn this into more of a series.
Here are some new thoughts (but not really any _visible_ progress) on the whole kit and caboodle.^[I realise that, despite writing about how to write mathematics in a language-independent way, I use a lot of little phrases that maybe aren't very easy to understand for foreign speakers. I understand the irony of this, but, living abroad, I do miss such words, because they're quite fun to say, and so I do go somewhat over the top when it comes to these blog posts. Sorry.]

<!-- more -->

# The base category

The first thing that Jade said to me was something that I only very briefly touched upon originally, and it was about the choice of 'base' language.
That is, if we're talking about mathematical sentences, then it really does make sense to have at least some sort of first order logic already baked in to our base category, or to make it a boolean topos, or something similar.
One problem with this is that I have never taken a course on logic, so I have no real idea what 'first order logic' actually means, and I have (shamefully) only ever used my copy of Mac Lane & Moerdijk's ''Sheaves in geometry and logic'' as a reference book on sheaves in _geometry_, and have never really sat down to give it a proper read.

So, for me, the first step in the formalisation of this stuff is to sit down and actually learn some logic.
This would hopefully answer one question I sort of skirted around: ''how simple can our language be whilst still being able to express complex theorems and (more difficult-ly) proofs?''

Indeed, the pregroup formalism that I worked with last time doesn't seem to be intrinsic to the approach: once _any_ base language category is chosen, everything is given by ''just'' applying the Grothendieck construction (where here the scare quotes allude to the fact that I couldn't quite figure out the details for the morphisms in the case of pregroups).
In fact, taking this one step further, I realise that my only 'contribution' so far has been the very simple idea that _languages are fibred over some universal language_.
As Jade pointed out to me, this is somewhat reminiscent of dependent types in HoTT.

# Fibrations and dependent types

Before talking about dependent types, I first wanted to mention something that I realised when rereading my last post.
I said that every language comes with a projection down to the base category, and so we want to look at fibres over this category.
But when I then gave the JSON dictionary I had been writing, things weren't organised this way, but somehow transpose to this.
That is, I didn't have a French dictionary, a Spanish dictionary, and so on, but instead a $\mathrm{schemes}$ dictionary, which consisted of all the translations and adjectives and information about the word $\mathrm{scheme}$.
In other words, the JSON file looks more like something fibred over a very boring category: the set whose elements are just the names of the languages, so that $\mathrm{scheme}^{-1}(\mathsf{Fr})$ was the French entry for the word (containing all the adjectives and so on).

This reminds me of a part from Fong and Spivak's ''An introduction to applied category theory'' (or ''Seven Sketches''), where they talk about databases whose information is given in rows or in columns.
(Actually, now I think about it, it might not have been from this book, but instead a tweet that I read around the same time that I got the book... If I remember to go and check, then I'll update this.)
A nice image is given by pretending that we have a bunch of things labelled by a letter and a number: $A1$, $A2$, ..., $B1$, $B2$, ..., etc.
We can think of these as being grouped by letter (so we have the set $A=\{An\mid n\in\mathbb{N}\}$) or by number (so we have the set $1=\{\alpha1\mid\alpha\in\{A,B,\ldots\}\}$), but it doesn't change what data we have.
What it _can_ change, however, is how we _think_ of the data.
I've been imagining the above example (where we assume that we only have $\alpha i$ for $i\in\{1,2,3,4\}$) as like a [battenberg](https://en.wikipedia.org/wiki/Battenberg_cake): slices correspond to grouping by letter, and each coloured 'tube' corresponding to grouping by number.
When we group by slice, we just have some set of objects; when we group by tube, all our objects lie on a _line_, and so somehow seem to have a more natural group structure, or are just somehow more nicely ordered.

Obviously, I am not suggesting that a battenberg cake has a natural group structure, and this example is not to be taken as being too deep, but it's just the image I have in my mind when it comes to this idea of rows vs. columns, slices vs. tubes, letters vs. numbers, or (the reason I'm talking about this) 'choice of language' vs. 'meaning of word'.

Anyway, back to dependent types.
This is something that I accidentally thought about when originally compiling the JSON dictionary, because I tried to write it in [Dhall](https://dhall-lang.org/).
Wanting to be as 'type safe' as possible, although I couldn't get it to work, and although I didn't ever realise that it was what I was doing at the time (and, indeed, didn't realise until Jade mentioned them), I tried recording all the entries as _dependent types_.
Finally, Jade pointed out that, if we say things like this, then somebody probably already has formulated/is formulating the sort of thing that I'm trying to formulate, but for _programming languages_ instead of human ones.
I am not overly familiar with what they've been doing, but I know that one goal of the [Statebox](https://statebox.org/) team is to do something like this with their [Typedefs](https://typedefs.com/) project, so I should probably have a read of what they've been doing.
(Incidentally, this also leads back to the fun idea of using this project as a way to 'compile' proof-assistant code (e.g. in Lean) to a human-readable version.)

# Translation as a change of trivialisation

One final thing that came to me yesterday is that, given this fibration point of view, translation seems more like the change of trivialisation of a bundle: translation from Japanese to Russian, say, is given by $\pi_{\mathsf{RU}}^_{-1}\pi_{\mathsf{JA}}$, and all our fibres (i.e. all our languages) are glued together along entries living over the same point, so things really kind of do look like a bundle of some sort.
But here I have no idea how this formalism would look, and whether or not it would be equivalent to what I've vaguely sketched so far or not (is there such a thing as the 'Grothendieck construction bundle'? something you get by applying the Grothendieck construction of different functors but then gluing them along their images?), but there ya go.

# Summary

There isn't really much content to this post, I'll admit, but I haven't been working on this project at all really, thanks to PhD writing and postdoc applications.
Either way, this little update shows me (at least) that I haven't given up on it, and serves as a good way for me to try to get my thoughts (all three of them) in order.
Thanks for reading!
(If you didn't read, but just scrolled to the end and saw this, then hey, thanks anyway.)
