// var food = {
// 	name: "Apple",
// 	imgUrl: "",
// 	Carolie: 80,
// }
// var foodInfo = [];
// var foodList = [];



$(document).ready(function(){
	$("img").click(function(){
		var item = $(this).context;
		$("#foodLog").append(item);
	});
})