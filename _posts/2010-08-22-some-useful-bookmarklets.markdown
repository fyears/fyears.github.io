---
date: '2010-08-22 00:51:57'
redirect_from:
  /2010/08/some-useful-bookmarklets/
layout: post
slug: some-useful-bookmarklets
status: publish
title: some useful bookmarklets
wordpress_id: '361'
categories:
- interesting
tags:
- bookmarklets
- interesting
- live
---

**Live Bookmarklet**

Each [bookmarklet](http://www.fyears.org/2010/08/some-useful-bookmarklets/) is a tiny program (a JavaScript application) contained in a bookmark (the URL is a "javascript:" URL) which can be saved and used the same way you use normal bookmarks.

Anyone should drag these links and drop them onto their bookmarks toolbar (IE is not recommended) and then use the bookmarklets in suitable pages.

I would like to note down some [useful bookmarklets](http://www.fyears.org/2010/08/some-useful-bookmarklets/) in my blog.



The info here was last updated on 2010-08-22.

If readers read this post in RSS Readers, the bookmarklets will not work. Please come to the [original page](http://www.fyears.org/2010/08/some-useful-bookmarklets/) to obtain the true bookmarklets.




  * [highlight](javascript: ( function (){ var%20count=0,%20text,%20dv;text=prompt ( "Search%20phrase:",%20"" ) ;if ( text==null%20 || %20text.length==0 ) return;dv=document.defaultView;function%20searchWithinNode ( node,%20te,%20len ){ var%20pos,%20skip,%20spannode,%20middlebit,%20endbit,%20middleclone;skip=0;if ( %20node.nodeType==3%20 ){ pos=node.data.toUpperCase () .indexOf ( te ) ;if ( pos>=0 ){ spannode=document.createElement ( "SPAN" ) ;spannode.style.backgroundColor="yellow";middlebit=node.splitText ( pos ) ;endbit=middlebit.splitText ( len ) ;middleclone=middlebit.cloneNode ( true ) ;spannode.appendChild ( middleclone ) ;middlebit.parentNode.replaceChild ( spannode,middlebit ) ;++count;skip=1; }} else%20if ( %20node.nodeType==1&&%20node.childNodes%20&&%20node.tagName.toUpperCase () !="SCRIPT"%20&&%20node.tagName.toUpperCase!="STYLE" ){ for%20 ( var%20child=0;%20child%20< %20node.childNodes.length;%20++child ){ child=child+searchWithinNode ( node.childNodes[child],%20te,%20len ) ; }} return%20skip; } window.status="Searching%20for%20'"+text+"'...";searchWithinNode ( document.body,%20text.toUpperCase () ,%20text.length ) ;window.status="Found%20"+count+"%20occurrence"+ ( count==1?"":"s" ) +"%20of%20'"+text+"'."; })() ;)  

highlight words (not IE)


  * [highlight regexp](javascript: ( function (){ var%20count=0,%20text,%20regexp;text=prompt ( "Search%20regexp:",%20"" ) ;if ( text==null%20 || %20text.length==0 ) return;try { regexp=new%20RegExp ( " ( "%20+%20text%20+" ) ",%20"i" ) ; } catch ( er ){ alert ( "Unable%20to%20create%20regular%20expression%20using%20text%20'"+text+"'.nn"+er ) ;return; } function%20searchWithinNode ( node,%20re ){ var%20pos,%20skip,%20spannode,%20middlebit,%20endbit,%20middleclone;skip=0;if ( %20node.nodeType==3%20 ){ pos=node.data.search ( re ) ;if ( pos>=0 ){ spannode=document.createElement ( "SPAN" ) ;spannode.style.backgroundColor="yellow";middlebit=node.splitText ( pos ) ;endbit=middlebit.splitText ( RegExp.$1.length ) ;middleclone=middlebit.cloneNode ( true ) ;spannode.appendChild ( middleclone ) ;middlebit.parentNode.replaceChild ( spannode,middlebit ) ;++count;skip=1; }} else%20if ( %20node.nodeType==1%20&&%20node.childNodes%20&&%20node.tagName.toUpperCase () !="SCRIPT"%20&&%20node.tagName.toUpperCase!="STYLE" ){ for%20 ( var%20child=0;%20child%20< %20node.childNodes.length;%20++child ){ child=child+searchWithinNode ( node.childNodes[child],%20re ) ; }} return%20skip; } window.status="Searching%20for%20"+regexp+"...";searchWithinNode ( document.body,%20regexp ) ;window.status="Found%20"+count+"%20match"+ ( count==1?"":"es" ) +"%20for%20"+regexp+"."; })() ;)  

highlight regexp (not IE)


  * [spaces between num and en and zh in wp](javascript: (function(){var q;q=document.getElementById(‘content’).value;q=q.replace(/([a-zA-Z0-9~!@#$%^&*-_+=,<.>/?:%22]+)/g,%22%20$1%20%22);q=q.replace(/%20′%20/g,%22′%22);q=q.replace(/%20%20/g,%22>%22);q=q.replace(/(%20+)/g,%22%20%22);document.getElementById(‘content’).value=q;})();)  

add spaces between num and en and zh in wp


  * [share Live Photos!](javascript:(function(){ss=document.createElement('script');ss.type='text/javascript';ss.src='http://liveto.me/bookmarklet/getimgcode.js';document.body.appendChild(ss);})();)  

get  form sharing code for Live Phones


  * [get direct link](javascript:var%20n=document.title.replace('%20-%20Windows%20Live','');var%20id=((location.hash=='')?window.selfPageData.currentItemHash:location.hash).replace('#resId/','');var%20u='http://storage.live.com/items/'+id+'?filename='+encodeURI(n);var%20p='http://'+document.location.host+'/redir.aspx?page=self&resId='+id;var%20e='<input%20onmouseover=%22this.select();%22%20onclick=%22this.select();%22%20value=%22';var%20f='%22%20style=%22width:580px%22%20type=%22text%22%20/><br />';var%20d='by%20(<a%20href=%22http://rpsh.net/%22>Rpsh</a>)';var%20c='u5916u94FEu5730u5740:'+d+e+u+f+'u5206u4EABu5730u5740:'+e+p+f;var%20a=document.getElementById('content');var%20g=(a.getElementsByTagName('p')[0]);var%20b=g?g:document.createElement('P');b.innerHTML=c;a.insertBefore(b,a.firstChild);void(0))  

get direct link for skydrive (updated on 2009-09-09)


  * [j.mp link](javascript:var%20e=document.createElement('script');e.setAttribute('language','javascript');e.setAttribute('src','http://j.mp/bookmarklet/load.js');document.body.appendChild(e);void(0);)  

get shortened link from j.mp


  * [bit.ly link](javascript:var%20e=document.createElement('script');e.setAttribute('language','javascript');e.setAttribute('src','http://bit.ly/bookmarklet/load.js');document.body.appendChild(e);void(0);)  

get shortened link from bit.ly


  * [add to Google Reader](javascript:var%20b=document.body;var%20GR________bookmarklet_domain='http://www.google.com';if(b&&!document.xmlVersion){void(z=document.createElement('script'));void(z.src='http://www.google.com/reader/ui/link-bookmarklet.js');void(b.appendChild(z));}else{})  

add current page to Google Reader


  * [PrintWhatYouLike](javascript:(function(){if(window['ppw']&&ppw['bookmarklet']){ppw.bookmarklet.toggle();}else{window._pwyl_home='http://www.printwhatyoulike.com/';window._pwyl_pro_id=null;window._pwyl_bmkl=document.createElement('script');window._pwyl_bmkl.setAttribute('type','text/javascript');window._pwyl_bmkl.setAttribute('src',window._pwyl_home+'static/compressed/pwyl_bookmarklet_10.js');window._pwyl_bmkl.setAttribute('pwyl','true');document.getElementsByTagName('head')[0].appendChild(window._pwyl_bmkl);}})();)  

Print What You Like


  * [SoGou Input](javascript:void((function(){var%20e=document.createElement('script');e.setAttribute('src','http://web.pinyin.sogou.com/web_ime/init.js');document.body.appendChild(e);})()))  

SoGou cloud Pinyin IME


  * [QQ Input](javascript:(function(q){!!q?q.toggle():(function(d,j){j=d.createElement('script');j.src='http://ime.qq.com/fcgi-bin/getjs';j.setAttribute('ime-cfg','lt=2');d.getElementsByTagName('head')[0].appendChild(j)})(document)})(window.QQWebIME))  

QQ cloud Pinyin IME


