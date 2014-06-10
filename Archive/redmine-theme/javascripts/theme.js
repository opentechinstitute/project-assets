document.observe("dom:loaded", function() {
  if (document.body.className.indexOf('controller-calendars') != -1) $('main').addClassName('nosidebar');
  $('top-menu').replace('<div id="top-menu"><div id="top-menu-inner">' + $('top-menu').innerHTML + '</div></div>');
  $('top-menu-inner').insert({top: '<a id="home" rel="home" href="/"><img id="logo" alt="" src="/themes/new-commotion/images/commotion_kbabout_measure-03.png"></a>'});
  $('header').replace('<div id="header"><div id="header-inner">' + $('header').innerHTML + '</div></div>');
  $('footer').replace('<div id="footer"><div id="footer-inner">' + $('footer').innerHTML + '</div></div>');
  $('header-inner').down('h1').insert({before: '<hr>'});
  $('sidebar').replace('<div id="sidebar"><div id="page-menu">' + $('sidebar').innerHTML + '</div></div>');
  $('sidebar').insert({bottom: $('main-menu')});
  $('quick-search').down('select').writeAttribute('id','quick-nav');
  $('header-inner').insert({bottom: $('quick-nav')});
});