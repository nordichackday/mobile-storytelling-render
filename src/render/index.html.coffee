---
layout: 'default'
---
style ->
  text ".header {background-image: url(" + @site.data.image + ");}"

header class:"header", ->
  h1 class:"header__heading", ->
    @site.data.title

div class:'article__content', ->
  for section in @site.data.sections
    switch (section.type)
      when 'text'
        div ->
          text section.body
      when 'image'
        figure class:'image-section', ->
          img src:section.src, alt:section.alt, class:'image-section__image'
          figcaption class:'image-section__figcaption', ->
            text section.alt
      when 'factbox'
        div class:'factbox', ->
          h2 class:'factbox__heading', ->
            text section.title
          text section.body

