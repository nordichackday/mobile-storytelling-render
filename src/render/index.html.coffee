---
layout: 'default'
---
style ->
  #if @feedr.feeds.api.image
  backgroundImg = @feedr.feeds.api.main_image.medium || '/images/berlin-wall.png'
  text ".header {background-image: url('" + backgroundImg + "');}"

header class:"header", ->
  h1 class:"header__heading", ->
    @feedr.feeds.api.title

div class:'article__content', ->
  div class:'article__intro', ->
    text @feedr.feeds.api.summary

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
            img src:image.small, alt:'some alt text', class:'image-section__image', sizes:"90vw"
            if image.caption
              figcaption class:'image-section__figcaption', ->
                text image.caption
      when 'panel_video'
        div class:'video-section', ->
          embedUrl = 'https://www.youtube.com/embed/' + section.youtube_link
          iframe src:embedUrl, frameborder:'0', allowfullscreen:'allowfullscreen', class:'video-section__iframe'
