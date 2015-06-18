$(document).ready(function(){

	var heartsong  = $(".fa-heart-song"),
	    heartmusic = $(".heart-music"),
	    heartyue   = $(".heart-yue");

		/* 收藏歌曲 */
	heartsong.click(function() {

		var song  = $(this).data('song');
		var $this = $(this);
		
		$.ajax({
			url   : Home + "index.php?c=users&m=heart&id=" + song + "&soucre=0",
		   	type  : "GET",
		   	success: function(data) {
		   		switch(data) {
		   			case '0':
		   				location.href = Home + 'index.php?c=login';
		   				break;
		   			case '1':
		   				$this.removeClass('text-danger');
		   				break;
		   			case '2':
		   				$this.addClass('text-danger');
		   				break;
		   			default:
		   				break;
		   		}
		    }
		})

	})

	heartmusic.click(function() {

		var music = $(this).data('music');
		var $this = $(this);
		var count = parseInt( $(this).next().html() );

		$.ajax({
			url   : Home + "index.php?c=users&m=heart&id=" + music + "&soucre=1",
		   	type  : "GET",
		   	success: function(data) {
		   		switch(data) {
		   			case '0':
		   				location.href = Home + 'index.php?c=login';
		   				break;
		   			case '1':
		   				$this.removeClass('text-danger');
		   				$this.next().html(count-1);
		   				break;
		   			case '2':
		   				$this.addClass('text-danger');
		   				$this.next().html(count+1);
		   				break;
		   			default:
		   				break;
		   		}
		    }
		})
	})

	heartyue.click(function() {

		var yue   = $(this).data('yue');
		var $this = $(this);
		var count = parseInt( $(this).next().html() );

		$.ajax({
			url   : Home + "index.php?c=users&m=heart&id=" + yue + "&soucre=2",
		   	type  : "GET",
		   	success: function(data) {
		   		switch(data) {
		   			case '0':
		   				location.href = Home + 'index.php?c=login';
		   				break;
		   			case '1':
		   				$this.removeClass('text-danger');
		   				$this.next().html(count-1);
		   				break;
		   			case '2':
		   				$this.addClass('text-danger');
		   				$this.next().html(count+1);
		   				break;
		   			default:
		   				break;
		   		}
		    }
		})
	})
})