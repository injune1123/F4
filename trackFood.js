$(document).ready(function() {




    // // Parse.initialize("oaCGKl95hh4gpSnv7JKIDyuSv80Io2EffqRSmNJb", "mbI7suEL5UQQVDwId2YWapNJNywIkUVP0DTgpWof");

    // var foodList = [];
    // var fruits = [{

    //     name: "Apple",
    //     imgUrl: "http://pngimg.com/upload/apple_PNG40.png",
    //     calorie: 57
    // }, {
    //     name: "orange",
    //     imgUrl: "http://schoolofthinking.org/wp-content/uploads/2007/12/orange_PNG766.png",
    //     calorie: 45
    // }, {
    //     name: "banana",
    //     imgUrl: "http://pngimg.com/upload/banana_PNG835.png",
    //     calorie: 105

    // }];

    // var drinks = [{
    //     name: "coffee",
    //     imgUrl: "http://www.notyourmotherscookbook.com/images/cup-of-coffee.jpg",
    //     calorie: 136
    // }, {
    //     name: "milk",
    //     imgUrl: "https://pixabay.com/static/uploads/photo/2014/09/04/05/27/milk-435295_640.png",
    //     calorie: 103
    // }, {
    //     name: "bear",
    //     imgUrl: "http://www.edgewoodyachtclub.com/wp-content/uploads/2016/01/beer.gif",
    //     calorie: 154
    // }];


    // var food = [{
    //     name: "fried rice",
    //     imgUrl: "http://www.mrhowontonhouse.com/wp-content/uploads/2012/10/Rice5.jpg",
    //     calorie: 228
    // }, {
    //     name: "sandwich",
    //     imgUrl: "http://blogs.plos.org/obesitypanacea/files/2014/10/sandwich.jpg",
    //     calorie: 340

    // }, {
    //     name: "pizza",
    //     imgUrl: "http://www.palermospizza.com/Media/Default/Our%20Pizzas/Primo%20Thin/slice_PT_Margherita.png",
    //     calorie: 285
    // }];

    // var snacks = [{
    //     name: "nuts",
    //     imgUrl: "http://www.albanesecandy.com/candy-store/images/products/popup/deluxe-mixed-nuts-roasted-and-salted_2.jpg?v=1427738538",
    //     calorie: 228
    // }, {
    //     name: "chocolate",
    //     imgUrl: "http://i.kinja-img.com/gawker-media/image/upload/s--Mmpm8jso--/17i2k33n4gfzwpng.png",
    //     calorie: 340

    // }, {
    //     name: "potato chips",
    //     imgUrl: "http://articles.mercola.com/images/newsletter/2005/07/07/potato_chips.jpg",
    //     calorie: 285
    // }];

    // foodList.push(fruits);
    // foodList.push(drinks);
    // foodList.push(food);
    // foodList.push(snacks);


    // var FoodInfo = Parse.object.extend("FoodInfo");

    // for (var i = 0; i < FoodInfo.length; i++) {
    //     for (var j = 0; j < FoodInfo[i].length; j++) {
    //         var foodInfo = new FoodInfo();
    //         foodInfo.set("name", FoodInfo[i][j].name);
    //         foodInfo.set("imgUrl", FoodInfo[i][j].imgUrl);
    //         foodInfo.set("calorie", FoodInfo[i][j].calorie);

    //         foodInfo.save(null, {
    //             success: function(foodInfo) {
    //                 // Execute any logic that should take place after the object is saved.
    //                 alert('New object created with objectId: ' + foodInfo.id);
    //             },
    //             error: function(foodInfo, error) {
    //                 // Execute any logic that should take place if the save fails.
    //                 // error is a Parse.Error with an error code and message.
    //                 alert('Failed to create new object, with error code: ' + error.message);
    //             }
    //         });

    //     }
    // }












// alert("hi");



    $("img").click(function() {
        var item = $(this).context;
        $("#foodLog").append(item);
    });

    $("#calculate").click(function(){
        alert("789 K")
    });
})
