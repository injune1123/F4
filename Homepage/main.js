
//-------------------------------------------//

riot.route('/calorieCal',function(){
    var query = new Parse.Query('Foods');
    query.equalTo('recommend',true);
    query.find().then(function(result){
    riot.mount('#Mount','calorie',{recom:result});

    })
    
})



riot.route('/dashboard',function(){
    riot.mount('#Mount','dashboard');
})

riot.route('/personal',function(){
    var query = new Parse.Query('Info');
    query.equalTo('email',Parse.User.current().get('username'));
    query.first().then(function(result){
        // var data = result.toJSON();
        riot.mount('#Mount','personal',{info:result})
    })
    
})

// riot.route('/logsign',function(){
    
//     riot.mount('#Login','logsign')
// })

riot.route('/register',function(){
    riot.mount('#Mount','register')
})

riot.route(function(){
    riot.mount('#Mount','homepage');
})


riot.route.start(true)


