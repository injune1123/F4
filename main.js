
//-------------------------------------------//




riot.route('/dashboard',function(){
    riot.mount('#Mount','dashboard');
})

riot.route('/homepage',function(){
    riot.mount('#Mount','homepage');
})

riot.route('/initialinfo',function(){
	riot.mount('#Mount','initialinfo');
});

riot.route(function(){
    // if(!Parse.User.current()){
    //     riot.mount('#Mount','homepage');
    // }
    // else{
    //     window.location.href = '/#dashboard';
    // }
    riot.mount('#Mount','homepage');
})


riot.route.start(true)


