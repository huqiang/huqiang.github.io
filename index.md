---
layout: default
---

<header class="header">
  <h1>{{ site.title }}</h1>
</header>
<nav class="nave-bar">
  <ul>
    {% for item in site.data.navigation %}
    <li>
      <a href="{{ item.url }}">{{ item.title }}</a>
    </li>
    {% endfor %}
  </ul>
</nav>
<section class="blog">
  <header>
    <h1>Posts:</h1>
  </header>
  <section>
    <ul>
      {% for post in site.posts %}
      <li>
        <time class="date">{{ post.date | date: '%Y %b %d' }}</time> - <a href="{{ post.url }}">{{ post.title }}</a>
      </li>
      {% endfor %}
    </ul>
  </section>
</section>