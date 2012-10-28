
/**
 * Stub.
 */

(function(){
 //non-jquery self-executing closure...
})();

$(document).ready(function(){
  $('h1').addClass('asdf-title');

  $('.result-text').hide();
  console.log("Fading in #result...");
  $('.result-text').fadeIn(2000, function() {
    console.log("Fading in .result-text...");
  });

});

(function() {
  var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
  po.src = 'https://apis.google.com/js/plusone.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
