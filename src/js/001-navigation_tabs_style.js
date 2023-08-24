window.onload = currentNavTab();

function currentNavTab() {
    const url = window.location.href.toString();
    switch (true) {
      case checkUrl(url, '/search/item') || checkUrl(url, '/search/designer'):
        navTabAccent('tabs-designs')
        break;
      case checkUrl(url, '/search/shop'):
        navTabAccent('tabs-shops')
        break;
      case checkUrl(url, '/cart'):
        navTabAccent('tabs-checkout')
        break;
    }
}
  
function checkUrl(url, string) {
    if (url.indexOf(string) > -1) {
      return true;
    } else {
      return false;
    }
}
  
function navTabAccent(id){
    document.getElementById(id).style.color = '#4579fc';
    document.getElementById(id).style.fontWeight = '500';
}