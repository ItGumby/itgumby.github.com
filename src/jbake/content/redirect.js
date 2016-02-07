;
// trim octopress trailing slash, paths & folders, and any leading dates
var reqPage = window.location.pathname.replace(/\/$/, '').replace(/^.*\//, '').replace(/^[-0-9]*/, '').replace(/\.[a-z]+/, '');
if (reqPage == '404.html') reqPage = 'blog/2014/02/cq-defineObjects-cheatsheet/';
console && console.log('request = ' + reqPage);
if (reqPage.length) {
  var links = document.getElementsByTagName('a');
  var hrefs = [];
  for (var i=0; i< links.length; i++) {
    if (links[i]['href'].match(reqPage)) { hrefs.push(links[i]['href']); }
  }
  if (hrefs.length == 1) {
    console.log('redirect to: ' + hrefs[0]);
    //window.location.replace(hrefs[0]);
  } else {
    console.log('matching links: ' + hrefs);
  }
} else {
  console && console.log('no page extracted from ' + window.location.pathname);
};
