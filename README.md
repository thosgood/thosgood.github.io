## Todo

- pick **one** background image
- do we really need the post titles to have the date now that we use `created_at`?
- ~~generate the nav bar from `@items~~
    + use `link_to_unless_current`, or whatever it is?
    + also make links in e.g. `index.html` not-static
    ```
    <% @items.find_all("/*.html").each do |i| %>
    <li"><%= i[:title] %></li>
    <% end %>
    ```
- blog!
    + fix tables
    + tags
        * http://www.gamedesignstories.com/2017/04/28/adding-tags/
    + pagination
    + slightly nicer 'posted at' date formatting
        * https://stackoverflow.com/questions/5891555/display-the-date-like-may-5th-using-pythons-strftime ?
    + posts
        * auto TOCs
        * display date
        * turn footnotes into sidenotes à la Tufte?
            - or scrolling TOC in the margin?
        * full-width images? e.g. `derived-dg-triangulated-and-infinity-categories`
- _eventually_, https://www.ctrl.blog/entry/nanoc-items-performance.html
