function seedFoodToParseDataBase(element) {
    var Foods = Parse.Object.extend("Foods");
    var foods = new Foods();

    foods.save(element, {
        success: function(gameScore) {
            console.log("I am seeding")
        },
        error: function(gameScore, error) {
            console.log("I am not seeding")
        }
    });
}

var foodData = [{
    name: "cheesecake",
    calorie: "250",
    url: "Images/CalorieVectors/Dessert/cheesecake 250Cals.png"
}, {
    name: "cupcake",
    calorie: "140",
    url: "Images/CalorieVectors/Dessert/cupcake 140Cals.png"
}, {
    name: "black tea",
    calorie: "6",
    url: "Images/CalorieVectors/Drink/black tea 6Cals.png"
}, {
    name: "coffee black",
    calorie: "3",
    url: "Images/CalorieVectors/Drink/coffee balck 3Cals.png"
}, {
    name: "apple",
    calorie: "105",
    url: "Images/CalorieVectors/Fruit/apple 105Cals.png"
}, {
    name: "banana",
    calorie: "110",
    url: "Images/CalorieVectors/Fruit/banana 110Cals.png"
}, {
    name: "blueberry",
    calorie: "1",
    url: "Images/CalorieVectors/Fruit/blueberry 1Cal.png"
}, {
    name: "cherry",
    calorie: "5",
    url: "Images/CalorieVectors/Fruit/cherry 5Cals.png"
}, {
    name: "grapefruit",
    calorie: "50",
    url: "Images/CalorieVectors/Fruit/grapefruit 50Cals.png"
}, {
    name: "grape",
    calorie: "2",
    url: "Images/CalorieVectors/Fruit/grapes 2Cals.png"
}, {
    name: "kiwi",
    calorie: "42",
    url: "Images/CalorieVectors/Fruit/kiwi 42Cals.png"
}, {
    name: "mango",
    calorie: "201",
    url: "Images/CalorieVectors/Fruit/mango 201Cals.png"
}, {
    name: "orange",
    calorie: "60",
    url: "Images/CalorieVectors/Fruit/orange 60Cals.png"
}, {
    name: "pear",
    calorie: "102",
    url: "Images/CalorieVectors/Fruit/pear 102Cals.png"
}, {
    name: "pineapple",
    calorie: "452",
    url: "Images/CalorieVectors/Fruit/pineapple 452Cals.png"
}, {
    name: "strawberry",
    calorie: "4",
    url: "Images/CalorieVectors/Fruit/strawberry 4Cals.png"
}, {
    name: "watermelon",
    calorie: "1371",
    url: "Images/CalorieVectors/Fruit/watermelon 1371Cals.png"
}, {
    name: "corn",
    calorie: "59",
    url: "Images/CalorieVectors/Grain/corn 59Cals.png"
}, {
    name: "french bread",
    calorie: "185",
    url: "Images/CalorieVectors/Grain/french bread 185Cals:Slice.png"
}, {
    name: "ramen",
    // per 100g
    calorie: "436",
    url: "Images/CalorieVectors/Grain/ramen 188Cals:43g.png"
}, {
    name: "rice",
    calorie: "130",
    // per 100g
    url: "Images/CalorieVectors/Grain/rice 130Cals:100g.png"
}, {
    name: "spaghetti",
    calorie: "158",
    // per 100g
    url: "Images/CalorieVectors/Grain/spaghetti 158Cals:100g.png"
}, {
    name: "wheat bread",
    calorie: "75",
    url: "Images/CalorieVectors/Grain/wheat bread 75Cals:slice.png"
}, {
    name: "white bread",
    calorie: "79",
    url: "Images/CalorieVectors/Grain/white bread 79Cals:slilce.png"
}, {
    name: "bacon",
    calorie: "43",
    url: "Images/CalorieVectors/Meat/bacon 43Cals:slice.png"
}, {
    name: "egg",
    calorie: "80",
    url: "Images/CalorieVectors/Meat/egg 80Cals.png"
}, {
    name: "lamp",
    calorie: "294",
    // per 100g
    url: "Images/CalorieVectors/Meat/lamp 294Cals:100g.png"
}, {
    name: "salmon",
    calorie: "208",
    url: "Images/CalorieVectors/Meat/salmon 208:100g.png"
}, {
    name: "sausage",
    calorie: "300",
    // per 100g
    url: "Images/CalorieVectors/Meat/sausage 300Cals:100gram.png"
}, {
    name: "steak",
    calorie: "194",
    // per 100g 
    url: "Images/CalorieVectors/Meat/steak 194Cals:100gram.png"
}, {
    name: "broccoli",
    calorie: "34",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/broccoli 34Cals:100g.png"
}, {
    name: "carrot",
    calorie: "41",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/carrot 41Cals:100g.png"
}, {
    name: "cucumber",
    calorie: "16",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/cucumber 16Cals:100g.png"
}, {
    name: "eggplant",
    calorie: "25",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/eggplant 25Cals:100g.png"
}, {
    name: "mushroom",
    calorie: "22",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/mushroom 22Cals:100g.png"
}, {
    name: "peas",
    calorie: "81",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/peas 81Cals:100g.png"
}, {
    name: "pepper",
    calorie: "20",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/pepper 20Cal:100g.png"
}, {
    name: "potato",
    calorie: "77",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/potato 77Cals:100g.png"
}, {
    name: "tomato",
    calorie: "18",
    // per 100g 
    url: "Images/CalorieVectors/Veggie/tomato 18Cals:100g.png"
}]


var exerciseData = [{
    name: "badminton",
    calorie: "-204",
    url: "Images/CalorieVectors/Exercise/badminton 204.png"
}, {
    name: "baseball",
    calorie: "-165",
    url: "Images/CalorieVectors/Exercise/baseball 165.png"
}, {
    name: "basketball",
    calorie: "-170",
    url: "Images/CalorieVectors/Exercise/basketball 170.png"
}, {
    name: "bicycling",
    calorie: "-85",
    url: "Images/CalorieVectors/Exercise/bicycling 85.png"
}, {
    name: "football",
    calorie: "-220",
    url: "Images/CalorieVectors/Exercise/football 220.png"
}, {
    name: "jumping jacks",
    calorie: "-135",
    url: "Images/CalorieVectors/Exercise/jumping jacks 135.png"
}, {
    name: "jumping rope",
    calorie: "-330",
    url: "Images/CalorieVectors/Exercise/jumping rope 330.png"
}, {
    name: "lunges",
    calorie: "-250",
    url: "Images/CalorieVectors/Exercise/lunges 250.png"
}, {
    name: "planks",
    calorie: "-110",
    url: "Images/CalorieVectors/Exercise/planks 110.png"
}, {
    name: "pushups",
    calorie: "-150",
    url: "Images/CalorieVectors/Exercise/pushups 150.png"
}, {
    name: "running",
    calorie: "-270",
    url: "Images/CalorieVectors/Exercise/running 270.png"
}, {
    name: "situp",
    calorie: "-180",
    url: "Images/CalorieVectors/Exercise/situp 180.png"
}, {
    name: "squats",
    calorie: "-345",
    url: "Images/CalorieVectors/Exercise/squats 345.png"
}, {
    name: "swimming",
    calorie: "-295",
    url: "Images/CalorieVectors/Exercise/swimming 295.png"
}, {
    name: "tennis",
    calorie: "-204",
    url: "Images/CalorieVectors/Exercise/tennis 204.png"
}, {
    name: "walking",
    calorie: "100",
    url: "Images/CalorieVectors/Exercise/walking 100.png"
}, {
    name: "yoga",
    calorie: "-200",
    url: "Images/CalorieVectors/Exercise/yoga 200.png"
}, {
    name: "zumba",
    calorie: "-270",
    url: "Images/CalorieVectors/Exercise/zumba 270.png"
}]

foodData.forEach(seedFoodToParseDataBase);
