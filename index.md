---
layout : page
title : Blog
---
		
{% for post in site.posts %}

### **{{post.title}}** -- {{post.date | date_to_long_string}}
{{post.content}}

<!--			<li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>-->
{% endfor %}


