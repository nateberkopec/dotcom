---
title: "37signals Isn't Smarter Than You, but They Are Different"
date: 2024-01-26 00:00:00
summary: "37signals' code looks great because of their engineering strategy: stay small, cut scope ruthlessly, hire well. Most companies can't adopt this because they're unwilling to give up the 'more features = more money' mindset."
readtime: "601 words/3 minutes"
draft: true
---

A recent episode of the [Rails Business Podcast](https://www.railsbusiness.com/2435951/episodes/18547312-striving-for-ideal-code) was about "striving for ideal code". The hosts are both typical "Rails Indie" owner/operators: a small team building a small SaaS.

They were discussing a [new podcast which is out from 37signals called "Recordables"](https://www.youtube.com/watch?v=BnhVXGZepA8). The discussion was envy for how good and clean 37signals' code was. This is a fair assessment. They've been open-sourcing a lot of real world products lately, including:

- [Campfire](https://once.com/campfire), the chat app.
- [Fizzy](https://github.com/basecamp/fizzy), the Kanban tool.

If you read them, the code looks great. We've only seen glimpses of this Rails style, which David has alluded to or shown small parts of in interviews or conference talks. Until now, we couldn't see what the Rails "house style" is because we never had a real open source application written in that style. Now we do.

The discussion on the podcast was mostly a sense of envy of how good the good was, and wondering: "Why doesn't our code look that good?"

Covet not thy neighbor's codebase.

The reason why your code doesn't look "as good" as 37signals' is because **your engineering strategy is not the same as theirs**.

37signals, [for all of its faults](https://techcrunch.com/2021/04/30/basecamp-employees-quit-ceo-letter/), has a unique engineering strategy, which I would summarize as:

* **Stay small** in terms of headcount to revenue ratio.
* **Ruthlessly cut scope**. 37signals' products usually _do_ far, far less than their competition.
* **Hire the top 10%** of engineers.

Most of the businesses I've ever worked for cannot say that _any_ of these three points are honestly part of their strategy.

Every time 37signals puts out a codebase or talks about their size in public, I am always shocked at how few LOC they are.

- [Basecamp Next/2 was originally 10,000 LOC](https://gist.github.com/dhh/2643144).
- [Basecamp 3 was 18,000 LOC when released](https://x.com/dhh/status/647163196839739392).
- Fizzy is 7,500 non-test LOC.
- Campfire is just 2,500 non-test LOC.

**That is fucking insane**. 37signals employs 25-30 technical employees, meaning that for each individual codebase, they're maintaining under 2,500 lines per person. Most companies manage 10x that per headcount. Most indies ship 100,000+ line Rails apps with 1 to 3 people. I know, because they've been an important part of my consulting client base for the last decade!

The default engineering strategy for most companies is: **if we ship one more feature, we will make more money**. From that follows **if we ship more features, we need more people to ship faster and maintain what exists**, and from that follows **our ability to hire good people won't keep up with how much we can pay and how fast we need to hire**, so they compromise. You end up with the exact opposite engineering strategy to 37signals.

And so, 37signals' strategy creates a flywheel: you have more developers maintaining fewer LOC, which allows them to apply more fixup/review cycles to the same lines over and over, whereas most shops have to just throw shit over the wall and move on to the next thing. That creates a cleaner codebase, which helps reduce needed headcount, which also increases your likelihood of hiring great people (because great people want to work on great code).

Most businesses cannot adopt the 37signals strategy because they are **fundamentally unwilling to relinquish the mindset** that "more features equals more money". And if 37signals has been consistent in anything when developing software, it's that they will not allow scope creep.

Another reason they can't implement this strategy is **they don't have product market fit**. If you're default-dead and you're gonna run out of money, or if you're kind of coasting along at $1m a year with 5 people, you need to try lots of new things to attain PMF. They simply don't have the luxury of running at $5 million of ARR per employee and spending all this time polishing everything they've got. They need to throw shit against the wall and study what sticks.

37signals is not full of geniuses. They are not better than you. What they've done is adopted a strategy that lets them ship better code.

And that's the rub: most software businesses don't know any other way to make money other than **more**. Ask yourself: is that really the only way?





