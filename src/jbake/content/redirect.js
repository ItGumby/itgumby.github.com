function redirect() {
  // trim octopress trailing slash, paths & folders, and any leading dates
  var matchPath = window.location.pathname.replace(/\/$/, '').replace(/^.*\//, '');
  var dest = document.querySelector('.container a[href*="' + matchPath + '"]');
  if (dest) {
    console && console.log('redirecting from: ' + window.location.pathname + ' to ' + dest['href']);
    window.location.replace(dest['href']);
  }
}

if (document.readyState != 'loading') redirect();
else document.addEventListener('DOMContentLoaded', redirect);
