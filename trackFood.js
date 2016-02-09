$(document).ready(function(){
	$("img").click(function(){
		var item = $(this).context;
		$("#foodLog").append(item);
	});
})