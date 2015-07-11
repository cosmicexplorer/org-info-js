org-info-js
===========

This is a really cool project and I'm excited to work more on it. I've removed a lot of stuff that's not focused on just the javascript, so please check out the original repo [here](https://github.com/SebastianRose/org-info-js) for the full breakdown.

What I've added so far:

1. Made every anchor tag into `href="#<section>" onclick="org_html_manager.<function>()` so that you can ctrl+click to go to each section in a new tab, which is a nice thing to check off the TODO list.
    - a caveat is that since there's absolutely no way to determine whether the user is attempting to open a link in a new tab for sure, the javascript action is triggered anyway, so you go to the section pointed to by the link in both the old and new tabs. this isn't a problem because of the history function built into this script already (you can just press `b`), but it is annoying.
2. Added links for tags. You can click on a tag and go to its listing, and as with all links, you can open them in new tabs now.
3. All headings are now links as well, although I played with the css (in a horribly hacky way) to make them look like headings, not links.
4. Make `u` and `t` keyboard commands display a warning at the top level; I thought it was better than doing nothing at all. Also, `u` will now go to the table of contents if you press it from a top-level node.

Working on this has actually been much easier than I expected, so props to the guy who first wrote this. If anything feels broken, totally bring it up, cause this was written a while ago and org-mode has slightly tweaked its html output since then. I've made some fixes, but I don't imagine I've found them all.
