---
title: 'Matrix: open, secure, and decentralised'
kind: article
tags: ['matrix', 'general']
created_at: 2019-10-09
---

Anybody who follows me on Twitter will have heard me go on about Matrix, and Riot, and maybe a whole host of other such things. I understand that most people probably won't really care much about it all, but I thought that I'd try to explain a bit why I'm quite so passionate about this stuff, and why I'm bothering to try to work on "LaTeX" support (with scare quotes for good reason, as explained later).

<!-- more -->

# What are Matrix, Riot, etc.?

**tl;dr: Matrix is like email, and Riot is like an email client.**

Anybody who has ever used IRC has some idea of what Matrix is, and anybody who hasn't, but has used MSN Messenger/Facebook Messenger/Slack/WhatsApp has a pretty vague idea too (or at least, will do, when I explain it a bit).

(As a warning, although I've been making small contributions to Matrix and Riot, I do not work for them, and it has been a very long time since I worked in any sort of technology sector, so I hope I don't mess up any important points too badly. Sorry in advance to any experts out there.)

Matrix is, at its very heart, [a _specification_ (or _protocol_) _for communication_.](https://matrix.org/) What does this mean? I would explain it to a mathematician by saying that it is a set of properties that a method of communication can satisfy, or maybe an axiomatisation of such a system. This is where it has some similarities to IRC, or even something a bit more like WhatsApp.

You can think of Matrix as "email" in the following sense. There are many ways of sending emails, in that you can use any _client_ that you want to (e.g. GMail, Apple Mail, Thunderbird, Mutt, Telnet), and you can send to and from people with email addresses hosted by different people (e.g. I, from my `posteo.net` email address, can send an email to somebody with an `@gmail.com` email address, who can then reply to me and CC in somebody whose email ends with `@yahoo.fr`, and so on). But there is some underlying _standard_ of _what an email actually is_ that all of these clients and hosts understand and agree to. It's similar to whenever you open a webpage in any browser: all of the (people who make the) browsers (well, almost all...) have _agreed_ on what any piece of HTML they see should actually mean, and how it should be displayed. There are lots of subtleties I'm skipping over here, I'm afraid, but it's just to motivate the general idea.

So then, what is Riot? [Riot is a client for sending messages via Matrix.](https://riot.im) Further, it's the "official" client, in that it's made by (sort of) the same people who make Matrix. There are lots of clients out there now, for all sorts of operating systems, and written in all sorts of different programming languages (and, recently, one written in about 8 lines of Bash script (rather long lines some of them, sure, but still...)). All of them (as far as I am aware) are entirely _open source_: anybody can go and read any part of the code, and understand how anything works, and even make suggestions or additions or fix errors, or even just do some spellchecking on documentation files; people can help however they want to.

What (to me, at least, but I'm sure to many of the hundreds of thousands of people who read this blog) is important is that Matrix and, to take the canonical example, Riot, are built in a way that makes them pretty much the opposite of other new technologies which we now sometimes find forced upon ourselves, because everything here is _free, open source, decentralised (but federated), and secure_.

Most of those words are probably pretty self-explanatory, but it's worth mentioning the "decentralised (but federated)" bit. This means that you can go and find an old computer (or even use part of your new one, if you like) and 'build' your very own Matrix Homeserver, which means that you can now send messages and receive messages to people on any other homeserver! This is like the fact that you can send emails from any email host to any other. Imagine what a nightmare it would be if you could only email people with the same `@foo.bar` email address. Unfortunately, this is how most technologies seem to head this day, because the hope is that everybody will flock to the biggest platform to be able to speak with the most people.

WhatsApp, Facebook Messenger, Slack, and even Telegram and Signal all have basically this problem: the only way that I can send messages to somebody on Facebook Messenger is by using Facebook Messenger; I don't (really) have a choice of clients, and I don't have a way of building my own copy of Facebook messenger that I can use, because this would give the added bonus of knowing exactly how Facebook Messenger works behind the scenes.

Anyway, back to happier business. Wouldn't it be nice to have a method of communication, like email, where anybody can send messages to anybody else, irrelevant of what app/program they use, and we all know exactly what's happening, down to the goriest details of implementation if we really want? I think the answer is a pretty firm yes. Bonus points if things are being run and developed by anybody who wants to help (with their work 'peer-reviewed' by some minimum of people, but also by anybody else who wants to). Even more bonus points when all the clients can be open-source, so we can fix any little problems about them that annoy us, or just make our own for scratch.

_"But,"_ one might think, _"if everything is out in the open, then where is my privacy?"_ To this, there are really two answers: one to each of the two interpretations of what the questions might be asking.

Firstly, if anybody is trying to explain why a system that ensures privacy/security by saying "oh but I can't tell you the details of how it works, because then hackers could hack it", then they are almost certainly explaining [a pretty insecure system](https://en.wikipedia.org/wiki/Security_through_obscurity). Good cryptographic algorithms are those where every single step is read by hundreds of different scientists and developers and mathematicians, over and over, for 30 years, and everybody agrees that all the pieces they've read (maybe even the whole thing) are good, and guarantee security in practice for these and those reasons. A good cryptographic thing is one where you know _how_ it works, but where this has absolutely no way of telling you how it works _backwards_, in some sense.

Secondly, and as an answer to the question that was probably the intended one, is that Matrix _is_ more secure than how I described it, because all of your messages can be send with _end-to-end encryption_. This is something that, for example, WhatsApp offers, but they don't tell us what they do at either "end", i.e. before the message has been encrypted and when the message has been decrypted. For all we know they could be attaching a little something to your message before decryption, and then quickly sneaking it away to keep on the other phone just after decoding. Who knows?


## So it's just like that XCKD comic, right?

In almost any conversation, there is a relevant XKCD: here, it's [#927](https://xkcd.com/927/) : there are so many competing standards, so why try for another one?

![The XKCD in question](xkcd927.png "XKCD number 927")

First of all, as mentioned above, Matrix solves a pretty big problem by being _federated_: like email, it doesn't matter who you choose to trust (I still use the word "trust" here, because that's always something you should think about) to give you your username and deal with your message sending/receiving (e.g. `matrix.org`, `matrix.sibnsk.net`, or `converser.eu`), because you can always send and receive messages from people who made a different choice. To me, this is just so obvious! Why did we move from email, and then SMS, to things like chat apps...

But the main reason why I think that Matrix doesn't really fall afoul of the (truthfully accurate) problem in this XKCD is that _Riot has bridges_.
Bridges are ways for people to interact with chat rooms (or conversations, which are just like two-people chat rooms) in _other apps/programs._ That is, _without leaving Riot_, I can send and reply to emails, take part in a conversation on Slack, and message somebody a funny (yet cute) photo of a bird on WhatsApp. So Matrix is not saying "everybody has to use me", but instead "anybody who uses me can also talk to people not using me".


# Why do you write "LaTeX" in scare quotes?

What I've been working on for a while is trying to find a way to be able to type formatted maths in messages.

This started off as the naive idea of teaching Riot to understand KaTeX, MathJax, or MathML, or _something_ "LaTeX-ish". LaTeX is a full _language_, and I just want to be able to message somebody in a way prettier than typing out raw LaTeX code. A first step, then, would be to just put a little LaTeX compiler into Riot (something like LaTeXiT, which I _do_ use for a lot of things, including doing exactly this (by hand) when I want to have some maths in my email), so that we can send maths and the viewer can see them as images. This has a few problems thought, like the fact that we then can't really just edit the message after we've sent it, because it's now an image; and also, LaTeX installations are generally full of a lot of faff (even TinyTeX --- something I personally use and love --- has just so many capabilities that we don't need, like knowing how to make tables of contents, or to do page numbering, or margins, or tables, or... any other number of things that are either not necessary for instant messages, or already possible to do in much simpler ways): all we really want is to be able to turn something like

    \oiint_{\partial\Sigma}\omega\,\mathrm{d}\tau

into $\oiint_{\partial\Sigma}\omega\,\mathrm{d}\tau$.

So I write "LaTeX" support, because we don't really want LaTeX, but instead something like MathJax or KaTeX: something that can just display LaTeX syntax as nice SVG/HTML content.

But, of course, the project progressed somewhat, and, after having talked to some very knowledgeable and talented people, some involved in the same way I am, and some involved by being employees of the non-profit organisation that helps make Matrix and Riot. The main consensus now is that, we should _not_ just be asking how to make Riot display LaTeX syntax as recognisable maths (this is something that's easy enough to do that even I did it, having the bare minimum amount of experience with Javascript: the result is [https://pigeon.digital](https://pigeon.digital)); we should be asking how to deal with the idea of wanting to send mathematical syntax (that is easy to type) in a way that agrees with Matrix, i.e. how to add in rules to the Matrix specification that say how mathematical symbols should be dealt with.

Obviously, for me, this is really exciting, but it's actually exciting for other people too, I promise! Hear me out.


# Why are you telling me all this?

What people are now trying to do is to come up with a way of sending "LaTeX" source code (here the square quotes mark the fact that we don't want to be able to send arbitrary LaTeX code to be executed, for fair security reasons) within the Matrix protocol. Then individual clients can decide how they want to display this. For example, Riot already knows how to display maths as HTML+CSS using KaTeX, and it can almost, itself, generate images of the rendered maths to send alongside the plain text message, so that other clients who _can't_ turn LaTeX into something viewable, can use these images as fallbacks instead. It might even be the case that basically nobody does any "programming", and the messages are just sent as plain text, but then the homeservers do some media magic and accompany the messages with a nice rendered version of the maths.

What I'm saying, then, analogously, is that we're trying to find a way to _fit LaTeX syntax into the specifications_, which would be a pretty great thing for mathematicians everywhere! With the rise of environmentally-conscientious conferences, being able to discuss and communicate long-distance is becoming increasingly important, and, for mathematicians, at least, having a way to send messages with nice LaTeX stuff inside them, could really be a wonderful experience. And not just that, but also to be able to send such messages to people who _aren't even using Matrix_. Things are much easier when people are all on the same system, but a good system should never only function in such a way that it has to be the only one existing.

Finally, I just want to point out what this might mean on a not-necessarily-smaller-but-maybe-horizontally-located level: there are still many active IRC chat rooms, most notably, maybe, being the one for homotopy type theory. At the moment, Riot can bridge to IRC, so a single room can be at once an IRC room and a Matrix room, but with the Matrix room supporting things like saving history of conversations that take place while you're logged out, and images, file sharing, voice calls, video calls, E2E encryption, etc. Seeing how nice it is to still have chat rooms, where you can go and ask a question and get answers (as opposed to, say, stackexchange/mathoverflow, where you can ask questions, but all discussions must be moved to a separate thread, and questions must adhere to a certain structure, etc. etc. (not that I'm saying that stackexchange is bad, not at all, but just that it is meant for a different (more rigorous) purpose)), it seems even nicer to me that we could have ones that have a bit more support for modern things that we take for granted (images, file sharing, etc., as above).


# If I do now care, what can I do?

Well, depending on how you feel, and what you like to do, there are lots of things that you could do! Here are some suggestions, in no particular order.

  1. Switch from using Slack/Discord or whatever you currently use, and give Riot a try. If you don't like it, maybe ask some questions about if things can be changed or not. If you decide that you much prefer Slack/Discord, then go back! (maybe after trying a different Matrix client, if you're feeling extra generous --- saying "I don't like Matrix" because you don't like Riot is a bit like saying "I don't like email" because you don't like Thunderbird. There are a bunch of Matrix clients, from Electron-based ones to purely command line ones.) Just please keep in mind that Riot is _open-source_: if there's something missing, or something broken, or something that you don't like, then you can just say so! and if you know how, you can implement/fix/add it! Riot probably also has most of the things that you are used to: public rooms, private rooms, one-to-one chats, room bots, and the like.
  2. Join some of the standard Matrix rooms to listen and learn (as well as to say hello to people and talk)! These are ones like Matrix HQ ([`#matrix:matrix.org`](https://matrix.to/#/#matrix:matrix.org)) and Riot Web/Desktop ([`#riot-web:matrix.org`](https://matrix.to/#/#riot-web:matrix.org)).
  3. If you want to learn more about how Matrix actually works, or about other clients, or anything at all really, then just ask me (via email, Twitter, or even Matrix itself!) and I will either answer, or point you in the direction of somebody who can! If you want to get involved in these discussions about "LaTeX", then I can point you to the rooms where these discussions are taking place.
  4. If you like maths, but have never really used IRC rooms before (or those chat rooms on stackexchange), or even if you _have_ used them before, I guess, then why not come and see what they're like? At the very least, I can guarantee that they're super welcoming and never home to responses like "that's a stupid question: please do more research before asking stuff like that here" (although, sure, the caveat is that they're very small...). There are currently two maths rooms that I run ([`#math.CT:matrix.org`](https://matrix.to/#/#math.CT:matrix.org) and [`#math.AT:matrix.org`](https://matrix.to/#/#math.AT:matrix.org)), and a community that I moderate ([`+mathematics:matrix.org`](https://matrix.to/#/+mathematics:matrix.org)), which keeps a list of interesting rooms to do with mathematics. Don't see a room that you'd like to exist? Then make one! You can make it private and just use it with your local team/work group/reading group; you can make it public so that anybody can see it; or you can suggest for it to be added to the Mathematics community list!
