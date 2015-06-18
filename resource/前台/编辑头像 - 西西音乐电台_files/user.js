$(document).ready(function(){

    var image  = $(".image");
    var avatar = $(".avatar");

    image.click(function() {

      image.each(function() {
        $(this).removeClass('active');
      })
 
      $(this).addClass('active');

      var img = $(this).data("image");

      $.ajax({
        url   : Home + "index.php?c=users&m=image&img=" + img,
          type  : "GET",
          success: function(data) {

          }
      })
    })

    avatar.click(function() {

      avatar.each(function() {
        $(this).removeClass('active');
      })
 
      $(this).addClass('active');

      var ava = $(this).data("avatar");

      $.ajax({
        url   : Home + "index.php?c=users&m=setavatar&ava=" + ava,
          type  : "GET",
          success: function(data) {

          }
      })
    })

});

