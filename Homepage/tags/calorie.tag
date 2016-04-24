<calorie>
	<div class="title-holder"><h2>CALORIE CALCULATOR <span> (Record your INs and OUTs)</span></h2></div>
	<div class="date-recorder" >
		<input type="date" name="theDate" id="theDate">
	</div>
	<div class="main-board container">
	<!-- Here are search input box -->
		<div class="search-container">
	      <input type="search" name="search" placeholder="Enter name of food / exercise ..." onfocus={} onkeyup={} onblur={} />
	      <span class="icon"><i class="fa fa-search fa-lg"></i></span>
	      <div class="button">Search</div>
	      <ul show={ filtered.length }>
	        <li each={ item,index in filtered }  class="{ active: parent.active==index}"><img src={item.url} alt="" onclick={parent.addToRecordFromSearch}></li>
	    </ul>
	  	</div>

		<div class="row">
			
			<div class="record-panel col-sm-15" each={menuItems}>
				<div class="meal">{meal}</div>
				<div class="food-list">
				
					<div class="food-image" each={todayRecord[meal.toLowerCase()]} datameal={ meal.toLowerCase() } no-reorder>
						
						<img src={fooditem.url} alt={fooditem.name} onclick={parent.removeFromRecord}>
						<div class="count-number">{count}</div>
						<div class="calorie-result">{computeCalorie(fooditem.calorie,count)} Cals</div>
					</div>
					
				</div>

			</div>
			<!-- <div>Today's total calorie is: {totalCalorie()}</div> -->
			<!-- <div class="btn btn-info" onclick={updateToDatabase}>Update</div> -->
		</div>
		<div class="row">
			<div class="compute-calorie col-sm-12">
				<div class="calorie-holder col-sm-15">{breakfastCal || 0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+</div>
				<div class="calorie-holder col-sm-15">{lunchCal || 0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+</div>
				<div class="calorie-holder col-sm-15">{dinnerCal || 0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+</div>
				<div class="calorie-holder col-sm-15">{snackCal || 0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-</div>
				<div class="calorie-holder col-sm-15">{exerciseCal || 0}</div>
				
				
				 <div class="total-come-here">TOTAL = {totalCal}</div>
			</div>
		</div>
	</div>
	



<script>
	var that = this;
	var user = Parse.User.current().toJSON();
	//searched result array
	that.filtered = []
	that.active = -1;
	//seleted menu pointer
	that.currentMenu = "Breakfast";
	


	that.menuItems = [
		{meal:"Breakfast"},
		{meal:"Lunch"},
		{meal:"Dinner"},
		{meal:"Snack"},
		{meal:"Exercise"}]

	that.toggle = function(e){
		//reset all done property
		for(var i = 0;i<that.menuItems.length;i++){
			
			that.menuItems[i].done=false;
		}
		var item = e.item;
		that.currentMenu = item.meal.toLowerCase()
		item.done = !item.done

	}

	function setDateToToday (el) {
      var today = new Date();
      var dd = today.getDate();
      var mm = today.getMonth()+1; //January is 0!
      var yyyy = today.getFullYear();

      if(dd<10) { dd='0'+dd} // format the date 
      if(mm<10) {mm='0'+mm}  // format the month

      today = yyyy + '-' + mm+'-'+dd;
      el.value = today;
    }

    if(that.theDate.value==""){
    	
    	setDateToToday(that.theDate);
    }
    //when search bar focus, query data
    that.queryData = function(e){
    	if(this.meal.toLowerCase()=='exercise'){
    		//query exercise
    		if(!that.exerciseData){

    			that.exerciseData = [];
    			var allExerciseQuery = new Parse.Query('Exercise')
    			allExerciseQuery.find().then(function(result){
    				for(var i=0;i<result.length;i++){
    					that.exerciseData.push(result[i].toJSON())
    				}  				
    			})
    		}
    		
    	}
    	else{
    		//query foods

    		if(!that.foodsData){
    			that.foodsData = []
    			var allFoodsQuery = new Parse.Query('Foods')
    			allFoodsQuery.find().then(function(result){
    				for(var i=0;i<result.length;i++){
    					that.foodsData.push(result[i].toJSON())
    				}
    				
    				
    			})
    		}
    	}
    	
    }

    //search the food after query from database
    that.searchFood = function(e){
    	//if search string less than two, show nothing
    	if(e.target.value.length < 2) {
                that.filtered = []
                that.active = -1
                return
            }
        if(that.currentMenu=='exercise'){
        	that.filtered = that.exerciseData.filter(function(c) {
    	
            	return c['name'].match(RegExp('^'+e.target.value,'i'))
        	})
        }
        else{
        	that.filtered = that.foodsData.filter(function(c) {
    	
            	return c['name'].match(RegExp('^'+e.target.value,'i'))
        	})
        }
    	
    }

    that.clearInput = function(e){
    	e.target.value = ""
    	
    }

    //compute sum of calorie
    that.computeCalorie = function(calorie,count){
    	 return count * Number(calorie)
    	
    }

    that.computeOneMealCalorie = function(mealArr){
    	var sum = 0;
    	for(var i =0;i<mealArr.length;i++){
    		sum = sum + that.computeCalorie(mealArr[i].fooditem.calorie,mealArr[i].count)
    	}
    	return sum
    }

    that.totalCalorie = function(){
    	// var total = 0
    	// for (var key in that.todayRecord){
    	// 	if('breakfast,lunch,dinner,snack,exercise'.indexOf(key)!=-1){
    	// 		total = total+that.computeCalorie(that.todayRecord[key])
    	// 	}
    	// }
    	// return total
    	that.breakfastCal = that.computeOneMealCalorie(that.todayRecord['breakfast'])
    	that.lunchCal = that.computeOneMealCalorie(that.todayRecord['lunch'])
    	that.dinnerCal = that.computeOneMealCalorie(that.todayRecord['dinner'])
    	that.snackCal = that.computeOneMealCalorie(that.todayRecord['snack'])
    	that.exerciseCal = Math.abs(that.computeOneMealCalorie(that.todayRecord['exercise']))
    	that.totalCal = that.breakfastCal + that.lunchCal + that.dinnerCal + that.snackCal - that.exerciseCal
    }

    that.addToRecord = function(e){
    	//add the selected food into todayRecord array
    	
    	that.todayRecord[that.currentMenu].push(e.item);
    	//and at the same time change parse raw data to the same as todayRecord
    	that.RawRecordData.set(that.currentMenu,that.todayRecord[that.currentMenu])

    }

    that.addToRecordFromSearch = function(e){
    	
    	//add to record board and update to database
    	that.todayRecord[that.currentMenu].push(e.item.item);
    	that.RawRecordData.set(that.currentMenu,that.todayRecord[that.currentMenu])
    	//also add to search history if not existing before
    	//that.SearchHistory[that.currentMenu].indexOf(e.item.item)==-1
    	
    	if(!_.findWhere(that.SearchHistory[that.currentMenu],e.item.item)){
    		
    		that.SearchHistory[that.currentMenu].push(e.item.item);
    		that.RawSearchHistory.set(that.currentMenu,that.SearchHistory[that.currentMenu])
    	}
    	that.filtered = []
    	
    	
    }

    that.removeFromRecord = function(e){
    	var meal=this.opts.datameal;
    	that.todayRecord[meal].remove(e.item);
    	that.RawRecordData.set(meal,that.todayRecord[meal])
    }

    that.updateToDatabase = function(e){
    	//update change to the data base
    	that.RawRecordData.save()
    	that.RawSearchHistory.save()

    }

    that.updateTable = function(){
    //create promises array to hold two promises
	    var promises = []

	    //query for FoodsRecord
	    var FoodsRecordQuery = new Parse.Query('FoodsRecord')
	    //two equals query to find the user's input on that date
		promises.push(FoodsRecordQuery.equalTo('email',user.email).
		equalTo('date',that.theDate.value).
		include('breakfast').
		first().
		then(function(result){
			
	    	if(!result){
	    		//create a new fooodsRecord object if there no existing result
	    		var FoodsRecord = Parse.Object.extend("FoodsRecord")
	    		that.todayRecord = new FoodsRecord();
	    		that.todayRecord.save({
	    			date:that.theDate.value,
	    			breakfast:[],
	    			lunch:[],
	    			dinner:[],
	    			snack:[],
	    			exercise:[],
	    			email:user.email
	    		}).then(function(){
	    			that.RawRecordData = that.todayRecord;
	    			that.todayRecord = that.todayRecord.toJSON();

	    		})
	    		
	    		// that.record = result.toJSON();
	    		// console.log(that.record)
	    		
	    		
	    	}
	    	else{
	    		//Save raw parse object into RawRecordData
	    		that.RawRecordData = result;
	    		//and save toJSON() format data into todayRecord
	    		that.todayRecord = result.toJSON();
	    		console.log(that.todayRecord.breakfast[0].count)
	    		
	    		// that.update();
	    		
	    	}
	    }));

	   	var FoodSearchQuery = new Parse.Query('SearchHistory');
	   	promises.push(FoodSearchQuery.equalTo('email',user.email).
	   		include('breakfast').
	   		include('lunch').
	   		include('dinner').
	   		include('snack').
	   		include('exercise').
	   		first().
	   		then(function(result){
	   			if(!result){
	   				var SearchHistory = Parse.Object.extend('SearchHistory')
	   				that.SearchHistory = new SearchHistory();
	   				that.SearchHistory.save({
		    			breakfast:[],
		    			lunch:[],
		    			dinner:[],
		    			snack:[],
		    			exercise:[],
		    			email:user.email
	    			}).then(function(){
	    				//save SearchHistory Parse Object as one variable, easy for update
	    				that.RawSearchHistory = that.SearchHistory;
	    				that.SearchHistory = that.SearchHistory.toJSON() 
	    			})
	   			}
	   			else{
	   				that.RawSearchHistory = result;
	   				that.SearchHistory = result.toJSON();

	   			
	   			}
	   		})
	   	)

	   	Parse.Promise.when(promises).then(function(){
	   		//compute calorie after get the data
	   		that.totalCalorie();
	   		that.update();
	   	})
    }
    
    that.one('updated',function(){
    	//update for the first time

    	that.updateTable();

    	//when date is changed
    	$('#theDate').change(function(){
    		that.updateTable();
    	})

    }) 

    // that.on('updated',function(){
    	
    // })


</script>





<style scoped>
	:scope{
		
		background-color: #f3f3f3;
		height:1000px;
		margin-top: -25px;
		padding-left:50px;
		padding-right:70px;
	}

	.title-holder{
		padding: 55px 0 25px 0;
		text-align: left;
		display: inline-block;
	}

	.title-holder h2{
		font-size:24px;
		font-weight: 600;
		margin: 0 0 0 20px;

	}

	.title-holder span{
		font-size: 16px;
		font-weight: lighter;
	}

	/*Hear is main board*/
	.date-recorder{
		display: inline-block;
		margin: auto auto auto 20px;
		text-align: left;

	}

	.date-recorder input{
		background-color: #f9f9f9;
		border-radius: 5px;
		outline: none;
		border:none;
		width:130px;	

	}

	.main-board{
		width:700px;
		height:800px;
		margin:0;
		padding:0;
		
	}
	/*BLDS board style*/

	.row{
		margin: -3px !important;
	}
	.record-panel{
		padding: 20px 3px 8px 3px;
	}

	.meal{
		background-color: #f6cabe;
		font-size: 20px;
		font-weight: 300;
		text-align: center;
		padding:20px 30px;
	}

	.food-list{
		background-color: #f5d9d0;
		margin-top:7px;
		height:350px;
		padding-top: 13px;


	}

	.highlight{
		background-color: #f7d4d4;
	}
	
	
	.food-image{
		display: block;
		padding: 2px 5px 0px 16px;

	}

	.food-list img{
		width:40px;
	}

	/*~~~~~~~~~~~~~~~~~*/
	/*Here is compute calorie part*/
	.compute-calorie{
		background-color: #e2d2de;
		height:130px;
		font-size: 25px;
		padding: 0;
	}

	.count-number{
		text-align: center;
		background-color: #ef4577;
		color:#fff2f2;
		border-radius: 15px;
		width: 20px;
		position:relative;
		top:-14px;
		left:30px;
		font-weight: 200;
		font-size: 11px;
	}
	
	.calorie-result{
		font-size: 12px;
		font-weight:200;
		position: relative;
		top:-38px;
		left:60px;
	}

	.calorie-holder{
		padding: 40px 50px 20px 50px;
	}

	.total-come-here{
		text-align: right;
		margin-right: 60px;
	}

	/*~~~~~~~~~~~~~~~*/
	/*Here is search board*/
	
	.search-container{
	  width: 700px;
	  vertical-align: middle;
	  white-space: nowrap;
	  position: relative;
	}

	.search-container input{
	  width: 700px;
	  height: 50px;
	  background: white;
	  border: 1px solid #f8c3ae;
	  font-size: 10pt;
	  font-weight: 300;
	  color: #63717f;
	  padding-left: 50px;
	}	
	

	.search-container input#search:focus{
		outline:none;
	}
	
	/*icon style*/
	.search-container .icon{
	  position: absolute;
	  /*top: 20%;*/
	  left:15px;
	  top:10px;
	  margin-left: 0px;
	  margin-top: 3px;
	  z-index: 1;
	  color: #f8c3ae;
	  
	  
	}
	/*button style*/
	.search-container .button{
		background-color: #f79778;
		width:160px;
		height: 48px;
		position: absolute;
		right:1px;
		top:1px;
		color:#fff7ed;
		text-align: center;
		padding-top: 15px;
		font-weight: 100;
		font-size: 18px;
	}

	/*Here are self-defined 1/5 grid system*/

	.col-xs-15,
	.col-sm-15,
	.col-md-15,
	.col-lg-15 {
	    position: relative;
	    min-height: 1px;
	    
	}

	.col-xs-15 {
	    width: 20%;
	    float: left;
	}
	@media (min-width: 768px) {
	.col-sm-15 {
	        width: 20%;
	        float: left;
	    }
	}
	@media (min-width: 992px) {
	    .col-md-15 {
	        width: 20%;
	        float: left;
	    }
	}
	@media (min-width: 1200px) {
	    .col-lg-15 {
	        width: 20%;
	        float: left;
	    }
	}
</style>





</calorie>