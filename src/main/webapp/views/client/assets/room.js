
$(document).ready(function() {

	$('.imgRoom').mouseenter(function() {

		$(this).animate({
			width: "99%"
		}, 700);

	});

	$('.imgRoom').mouseleave(function() {

		$(this).animate({
			width: "100%"
		}, 700);
	});
});