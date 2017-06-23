---
title: "Test page"
layout: default
lang: en
---
{% assign url_parts = page.url | split: '/' %}
{% assign url_parts_size = url_parts | size %}
{% assign rm = url_parts | last %}
{% assign base_url = page.url | replace: rm %}

<ul>
{% for node in site.static_files %}
  {% if node.path contains base_url %}
    {% assign node_path_parts = node.path | split: '/' %}
    {% assign node_path_parts_size = node_path_parts | size %}
    {% assign filename = node_path_parts | last %}
    {% if url_parts_size == node_path_parts_size and filename != 'index.md' %}
      <li><a href='{{ filename }}'>{{ filename }}</a></li>
    {% endif %}
  {% endif %}
{% endfor %}
</ul>