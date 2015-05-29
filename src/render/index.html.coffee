---
layout: 'default'
---
style ->
  text ".header {background-image: url(" + '/images/berlin-wall.png' + ");}"

header class:"header", ->
  h1 class:"header__heading", ->
    @feedr.feeds.api.title

div class:'article__content', ->
  for section in @feedr.feeds.api.sections
    switch (section.section)
      when 'panel_text'
        switch (section.text_type)
          when 'full_text'
            div class:'text-section', ->
              text section.body
          when 'fact_box'
            div class:'factbox', ->
              h2 class:'factbox__heading', ->
                text section.title
              div class:'factbox__text js-extendable', ->
                text section.body
      when 'panel_image'
        for image in section.images
          figure class:'image-section', ->
            img src:image.large, alt:'some alt text', class:'image-section__image'
            figcaption class:'image-section__figcaption', ->
              text 'Some caption text'

