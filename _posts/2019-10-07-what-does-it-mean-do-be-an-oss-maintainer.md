---
layout: post
title:  "What does it mean to be a open-source project maintainer?"
date:   2019-10-07 0:00:00
summary: "What does it actually mean to be a maintainer? Can you be a maintainer without commit privileges, and does having commit privileges automatically make you a maintainer?"
readtime: "821 words/4 minutes"
---

There are many different responsibilities for the maintenance of an open source project, and while some of them get called "maintainership", I'm not sure they should be.

Let's zoom out for a moment. What labor must be performed, by someone, anyone - in any successful open source project?

* **Writing code** - fixing bugs, writing new features, refactoring old code.
* **Writing documentation** - explaining why things are the way they are. Recording intention and design, and how to use the APIs provided.
* **Issue triage.** Making bug reporters create reproducing examples. Closing issues that are stale or invalid. Providing feedback on feature requests.
* **Code review.** Looking at pull requests and providing feedback.
* **Regular releases.** Packaging up a release and pushing to the package namespace.
* **"Green Button" control.** Merging pull requests. Deciding what should be merged and what should not. This "quality control": is this PR good? Does it fit the goals of the project? Did someone review it?
* **Vision/direction.** What's our release schedule? What features will we not include? What approaches will we never take?
* **Enlisting help.** Encouraging more contributions and engaging more volunteers to do the above.

What's interesting is that only a few of these responsibilities require what _most_ people consider to be the mark of the maintainer: commit bit and rights to the package namespace on the appropriate package manager. In fact, it's really just one of the responsibilities that needs that all-important commit bit access ("Green Button" control), and pushing to the package repository needs a separate privilege. Everything else needs no privileges whatsoever.

Unfortunately, **the word "maintainer" has become something of a byword for a mythical cowboy-coder heroine,** someone who spends 40 hours a week on their project writing new features, fixing reported bugs, spinning up VMs on cloud services to try to reproduce the more esoteric reports.

As an maintainer of a popular OSS project, many people certainly see me this way. They provide vague bug reports and then ask "what's my plan" for fixing them. In the desire to see their open source project succeed and gain widespread adoption, many OSS maintainers turn themselves into personal servants of their users, and take on all of the responsibilities of the project themselves.

Instead, I'd like to propose that **a "maintainer" is just being someone who does the labor of contributing regularly to an OSS project**, regardless of their privileges or status.

And, what I've come to realize is that the most valuable thing I can do as a "maintainer", whatever that means, is to grow my base of contributors. By taking on the mantle of "hero maintainer", fixing every issue and writing every feature, I am actually sabotaging that goal by ignoring all of my users (who are my potential collaborators) and letting them treat me as free labor.

The only thing you can do for an open-source project that has potentially infinite impact is to encourage more contributors to get involved. Those people might also encourage more contributors, etc etc. You are just one person. But the global pool of people who could work on OSS is, functionally, infinite.

I've been focusing on trying to support as many people as possible to get involved in our project, and to teach as many people as possible how to carry out the responsibilities of "maintainership". I hosted an open Zoom meeting where I helped people make their first ever contribution to Puma. I got 2 new contributors and we fixed 3 issues.

The reason people don't help you with any of the responsibilities of "maintainership" is that they don't know how. But as an existing maintainer, you know how to do all of this stuff already. But you have context, experience and probably skills that your potential contributor base does not. So it's up to you to teach them how.

* **Writing code.** Teach your potential contributors what packages to install, how to run the tests, how to run just one test a time, how to write a good test, how the project works and what its architecture is.
* **Issue triage.** Lay out clearly how your issue triage process works. In a separate document, outside your pull request/issue template, explain what a good bug report looks like and how to work with a reporter to get it from vague to excellent.
* **Code review.** Write a document that explains what you look for in pull requests, and encourages others to get involved. Explain that you encourage anyone to review code.
* **Vision/direction.** Write it out. Post it in the README for all to see. This helps everyone know what bugs are more important than others, and which features are good and which don't fit.

Making contributions to OSS is, unfortunately, a very fraught and nervous experience for newbies. You can help them by giving them a step-by-step guide for the various ways they can contribute to your project.

We can all be "maintainers" - but it's up to maintainers to teach us how.
