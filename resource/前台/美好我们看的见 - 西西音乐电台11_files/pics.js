$(document).ready(function() {

	var pics = $("#pics");
	var page = 1;

	function pic () {
		$.ajax({
			url   : Home + "index.php?c=pic&m=data&page=" + page,
		   	type  : "GET",
		   	dataType : 'json',
		   	success: function(data) {
		   		if( data.status != 'over' )
		   		{
			   		$.each(data, function (index, value) {
			   			pics.append("<div class='col-xs-12 pic'><a href='index.php?c=pic&m=source&id=" + value.pid + "' target='_blank'><img src='" + value.path + "' class='img-responsive center-block'></a><p class='text-center text'>" + value.psize + " " + value.pwidth + " * " + value.pheight + " <a href='index.php?c=pic&m=source&id=" + value.pid + "' target='_blank'>查看原图</a></p></div>");
			   		})
			   	}
		    }
		})

		page++;
	}

	$(window).on('scroll', function() {
		if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
			pic();
		}
	})

	pic();
});