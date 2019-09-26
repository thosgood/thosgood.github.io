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
    + or scrolling TOC in the margin?
- blog!
    + transfer over posts
        * **TO FIX**
            - links to other posts
            - tables
    + tags
    + pagination
    + better 'posted at' date formatting
        * https://stackoverflow.com/questions/5891555/display-the-date-like-may-5th-using-pythons-strftime ?
    + generally look more like current site
    + respect the `<!-- more -->`, or whatever it is
    + posts
        * auto TOCs
        * display date
- _eventually_, https://www.ctrl.blog/entry/nanoc-items-performance.html

## References

- https://clarkdave.net/2012/02/building-a-static-blog-with-nanoc/