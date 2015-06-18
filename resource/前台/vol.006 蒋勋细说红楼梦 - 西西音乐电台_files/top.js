$(document).ready(function(){
	/*
	 * Back to Top
	 */
  	var backTop    = $("#back-to-top");

  	$(window).scroll(function() {  
      if ($(window).scrollTop() > 100) {  
        backTop.fadeIn(1500);  
      } else {  
        backTop.fadeOut(1500); 
      }  
    });  
    
    backTop.click(function() {  
      $('body').animate({scrollTop:0},1000);

      return false;  
    }); 
});

