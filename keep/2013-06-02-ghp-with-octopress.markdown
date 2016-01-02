---
layout: post
title: "Why Octopress"
date: 2013-06-02 15:59
comments: false
categories: [Octopress, GithubPages]
---

## Static Site Generators FTW

A long, long time ago, on web far, far away, the original developers of the web built static pages by hand.  Soon, tooling caught up and templates could assemble pages pages together from "content" stored in other sources (usually databases).  Eventually, personalization meant every  page would be built per request.  Since servers had to generate each page instead of returning pre-built files, their scalability was limited.

Two concepts came to the rescue: REST and Dynamic HTML (which evolved into AJAX).  [Representaional State Transfer or REST](http://www.ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm) posited that _resources_ could be more cacheable.  And DHTML/AJAX made it common to Create, Replace, Update or Delete _portions_ of a page.  By applying these concepts intelligently, most, if not all, of the pages could be stored and reused.  This *caching* could be done at different layers, from the data source, to inside the app servers to even the web server.

With flexible caching strategies, the generation from templates can be moved around and execute less frequently.  In the case of blog content, generation only needs to happen at original post and repeated for any edits.  (Comments can be AJAX'ed away or moved to external services, such as [Disqus](http://disqus.com/).)  Flexible generation also allowed questioning the *data sources*.  Databases had long been the most common data source.  But they frequently have specialized administrators.  Also, databases excel at structured content while web content is ... well, frequently unstructured.

Part of *[Content Strategy](http://alistapart.com/article/thedisciplineofcontentstrategy)* is letting the authors focus on the _content_.  The content itself may have some structure, but time spent formatting or determining how to get into the data source is wasted effort.  [MarkDown](http://en.wikipedia.org/wiki/Markdown) and [AsciiDoc](http://asciidoctor.org/docs/asciidoc-writers-guide/) have stepped in as generic converters of plain text into HTML.  Both focus on the content with minimal syntax or formatting to distract the author from his or her message.  *Static Site Generators* use some markup flavor with a template engine in a large variety of languages to build static web pages.  One of the most popular and mature solutions is [Jekyll](http://jekyllrb.com/), a Ruby solution that transforms "your plain text into static websites and blogs."  Part of its popularity, especially among developers, is jekyll support in [GitHub Pages](http://pages.github.com/).

## Pros and Cons of Static Site Generators

I built this list by borrowing heavily from [An Intro to Static Site Generators](http://www.mickgardner.com/2012/12/an-introduction-to-static-site.html)

* \+ Security.  No database or live templates to compromise with static content.
* \+ Performance.  Just serving files, so web servers have less work to do.
* \+ Content separated from servers.  This gives flexibility in hosting (and migration).
* \+ Lowest Common Denominator.  Any host can serve HTML (no worries about supporting your language or tools).
* \+ Scalability.  If you have more load, add more web servers and rsync (or other copy) the content over.
* \- Updates require generator computers (hard to do from your phone).  Some other tools exist to relieve this.
* \- Dynamic content requires external services or tools.

## Extending Jekyll

[Octopress](http://octopress.org/) is built on top of Jekyll, so it carries forth all the strengths of it.  Octopress starts with smart defaults, such as HTML5 support and "[Mobile First](http://www.lukew.com/resources/mobile_first.asp)" responsive design.  Its plugin architecture to make it easy to turn features on and off, such as:

* Social Integration of Twitter, Google+, Disqus comments
* HTML5 philosophy, including video tags
* display source code: includes, gist, partial renders
* Templates that support pre-processors such as SASS, Haml
* Themes: [3rd Party](https://github.com/imathis/octopress/wiki/3rd-Party-Octopress-Themes) or build your own
* Category generation
* Analytics


## Related Posts

* [Paul Rayner "Blogging With Octopress and Github Pages"](http://thepaulrayner.com/blog/2013/02/04/blogging-with-octopress-and-github-pages/)
* [Neil Smith "Octopress is Pretty Great"](http://www.neilsmithline.com/2013/03/octopress-is-pretty-great.html)
* [Use Octopress instead of Jekyll](http://joelmccracken.github.io/entries/octopress-is-pretty-sweet/)
* [Use Jekyll? You Really Should Be Using Octopress](http://joelmccracken.github.io/entries/octopress-is-pretty-sweet/)
