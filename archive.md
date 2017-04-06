---
published: true
layout: page
title: Archive
comments: false
---

<style type="text/css">
  .content a {
    color: #000000;
  }
  .content .listing-seperator {
    font-weight: bold;
  }
  .content .listing-item, .listing-seperator {
    list-style-type: none;
  }
  .content #select-all-button {
    text-decoration: underline;
  }
  .content #tag-cloud, #posts-in-tags {
    display: none;
  }
</style>


<section id="archive-nav">
  <span id="select-all">
    <a href="#select-all" id="select-all-button" title="all posts">all posts</a>
  </span>
  <span id="select-tag">
    <a href="#select-tag" id="select-tag-button" title="select tag">select tag</a>
  </span>
</section>

<section id="all-posts">
  <div>
    <ul class="listing">
    {% for post in site.posts %}
      {% capture y %}{{post.date | date:"%Y"}}{% endcapture %}
      {% if year != y %}
        {% assign year = y %}
        <li class="listing-seperator">{{ y }}</li>
      {% endif %}
      <li class="listing-item">
        <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
        <a href="{{ site.baseurl }}{{ post.url }}" target="_blank" title="{{ post.title | xml_escape }}">{{ post.title }}</a>
      </li>
    {% endfor %}
    </ul>
  </div>
</section>

<section id="posts-in-tags">
  <div id="tag-cloud">
  {% for tag in site.tags %}
    <a href="#{{ tag[0] | xml_escape }}" id="tag-cloud-button" title="{{ tag[0] | xml_escape }}" rel="{{ tag[1].size }}">{{ tag[0] }}</a>
  {% endfor %}
  </div>
  <ul class="listing">
  {% for tag in site.tags %}
    <li class="listing-seperator" id="{{ tag[0] | xml_escape }}">{{ tag[0] }}</li>
  {% for post in tag[1] %}
    <li class="listing-item">
    <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
    <a href="{{ site.baseurl }}{{ post.url }}" target="_blank" title="{{ post.title | xml_escape }}">{{ post.title }}</a>
    </li>
  {% endfor %}
  {% endfor %}
  </ul>
</section>


<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="{{ site.baseurl }}/public/js/jquery.tagcloud.js"></script>
<script language="javascript">
  /*
   * The code is modified from the source
   * of http://yihui.name/en/tags/.
   */
  $.fn.tagcloud.defaults = {
    size: {start: 1, end: 1, unit: 'em'},
    color: {start: '#e6e6e6', end: '#000000'}
  };
  $(function () {
    $('#tag-cloud a').tagcloud();
  });

  $('#select-all-button').click(function(event){
    //event.preventDefault();
    $('#select-all-button').css('text-decoration', 'underline');
    $('#all-posts').show();
    $('#select-tag-button').css('text-decoration', 'none');
    $('#tag-cloud').hide();
    $('#posts-in-tags').hide();
  });
  $('#select-tag-button').click(function(event){
    //event.preventDefault();
    $('#select-all-button').css('text-decoration', 'none');
    $('#all-posts').hide();
    $('#select-tag-button').css('text-decoration', 'underline');
    $('#tag-cloud').show();
    $('#posts-in-tags').show();
  });
</script>
