---
layout : index
title : Blog
---

{% for post in site.posts %}

### **{{post.title}}** -- {{post.date | date_to_long_string}}
{{post.content}}

{% endfor %}
