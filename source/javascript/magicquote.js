
// Hex: #FFE66D
// HSL: 50° 100% 71%
// RGB: 255 230 109

var getAverage = function(minNumber, maxNumber, percent) {
  return ((maxNumber - minNumber) * percent) + minNumber;
};

function hueShift(h, s) {
    h+=s; while (h>=360.0) h-=360.0; while (h<0.0) h+=360.0; return h;
}

var getHsl = function(percent) {

  var h = 50;
  var s = 100;
  var l = getAverage(70, 100, percent);;
  return {
    'background': [h, s, l],
    'text': []
  };
};

jQuery(function(){

  var $jq = jQuery;

  var doc = $jq(document);
  var jqWindow = $jq(window);
  var magicQuote = $jq('.post-magicquote');

  var handleScroll = function() {
    var scrollTop = doc.scrollTop();
    var vpBottom =  scrollTop + doc.height();
    magicQuote.each(function() {
      var quoteElement = $jq(this);
      var elementTop = quoteElement.offset().top;
      var windowHeight = jqWindow.height();
      var percentDisplayed = ((elementTop - scrollTop) / windowHeight) ** 2;
      console.log(percentDisplayed);
      if (percentDisplayed > 1.1 || percentDisplayed < -0.1) {
        return;
      }
      var hsl = getHsl(percentDisplayed);
      console.log('viewport: %s background: %s, text %s', percentDisplayed,
                  hsl['background'].join(' '), hsl['text'].join(' '));

      var b = hsl['background']
      var backCss = ['hsl(', b[0], ', ', b[1]+'%, ', b[2], '%)'].join('');
      quoteElement.css('background-color', backCss);

      var t = hsl['text'];
      if (t.length) {
        var textCss = ['hsl(', t[0], ', ', t[1]+'%, ', t[2], '%)'].join('');
        quoteElement.css('color', textCss);
      }

    });
  }

  $jq(window).bind('scroll', handleScroll);
  handleScroll();
});
