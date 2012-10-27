---
title: fleeting years
sub_title: Fleeting years bright the life. // 流光溢彩，年华转逝。
layout: page
---
<div class="row-fluid">
  <div class="span2"></div>
  <div class="span8">
    <ul class="listing">
      {% for post in site.posts %}
        {% capture y %}{{post.date | date:"%Y"}}{% endcapture %}
        {% if year != y %}
          {% assign year = y %}
          <li class="listing-seperator">{{ y }}</li>
        {% endif %}
        <li class="listing-item">
          <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
          <a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
        </li>
      {% endfor %}
     </ul>
  </div>
  <div class="span2"></div>
</div>

