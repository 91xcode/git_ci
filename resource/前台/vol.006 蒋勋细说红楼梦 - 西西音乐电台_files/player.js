$(document).ready(function(){

	var player   = $("#player"),
		add      = $("#player-wrapper .fa-plus"),
	 	remove   = $("#player-wrapper .fa-minus"),
	 	refresh  = $("#player-wrapper .fa-refresh"),
	 	next     = $("#player-wrapper .fa-forward"),
	 	previous = $("#player-wrapper .fa-backward"),
	 	name     = $("#player-wrapper .song-name"),
	 	volume   = $("#player-wrapper #volume"),
	 	names    = $("#vols .names"),
	 	spinner  = $("#spinner");

	var song   = 0;
	var counts = 0;

	var stream = {
		mp3: ''
	};

	var songs    = new Array();

	$.ajax({
		url   : "index.php?c=music&m=item",
	   	type  : "GET",
	   	async : false,
	   	dataType : 'json',
	   	beforeSend: function() {
	   		spinner.removeClass("hide");
	   	},
	   	success: function(json) {
	   		$.each(json, function (index, value) {
				var song = new Array();
				song['name'] = value.song_name;
				song['path'] = value.song_path;
				songs[index] = song;
				counts       = index;
			});
	    },
	    complete: function() {
	    	spinner.addClass("hide");
	    }
	})

	which();

	player.jPlayer({
		ready: function() {
			$(this).jPlayer("setMedia", stream).jPlayer("play");
		},
		play: function() {
			var NO = 0;
			names.each(function() {
				if ( NO == song ) {
					$(this).prev().prev().attr('src', 'dist/images/playing.gif')
				}
				NO++;
			})
		},
		pause: function() {
			var NO = 0;
			names.each(function() {
				if ( NO == song ) {
					$(this).prev().prev().attr('src', 'dist/images/pause.gif')
				}
				NO++;
			})
		},
		volumechange: function(event) {
			volume.text(event.jPlayer.options.volume);
		},
		ended: function() {
			if( refresh.hasClass('fa-spin') ) {
				player.jPlayer("setMedia", stream).jPlayer("play");
			} else {
				next.click();
			}
			
			$.ajax({
				url   : Home + "index.php?c=users&m=counts",
			   	type  : "GET",
			   	success: function(data) {
					
			    }
			})
		},
		swfPath             : "dist/jplayer",
		supplied            : "mp3",
		cssSelectorAncestor : "#player-wrapper"
	});

	function which () {
		stream = {
			mp3: songs[song]['path']
		};

		name.html(songs[song]['name']);

		var NO = 0;
		names.each(function() {
			$(this).prev().prev().hide();
			$(this).prev().show();
			if ( NO == song ) {
				$(this).prev().prev().show();
				$(this).prev().hide();
			}
			NO++;
		})

		player.jPlayer("setMedia", stream).jPlayer("play");
	}

	/* 按键事件 */

	names.click(function() {
		song = $(this).data('key');

		which();

		return false;
	})

	/* 下一曲 */
	next.click(function () {
		song++;

		if ( song > counts ) {
			song = 0;
		}

		which();

		return false;
	})
	/* 上一曲 */
	previous.click(function () {
		song--;

		if ( song < 0 ) {
			song = counts;
		}
		
		which();

		return false;
	})
	/* 增大音量 */
	add.click(function(event) {
		var vol    = parseFloat(volume.text()) * 10;
		if( vol < 10 ) {
			player.jPlayer("volume", (vol + 1) / 10);
		}

		return false;
	});
	/* 减小音量 */
	remove.click(function(event) {
		var vol    = parseFloat(volume.text()) * 10;
		if( vol > 0 ) {
			player.jPlayer("volume", (vol - 1) / 10);
		}

		return false;
	});
	/* 单曲循环 */
	refresh.click(function(event) {
		if( $(this).hasClass('fa-spin') ) {
			$(this).removeClass('fa-spin');
		} else {
			$(this).addClass('fa-spin');
		}
	});

	/* 键盘快捷键 */
	Mousetrap.bind('left', function () {
		previous.click();
	});

	Mousetrap.bind('right', function () {
		next.click();
	});
	
	Mousetrap.bind('=', function () {
		add.click();
	});

	Mousetrap.bind('-', function () {
		remove.click();
	});

});

