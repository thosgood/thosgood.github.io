## Todo

- do we really need the post titles to have the date now that we use `created_at`?
- generate the nav bar from `@items`
    + use `link_to_unless_current`, or whatever it is?
    + also make links in e.g. `index.html` not-static
- make some things global!
    + e.g. `class="f4 mb0 pb0"` for all `<h4>`, by default
    + similarly for `<a>`
    + colour schemes?
- move `-ns` things to the _front_ of the list of classes
- turn footnotes into sidenotes à la Tufte?
- blog!
    + transfer over posts
        * **TO FIX**
            - links to other posts
            - tables
    + tags
    + katex!
    + pagination
    + better 'posted at' date formatting
        * https://stackoverflow.com/questions/5891555/display-the-date-like-may-5th-using-pythons-strftime ?
    + generally look more like current site
    + respect the `<!-- more -->`, or whatever it is
    + posts
        * display date
        * how to make kramdown deal with generating e.g. `<a>` and `<code>` tags with whichever classes i want!
        * smaller maths font!

## References

- https://clarkdave.net/2012/02/building-a-static-blog-with-nanoc/