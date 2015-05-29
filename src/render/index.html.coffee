---
layout: 'default'
---
style ->
  #if @feedr.feeds.api.image
  backgroundImg = @feedr.feeds.api.image || '/images/berlin-wall.png'
  text ".header {background-image: url(" + backgroundImg + ");}"

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
          when 'direct_qoute'
            div class:'quote', ->
              span class:'quote__sign', ->
                text '"'
              text section.body
              span class:'quote__sign', ->
                text '"'
            span class:'quote__person', ->
              text section.title
      when 'panel_image'

        for image in section.images
          figure class:'image-section', ->
            srcset = "#{image.small} 320w,#{image.medium} 800w,#{image.large} 800w"
            sizes="99vw"
            img srcset: srcset, src:image.large, alt:'some alt text', class:'image-section__image'
            figcaption class:'image-section__figcaption', ->
              text 'Some caption text'

