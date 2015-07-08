org-info-js
===========

This is a really cool project and I'm excited to work more on it. I've removed a lot of stuff that's not focused on just the javascript, so please check out the original repo [here](https://github.com/SebastianRose/org-info-js) for the full breakdown.

What I've added so far:
1. Made every anchor tag into `href="#<section>" onclick="org_html_manager.<function>()` so that you can ctrl+click to go to each section in a new tab, which is a nice thing to check off the TODO list.
    - a caveat is that since there's absolutely no way to determine whether the user is attempting to open a link in a new tab for sure, the javascript action is triggered anyway, so you go to the section pointed to by the link in both the old and new tabs. this isn't a problem because of the history function built into this script already (you can just press `b`), but it is annoying.
