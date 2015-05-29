/* Your scripts go here */
(function() {
  var MAX_WORD_COUNT = 30;
  var collapseClass = 'is-collapsed';

  $('.js-extendable').each(function() {
    var wordCount = 0;
    var isLimitReached = false;

    $(this).find('p').each(function() {
      var self = $(this)
      if (isLimitReached) {
        self.addClass(collapseClass);
        return;
      }

      var currentWordCount = self.text().match(/\S+/g).length;
      wordCount += currentWordCount;

      if(wordCount > MAX_WORD_COUNT) {
        isLimitReached = true;
        self.after('<a href="#" class="js-extendable__extend">Read more</a>')
      }
    });
  });
  $(document).on('click', '.js-extendable__extend', function(e) {
    e.preventDefault();
    var self = $(this);
    self.css({'display': 'none'});

    self.parent().find('p.' + collapseClass).each(function() {
      var self = $(this);
      self.animate({height: self.get(0).scrollHeight},200, function() {
        $(this).removeClass(collapseClass);
      });
    });
  });
})();