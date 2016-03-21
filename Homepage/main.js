//-------------------------------------------//

riot.route('/calorieCal',function(){
    var query = new Parse.Query('Foods');
    query.equalTo('recommend',true);
    query.find().then(function(result){
    riot.mount('#toMount','calorie',{recom:result});

    })
    
})

riot.route('/prediction',function(){
    riot.mount('#toMount','dashboard');
})

riot.route('/logsign',function(){
    riot.mount('#toMount','logsign')
})

riot.route(function(){
    riot.mount('#toMount','homepage');
})

riot.route.start(true)


