---
title: Translations
part: Part 3
kind: article
tags: ['translation', 'general', 'quick-read']
created_at: 2022-01-23
---

I haven't blogged about it in a while, but I've been working on just making [my translations](https://thosgood.net/translations) a bit better, both in terms of content and accessibility.
Let's have a look at what I've done, shall we?

<!-- more -->

The main change is that *nearly* all of the translations are now viewable as web versions, *as well as* PDFs.
This hopefully makes them much more accessible to people who use screen readers, but is also nice even for people who don't: you can change the font, the font size, switch to dark mode, use the table of contents which scrolls down the page with you, fit the whole page onto your phone, etc. etc.
I also took this opportunity to refresh the CSS a bit, so hopefully things look slick and nice now.

![New style for web versions of translations: the buttons in the top left are for toggling the table of contents, changing font options, and viewing the PDF version. Thanks [Bookdown](https://bookdown.org/)!](new-css.png "A screenshot of the new style for the web versions of my translations")

There are some translations which I probably won't switch over to HTML, simply because they have commutative diagrams which cannot be rendered in the [`CD` environment](https://ctan.org/pkg/amscd?lang=en) (which is now supported by KaTeX), and I just haven't gotten around to sorting out image generation for these web versions yet.

I've also finished some new translations since I last blogged.
Here are the articles:

- M Balazard, E Saias, M Yor. "Notes sur la fonction ζ de Riemann, 2". *Adv. in Math.* **143** (1999), 284–287. [HTML](https://translations.thosgood.net/AIM-143-1999-284.html)
- P Deligne. "Variétés abéliennes ordinaires sur un corps fini". *Inv. Math.* **8** (1969), 238–243. [HTML](https://translations.thosgood.net/IM-8-1969-238.html)
- P Deligne. "Théorie de Hodge I". *Actes du Congrès intern. math.* **1** (1970), 425–430. [HTML](https://translations.thosgood.net/ACIM-1-1970-425.html)
- Y Diers. "Catégories Multialgébriques". *Archiv der Math.* **34** (1980), 193–209. [PDF](https://translations.thosgood.net/ADM-34-1980-193.pdf)
- A Grothendieck. "Résumé des résultats essentiels dans la théorie des produits tensoriels topologiques et des espaces nucléaires". *Annales de l'Institut Fourier* **4** (1952), 73–112. [HTML](https://translations.thosgood.net/AIF-4-1952-73.html)

And here are the seminars:

- H Cartan. "Les travaux de Koszul, I, II, and III". *Séminaire Bourbaki* **1** (1952), Talks no. 1, 8, and 12. [HTML](https://translations.thosgood.net/SB-1-1%2B8%2B12.html)
- A Douady. "Variétés et espaces mixtes; Déformations régulières; Obstruction primaire à la déformation". *Séminaire Henri Cartan* **13(1)** (1960/61), Talks no. 2, 3, and 4. [HTML](https://translations.thosgood.net/SHC-13(1)-2+3+4.html)
- Grothendieck, A. "Technique de descente et théorèmes d’existence en géométrie algébrique, I, II, and III". *Séminaire Bourbaki* **12** and **13** (1959/60 and 1960/61), Talks no. 190, 195, and 212. [HTML](https://thosgood.net/fga)

You might notice that this last one is Grothendieck's FGA, and I've already talked a lot about how much progress has been made (although, admittedly, not for a while, due to general life chaos) about the [EGA translation](https://github.com/ryankeleti/ega), so the natural question to ask is *what about SGA?*
Although I said I wasn't going to work on this until I'd at least finished the FGA translation (of which there are only two and a half chapters left), I ended up needing to read bits of SGA 6 for my research anyway, so I just gave in and translated some: the homepage of the SGA translation is [thosgood.net/sga](https://thosgood.net/sga/) (to accompany [thosgood.net/fga](https://thosgood.net/fga)), and here you can see what I've done so far (just the first section of SGA 1, and a little bit of the introduction from SGA 6), but *do not expect any updates to this any time soon* --- I really have to finish up some old projects before I get started on any news ones!
(Although, as always, you can always contribute anything yourself if the fancy ever takes you: [github.com/thosgood/sga](https://github.com/thosgood/sga).)

Anyways, that's enough for now.
Belated happy new year to you all!
