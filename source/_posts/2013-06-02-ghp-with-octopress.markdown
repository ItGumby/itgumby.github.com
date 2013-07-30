---
layout: post
title: "GHP with Octopress"
date: 2013-06-02 15:59
comments: false
categories: [Octopress, GithubPages]
---

## Why Octopress?

###Static site generators are in


###Simplifying Jekyll

###Easy Extensions - plugins and themes

###Other Opinions

[Paul Rayner "Blogging With Octopress and Github Pages"](http://thepaulrayner.com/blog/2013/02/04/blogging-with-octopress-and-github-pages/)

[Neil Smith "Octopress is Pretty Great"](http://www.neilsmithline.com/2013/03/octopress-is-pretty-great.html)

[Use Octopress instead of Jekyll](http://joelmccracken.github.io/entries/octopress-is-pretty-sweet/)


## Steps

### Prepare

### New Post

### Preview, Publish

1. Ruby Versions [Ruby with RVM](http://octopress.org/docs/setup/rvm/) or RBENV
* Start GHP [octopress setup](http://octopress.org/docs/setup/)
* Deploy to GHP [Deploy to GitHub Pages](http://octopress.org/docs/deploying/github/)
* Configure [Configure Octopress](http://octopress.org/docs/configuring/)
  1. future: visit plugins: [Existing Plugins](http://jekyllrb.com/docs/plugins/)
  * future: create asciidoc plugin: [Contribute Plugin](http://jekyllrb.com/docs/contributing/)
  * revisit: 3rd Party Settings: \[G+, Disqus, GA]
  * dickens of a time pushing local source branch
    * change `git config --global push.default current`
    * change `git branch --set-upstream source origin/source`
* Blogging [Octopress Blogging Basics](http://octopress.org/docs/blogging/)
  * New Post: `rake new_post["post name"]`
    * "Rakefile" dictates the created file
    * default new file: `source/_posts/YYYY-MM-DD-post-name.markdown`
    * optional [yaml front matter](http://jekyllrb.com/docs/frontmatter/)
      * author: Your Name
      * published: false _# prevents article posting_
      * categories: [CSS3, Sass, Media Queries] _# single, list, or even dash per line_
  * New Page: `rake new_page[about]`
    * => ${SITE}/about.html
    * if `rake new_page[about/index.markdown]` => ${SITE}/about/
  * Page Content
    * [Liquid Template features](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers)
    * [Page Variables](http://jekyllrb.com/docs/variables/)
    * [embedded code](http://octopress.org/docs/blogging/code/)
    * import into page [render partial](http://octopress.org/docs/plugins/render-partial/)
  * Generate, Preview
    1. `rake generate` _# Generates posts and pages into the public directory_
    * `rake watch`    _# Watches source/ and sass/ for changes and regenerates_
    * `rake preview`  _# Watches, and mounts a webserver at http://localhost:4000_
  * Changes to branch `source`
    1.  git checkout source
    * `rake new_post["My Post"]` _# may need to do in correct shell (for me, bash instead of zsh)_
    * edit post `./source/_posts/YYYY-MM-DD-my-post.markdown`
    * generate HTML (repeat `rake generate; rake watch; rake preview` until satisfied)
    * add source changes `git add .; git commit -m "My Post"`
    * push source changes `git push origin source`
    * push generated HTML `rake deploy`

## Future Enhancements
