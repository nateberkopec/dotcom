---
name: update-now-page
description: Update this site's now page. Use when the user asks to revise, refresh, or add current activities to now.html.
---

# Update the now page

1. Read `now.html` completely before asking questions.
2. Interview the user briefly about what changed: location or travel, work, physical activity, learning, leisure, and personal life they want published. Ask only about gaps not already answered.
3. Preserve the page's brief, matter-of-fact HTML structure and the user's voice unless they request a different format.
4. Replace stale activities cleanly. Leave no references to things the user says are no longer current.
5. Link specific books, films, games, events, places, organizations, and projects when a useful public page exists. Prefer official or publisher pages; search the web to verify titles, authors, and URLs. Avoid inventing unspecified details.
6. Set the visible `Last updated` line to today's date on every content update. Read the local date with `date '+%B %-d, %Y'`; never preserve the previous date by accident.
7. Run `git diff --check` and `bundle exec jekyll build --quiet`. Review the final diff to confirm the content, links, and visible update date all changed as intended.

Complete the task only when `now.html` reflects the interview, every practical named item is linked, the visible date is current, and the site builds successfully.
