---
published: true
layout: page
require_tag_cloud: true
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
        <a href="{{ site.baseurl }}{{ post.url }}" target="_blank" title="{{ post.title }}">{{ post.title }}</a>
      </li>
    {% endfor %}
    </ul>
  </div>
</section>

<section id="posts-in-tags">
  <div id="tag-cloud">
  {% for tag in site.tags %}
    <a href="#{{ tag[0] }}" id="tag-cloud-button" title="{{ tag[0] }}" rel="{{ tag[1].size }}">{{ tag[0] }}</a>
  {% endfor %}
  </div>
  <ul class="listing">
  {% for tag in site.tags %}
    <li class="listing-seperator" id="{{ tag[0] }}">{{ tag[0] }}</li>
  {% for post in tag[1] %}
    <li class="listing-item">
    <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
    <a href="{{ site.baseurl }}{{ post.url }}" target="_blank" title="{{ post.title }}">{{ post.title }}</a>
    </li>
  {% endfor %}
  {% endfor %}
  </ul>
</section>
