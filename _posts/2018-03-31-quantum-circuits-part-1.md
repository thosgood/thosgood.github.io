---
layout: post
title: Quantum circuits
part: Part 1
category: "maths"
tags: "quantum-physics quantum-computing"
comments: true
---

I am not at all a physicist, and my knowledge of quantum physics in particular comes solely from undergraduate courses that I followed years ago, and any reading I can get done when feeling mathematical but not inclined to work on my thesis.
However, after scanning through some papers by [Bartlett](https://arxiv.org/abs/math/0512103), [Baez, Lauda](https://arxiv.org/abs/0908.2469), and [Lurie](https://arxiv.org/abs/0905.0465), my interest in quantum physics, and quantum computing especially, has come back with a vengeance.

<!--more-->

_The following is aimed at people who have maybe read some things about quantum physics before and know some linear algebra._

Quantum computing has fascinated me ever since  I first studied it at university, despite being a self-proclaimed 'non-physicist', swearing to do only 'mathematical maths' and none of this applied stuff (a shameful phase that I am really glad I outgrew).
This is without a doubt almost entirely due to the incredible teaching of [Artur Ekert](http://www.arturekert.org), whose lectures were probably the best that I ever experienced as an undergrad/masters student.
Really, most of what I'm going to say comes from notes I took in these lectures, so hopefully I don't distort them too much.

One of the reasons that I'm posting this, apart from to help me to not forget it, is that quantum physics has such a strong link to $n$-category theory, but I don't know at all really how quantum computing fits into this [nPOV](https://ncatlab.org/nlab/show/nPOV) picture.
As a naive guess, I would think that there is some `string diagram' approach to all this, but I'd need to sit down and have a think about what exactly that would be...
So if anybody has any comments or references then I'd be more that interested to hear them!

## Foundational ideas

Before jumping in to the jacuzzi that is quantum circuitry, let's dip our toes in the vast ocean of **quantum physics axiomatisation**.
First of all though, a note on quantum computers in practice.
There are a bunch of companies that make 'quantum computers' (for example the [D-Wave](https://www.dwavesys.com)) but these are of a completely different species to those that we're going to have a look at.
These computers work using [quantum annealing](https://en.wikipedia.org/wiki/Quantum_annealing) – a sort of quantum version of [thermal annealing](http://www.wikiwand.com/en/Simulated_annealing); what I'm going to talk about are [universal quantum computers](http://www.wikiwand.com/en/Quantum_Turing_machine).
Quantum annealing lets you implement so-called hill-climbing algorithms, but many of the famous quantum algorithms, like Shor's, cannot be implemented in this way.Quantum annealing lets you implement so-called hill-climbing algorithms, but many of the more well-known quantum algorithms, such as [Shor's](https://en.wikipedia.org/wiki/Shor%27s_algorithm?oldformat=true), cannot be implemented in this way.
I hate to be a cynic about something in which I am far from an expert, but it seems to me that calling systems like the D-Wave 'quantum computers' is a way to boost sales by using not-entirely-false-but-definitely-misleading buzzwords.[^2]

Another very important point is that **quantum algorithm complexity** is by no means trivial.
Said in another way, there are some things that quantum computers can do so much better than classical ones (e.g. prime factorisation), but they are neither 'better' nor 'faster' overall: there are some things that they are much _worse_ at than classical computers.
Expecting a quantum computer to be able to run arbitrary programs quicker than a classical computer is somewhat akin to expecting an otter to be able to drink a pint of water quicker than a pigeon could, simply because an otter swims faster in water.[^3]

Anyway, with that aside, let's go get our feet wet.

### Quantum interference

Here is an experimental fact that you can read about in who-knows-how-many places and find numerous videos of: if we send a particle through a barrier with two tiny (really really tiny) holes (or _slits_, to agree with the name **double-slit experiment**) and place a detector on the other side, it is _not necessarily_ true that the particle reaches the detector with probability $p_1+p_2$, where $p_i$ is the probability of the particle going through the $i$-th hole.
In fact, the probability is given by

$$p_1 + p_2 + 2\sqrt{p_1p_2}\cos(\varphi_1-\varphi_2)$$

where $\varphi_i$ are numbers, called the **phase**, associated to the $p_i$ (we describe what exactly they are in a bit).
This means that the total probability depends on the **relative phase** of the system: the value $\vert\varphi_1-\varphi_2\vert$.
Sometimes this _will_ agree with $p_1+p_2$, and sometimes _not_.

The point is, the **Kolmogorov additivity axiom** (the probability of two _mutually exclusive_ events is the sum of the probabilities of the constituent events) seems to fail – but why?
As a result of decades of thinking and experiments and failed ideas, the theory that seems the 'most likely' is that of **quantum theory**, which says in particular that _the particle passes through both slits simultaneously_, and so the events of passing through each slit individually are _not_ mutually exclusive at all.
This does seem to explain the formula for the probability of detection that we described above: the only way that it can depend on $\varphi_1-\varphi_2$ is if the particle 'interacts' with both paths each time it passes through the barrier.

I'm not going to talk much more about actual quantum physics, since there are so many great references written about it already, and I am also not a physicist, and even less so an experimental quantum physicist.
However, it's good to have this basic understanding of quantum physics to really understand how quantum computers work: in some sense that we will make precise, they follow _all_ computational paths at the same time, and give an answer that depends on _all_ of the results.

It is very natural, reading this, to wonder why it is that we don't experience quantum effects in our daily lives.[^1]
You can try throwing a ball at a wall with two open windows as much as you want, but you'll never have it go through both windows simultaneously.
The answer is the very thing that's stopping us from being able to actually build quantum computers with our current technology: **decoherence**.
Simply put, no physical system is really truly separate from the external environment – there is always gravity of far away objects pulling on things, and even being able to _look_ at a physical system means that there are photons passing through and touching things and generally being a nuisance.
Decoherence, then, is when the external environment 'gets in the way' of our very delicate teeny tiny quantum systems, and influences the **interference term** (the term with the relative phase) in such a way that we can't recover it.
This also ties in with the fact that, given any 'quantum theorem' (i.e. formula or equation for a quantum system), if we make all the 'quantum terms' tend to zero then we should recover the corresponding 'classical theorem'.
Later on we will talk about decoherence again, and look at what it means explicitly in terms of quantum circuits, but to begin with we just sort of ignore it and work in an ideal world where we can get rid of it entirely.

### Axiomatics

In our discussion of the double-slit experiment we mentioned how there were 'extra' numbers $\varphi_i$ associated to the probabilities $p_i$, so let's try to formalise that now.
Quantum theory suggests that we work with **probability amplitudes** instead of **probabilities**.
That is, rather than just saying an event happens with probability $p$ for some real number $0\leqslant p\leqslant1$, we say that it has **associated probability amplitude $z$**, where $z$ is some complex number such that $\vert z\vert\leqslant1$, and then the probability of the event occurring is exactly $|z|$.
The way that amplitudes behave are very similar to they ways that probabilities behave: the amplitude associated to two events occurring one after the other is the _product_ $z_1z_2$ of their probability amplitudes; the amplitude associated to an event that can occur in two different ways it the sum $z_1+z_2$ of the amplitudes associated to the individual ways.
In fact, writing our complex numbers as $z=|z|e^{i\varphi}$, we can recover the probability in the double-slit experiment:

$$|z_1+z_2|^2 = |z_1|^2 + |z_2|^2 + z_1^*z_2 + z_1z_2^* = p_1 + p_2 + 2\sqrt{p_1p_2}\cos(\varphi_1-\varphi_2).$$

The other generalisation of classical things that we work with is the idea of a **qubit**.
The classical idea of a **bit** is that we can store information by encoding things in binary and then, for example, inducing a charge between the plates of a capacitor to represent a 1, and leaving it uncharged to represent a 0.
To make this quantum, we can look at storing our data not on capacitors but on electrons, or using polarisation of light.
For example, we could say that an electron in its **ground state** (its lowest energy state) represents a 0, and if it's in a higher energy state then it represents a 1.
So far so good, but what's new?
Well, by shining light of varying frequencies and brightness for varying durations, we can change the electron's energy state, but if we shine light at, for example, half the brightness, then we will find that our electron is now in a state that can't be described classically: it's in a **coherent superposition** of states.
These are states where the electron is in _both energy levels at once_, similar to how the particle went through both slits at once.

Again, I'm not really the best person to explain this, but the idea is that, experimentally, we can prepare particles in such a way that, when we measure their energy, sometimes we find that they're in their ground state, and other times they're in their higher energy state (and anything that we can prepare consistently like this we call a **qubit**; we call one of the states $\vert0\rangle$ and the other $\vert1\rangle$).[^4]
But, you may be saying, how do we know that it isn't simply the case that some of the particles we prepare are already in one state, and the others in another state?
That is, imagine the two following scenarios:

1. We have an electron in an 'equal' superposition (it's in both states 'in equal amounts') and we measure its energy
2. We have a bag containing two electrons, one in state $\vert0\rangle$ and the other in state $\vert1\rangle$. We pick one randomly and measure its energy.

In both cases, when we measure the energy of the particle we will find it to be in state $\vert0\rangle$ or state $\vert1\rangle$ with equal probability (50%), so how does this supposed 'superposition particle' differ from a particle with a randomly picked state?
Well, experimentally, we can show a difference, but maybe more convincingly we can give a good mathematical reason why these two situations are completely different.
To do so _properly_, we need at least the basics of quantum circuitry, but we can describe the proof right now.

If it were the case that sending a pulse of light at the electron that puts it in a 50/50 superposition were the same as simply setting the electron to state $\vert0\rangle$ or $\vert1\rangle$ randomly, then firing this same beam of light _twice_ in a row at the same electron should be the same as firing it once.
In other words, if we randomly set it to 0 or 1, and then randomly set it _again_ to 0 or 1, it's the same as randomly setting it to 0 or 1 just once.
_But_ (and here's the kicker), we can show that _every single time_ you start with an electron in state $\vert0\rangle$ and hit it with this pulse of light two times in a row, what you actually end up with is an electron in state $\vert1\rangle$.
_Every single time._
It's a hard thing to understand when you first meet it (and still even after the second and third encounters), but coherent superpositions are not at all the same as a particle being in a randomly chosen state – it really is a particle that is in both states at once.

There is a bunch of really exciting 'quantum philosophy' that asks questions like, "if quantum theory is wrong in some way, then can any of it still be right, or does it all break down if we find one problem?", and "how can we tell that there isn't a _hidden variable_?", i.e. "how do we know that the result of our measurement of a particle isn't predetermined?".
What is really astonishing is that quantum theory is in some sense more general and powerful that quantum theory.
What do I mean by this?
Well, as an example that I still think about in awe, even if quantum theory is completely entirely 'wrong', in that the universe works by some entirely different theory, then we can _still_ use quantum physics to produce truly random data.
This doesn't sound very exciting or big, but if you say it in a different way you can see why people would get so worked up about it: _if all of our lab equipment is made by some private corporation that we don't trust, and we want to produce a random number, then using quantum physics we can do so with **complete certainty**,[^10] even if the equipment has been tampered with to produce certain states of particles more often than others, or to produce seemingly random states that are actually just following a predetermined order._

I don't want to be turning quantum physics into sensationalism now, so this comes with the obvious caveat that doing things in practice is usually really hard.
A quote I remember hearing from Artur is that _"in theory there is no difference between theory and practice, but in practice there is"_.
But, even so, wow this stuff is cool.

Awed ravings aside,[^5] let's briefly end this section on axiomatisation by actually stating what our axiomatisation is.
This isn't going to be entirely self-contained for those new to maths I'm afraid – I'm going to freely talk about vector spaces and complex numbers and matrices and the like (basically, _linear algebra over $\mathbb{C}$_).

The following is all experimentally inspired and guided, but it still a purely _mathematical_ formalism.
So far it seems to agree with every physical experiment we can throw at it, but we won't worry too much about this, and instead just see what happens if we play around with the maths, and leave physical implementations to the physicists (though we won't forget that, whenever something seems to pop up out of thin air, it's almost always because it's been suggested to exist by some experimental experiences).

---

1. A **qubit** is any object that can be reliably prepared to be in one of two states (or any superposition therein), manipulated, and measured.
    Any qubit can be described by a **state vector**:[^6] a qubit in state $\vert0\rangle$ with probability amplitude $\alpha_0$ and state $\vert1\rangle$ with probability amplitude $\alpha_1$ is represented by the unit vector with entries $\alpha_0$ and $\alpha_1$

    $$\alpha_0\vert1\rangle + \alpha\vert1\rangle \longleftrightarrow \begin{pmatrix}\alpha_0\\\alpha_1\end{pmatrix}.$$

    This means that the qubit is in an $\alpha_0\colon\alpha_1$ coherent superposition, and so when measured it will be in state $\vert0\rangle$ with probability $\vert\alpha_0\vert^2$ and in state $\vert1\rangle$ with probability $\vert\alpha_1\vert^2$.

    Note that we ignore **global phase**: if we have a qubit in the state $e^{i\vartheta}(\alpha_0\vert1\rangle + \alpha\vert1\rangle)$ then this is the same as a qubit in the state $\alpha_0\vert1\rangle + \alpha\vert1\rangle$.
    We do **not**, however, ignore **local phase**: $\alpha_0\vert1\rangle + e^{i\vartheta}\alpha\vert1\rangle$ is **not** the same as $\alpha_0\vert1\rangle + \alpha\vert1\rangle$.

2. Qubits are modified by **quantum evolutions**: redistributions of the amplitudes between the states (for example, the changes of energy induced by pulses of light on an electron qubit).
    Admissible quantum evolutions are described by complex isometries, in particular by **unitary matrices**.
    For example, the matrix

    $$\begin{pmatrix}0&-1\\1&0\end{pmatrix}$$

    sends the basis state $\vert0\rangle$ to $\vert1\rangle$, and the basis state $\vert1\rangle$ to $-\vert0\rangle$, and extends linearly to act on any superposition $\vert\Psi\rangle = \alpha_0\vert0\rangle + \alpha_1\vert1\rangle$.

3. We take **measurements** corresponding to our choice of basis states $\vert0\rangle$ and $\vert1\rangle$.
    As mentioned above, the probability of the outcomes of any measurement are given by the moduli of the probability amplitudes, and the choice of basis consists of distinguishable states, so the outcomes of any measurement are mutually exclusive.[^7]

4. For multiple qubits (and composite systems in general), the corresponding state vectors are the unit vectors in the tensor product of the Hilbert spaces associated to each individual system, e.g. a system consisting of two qubits is described by the complex Hilbert space $\mathbb{C}^2\otimes\mathbb{C}^2$, and so state vectors are of the form
    
    $$\begin{pmatrix}\alpha_0\\\alpha_1\end{pmatrix}\otimes\begin{pmatrix}\beta_0\\\beta_1\end{pmatrix}.$$

    The evolutions are then described by tensor products of the relevant unitary matrices.

    **Edit.** More about this at the end of the post.

---

&nbsp;

Finally, for this section, an important note on measurements and the troublesome notion of **collapsing**.
When we have some particle in a coherent superposition and then measure it, we find it in state $\vert0\rangle$ with probability $\vert\alpha_0\vert$.
But then, after the measurement, the particle is in state $\vert0\rangle$, _full stop_; there is now no uncertainty, and we know that we can measure this particle over and over and always find it in state $\vert0\rangle$.
Even more worryingly, the original state $\alpha_0\vert0\rangle+\alpha_1\vert1\rangle$ is completely irretrievable.
This seems to be a contradiction to our assumptions on quantum evolutions: this 'collapse' that follows a measurement is not described by a hermitian operator (in particular, it's not invertible, since we lose the original state), but instead something far more blunt and sudden.

There are many ways of dealing with this problem, but the important thing to note is that measurements can still be described in exactly the same way as all other quantum processes, and aren't subject to a different axiomatisation or something.[^8]
However, for the moment, it's a convenient way of thinking that simplifies the maths (and conceptualisation) to just think of measurements as collapses.

## Classical circuits

Finally for this post, we'll talk a bit about classical circuits.
Let's take a single bit, which can be in one of two states: $\vert0\rangle$ (off) and $\vert1\rangle$ (on).
Using the same notation as before, we can use a 2-vector to describe the state of this bit:

$$\begin{align*}
    \begin{pmatrix}1\\0\end{pmatrix} \,\,\leftrightarrow\, &\vert0\rangle \leftrightarrow \text{off}\\
    \begin{pmatrix}0\\1\end{pmatrix} \,\,\leftrightarrow\, &\vert1\rangle \leftrightarrow \text{on}.
\end{align*}$$

Then we can describe the four classical computations on a single bit by matrices:

$$\begin{array}{cccc}
    \begin{pmatrix}1&0\\0&1\end{pmatrix} & \begin{pmatrix}0&1\\1&0\end{pmatrix} & \begin{pmatrix}1&1\\0&0\end{pmatrix} & \begin{pmatrix}0&0\\1&1\end{pmatrix}\\[1em]
    \text{IDENTITY} & \text{NOT} & \text{CONSTANT-0} & \text{CONSTANT-1}
\end{array}$$

If we have two bits, we can use that $\mathbb{R}^2\otimes\mathbb{R}^2\cong\mathbb{R}^4$ to write state vectors in the form

$$\begin{pmatrix}\delta_a\\1-\delta_a\end{pmatrix}\otimes \begin{pmatrix}\delta_b\\1-\delta_b\end{pmatrix} \longleftrightarrow \begin{pmatrix}\delta_a\otimes\delta_b\\\delta_a\otimes(1-\delta_b)\\(1-\delta_a)\otimes\delta_b\\(1-\delta_a)\otimes(1-\delta_b)\end{pmatrix}$$

for $\delta_a,\delta_b\in\{0,1\}$.

Then, for example, a gate that acts as NOT on the first bit and as the CONSTANT1 gate on the second bit would be given by[^9] the matrix

$$\begin{pmatrix}0&1\\1&0\end{pmatrix} \otimes \begin{pmatrix}0&0\\1&1\end{pmatrix} = \begin{pmatrix}0&0&0&0\\0&0&1&1\\0&0&0&0\\1&1&0&0\end{pmatrix}.$$

---

**Edit.** Somehow I forgot to talk about **entanglement**, so let me fix that now with a small update.

When we have a multi-particle system (e.g. two qubits), then the states of this joint system are described by tensor products, as we said in our four-point axiomatisation.
This means that states of the form

$$\vert0\rangle\otimes\vert0\rangle = \vert0\rangle\vert0\rangle = \vert00\rangle$$

(where the latter two equalities are just us introducing some shorthand notation) describe our system.
However, not every element of a tensor product is a tensor of elements in each component: they are _linear combinations_ of such things.
For example,

$$\alpha\vert00\rangle + \beta\vert01\rangle = \vert0\rangle\otimes(\alpha\vert0\rangle + \beta\vert1\rangle)$$

but

$$\alpha\vert00\rangle + \beta\vert11\rangle$$

_cannot_ be written in the form $\vert \Psi_a\rangle\otimes\vert \Psi_b\rangle$.

We call states in the former form (tensors of states of the composite systems) **pure states**, and the latter form (states that don't 'split' as a state in each composite system) **entangled states**, because somehow the two systems are interacting with each other in such a way that we can't 'pull them apart'.

---

# Footnotes

[^1]: Well, in some way we _do_, because quantum theory governs fundamental actions of particles themselves, which sort of make up everything, so of course we're affected. But what I mean here is that we don't tend to see things in two places at once, or witness 'mutually exclusive' events simultaneously.
[^2]: In general, it seems that quantum physics shares the fate of Gödel's incompleteness theorems – to be misquoted and misapplied for the purpose of sensationalism.
[^3]: To be fair, I have neither witnessed an otter-pigeon swimming race nor an otter-pigeon drinking race, so this could be a flawed analogy.
[^4]: So, in our example, an electron in its ground state is said to be in state $\vert0\rangle$, and in its higher energy state its said to be in state $\vert1\rangle$,
[^5]: Enthusiasm isn't a substitute for knowledge, so I really hope that I haven't said anything misleading here. If it were the case that being really excited about everything counted the same as understanding it all, then I'd be a much better mathematician.
[^6]: We always need a _choice of basis_, because this is equivalent to being able to interpret a qubit 'as a 0 or a 1'.
[^7]: This is a possible sticky wicket. A particle can be in a superposition of states, but any measurement will result in just _one_ state; we can't actually _observe_ a superposition. See the comments in a bit about measurement and collapse.
[^8]: What even _is_ measurement? The more you think about it and try to define it, the more you realise what a tricky concept it is. It's when an observer learns information about a quantum system, but then, what is an observer? And how do we formalise the idea of 'gaining information about something'? There is a lot of 'quantum philosophy' here, and many ways of answering these questions. Personally, I like the approach that captures the 'measurement collapse' as 'lots of decoherence', and describes decoherence as 'the universe trying to learn information about the quantum system'. Hopefully I'll write about this some other time, and try to find some good references by real physicists.
[^9]: The tensor product of matrices is given by the [Kronecker product](https://en.wikipedia.org/wiki/Kronecker_product).
[^10]: Whatever this might actually mean...