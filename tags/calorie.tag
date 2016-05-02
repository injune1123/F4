<calorie>
	<div class="title-holder"><h2>CALORIE CALCULATOR</h2></div>
	<div class="date-recorder" >
		<input type="date" name="theDate" id="theDate"> 
	</div>
	<div class="main-board container">
	<!-- Here are search input box -->
		<div class="search-container {currentMenu=='Exercise' ? 'exercise-style' : ''}">
	      <input type="search" name="search" placeholder="Enter name of food / exercise ..." onfocus={showHistory} onkeyup={searchFood} onblur={} />
	      <span class="icon"><i class="fa fa-search fa-lg"></i></span>
	      <div class="button">{currentMenu=='Exercise' ? 'Search Exercise' : 'Search Food'}</div>
	      <ul show={ filtered.length }>
	        <li each={ item,index in filtered }  class="{}"><img src={item.url} alt="">
			<div class="li-content">{item.name.capitalize()},<span>{item.calorie} cals each.</span></div>
			<div class="add-button" onclick={addToRecord}>+</div>
	        </li>
	    </ul>
	  	</div>
		
	  	<div class="row">
	  		<div class="calorie-in col-sm-45">
	  		Calorie In
	  		</div>
	  		<div class="calorie-out col-sm-15">
	  		Calorie Out
	  		</div>
	  	</div>

		<div class="row">
			
			<div class="record-panel col-sm-15 " each={menuItems} onclick={toggle}>
				<div class="meal {highlighted-top:meal==currentMenu} {highlighted-top-e:meal==currentMenu && currentMenu=='Exercise'}" id="{ex-style-top:meal=='Exercise'}">{meal}</div>
				<div class="food-list {highlighted-bottom:meal==currentMenu} {highlighted-top-e:meal==currentMenu && currentMenu=='Exercise'}" id="{ex-style-bottom:meal=='Exercise'}" >
				
					<div class="food-image" each={todayRecord[meal.toLowerCase()]} no-reorder>
						<div class="add-button " onclick={parent.increaseCount}>+</div>
						<div class="minus-button {name}" onclick={parent.decreaseCount}>-</div>
						<img src={fooditem.url} alt={fooditem.name} >
						<div class="count-number" >{count}</div>
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
				
				
				 <div class="total-come-here">TOTAL&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;&nbsp;&nbsp;&nbsp; <span>{totalCal}</span></div>
				 <div class="button" onclick={updateToDatabase}>UPDATE</div>
				 
			</div>
		</div>
		<div if={updated} class="update-success">*your records have been updated.</div>
	</div>

	<div class="notification"><img src={dietTip.url} alt=""></div>
	



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
		
		if(e.item.meal!=that.currentMenu){
			that.currentMenu = e.item.meal;
			that.filtered = that.SearchHistory[that.currentMenu.toLowerCase()]

		}
	}

	// grab tips from database and select one random. only run once at mounting.
	function grabTips(){
		var tipQuery = new Parse.Query('Tips')
		tipQuery.find().then(function(result){
			
			var chosenIndex = Math.floor((Math.random() * 4));
			that.dietTip = result[chosenIndex].toJSON();
		})
	}

	grabTips();

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
    that.queryData = function(){
    	var promise = new Parse.Promise()
    	if(this.currentMenu=='Exercise'){
    		//query exercise

    		if(!that.exerciseData){

    			that.exerciseData = [];
    			var allExerciseQuery = new Parse.Query('Exercise')
    			return allExerciseQuery.find().then(function(result){
		    				for(var i=0;i<result.length;i++){
		    					that.exerciseData.push(result[i].toJSON())
		    				}  				
    					})
    		}
    		else{
    			promise.resolve();
    			return promise
    		}

    		
    	}
    	else{
    		//query foods

    		if(!that.foodsData){
    			that.foodsData = []
    			var allFoodsQuery = new Parse.Query('Foods')
    			return allFoodsQuery.find().then(function(result){
		    				for(var i=0;i<result.length;i++){
		    					that.foodsData.push(result[i].toJSON())
		    				}		    				
		    			})
    		}
    		else{
    			promise.resolve();
    			return promise
    		}
    	}
    	
    }

    that.showHistory = function(e){

    	that.queryData().then(function(){
    		that.filtered = that.SearchHistory[that.currentMenu.toLowerCase()]
    		that.update();
    	})
    }

    //search the food after query from database
    that.searchFood = function(e){
    	//if search string less than two, show nothing
    	if(e.target.value.length < 2) {
                that.filtered = []
                that.active = -1
                return
            }
        if(that.currentMenu=='Exercise'){
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
    	if(!that.todayRecord){
    		return
    	}
    	else if(!that.todayRecord['breakfast']){
    		return
    	}
  
    	that.breakfastCal = that.computeOneMealCalorie(that.todayRecord['breakfast'])
    	that.lunchCal = that.computeOneMealCalorie(that.todayRecord['lunch'])
    	that.dinnerCal = that.computeOneMealCalorie(that.todayRecord['dinner'])
    	that.snackCal = that.computeOneMealCalorie(that.todayRecord['snack'])
    	that.exerciseCal = Math.abs(that.computeOneMealCalorie(that.todayRecord['exercise']))
    	that.totalCal = that.breakfastCal + that.lunchCal + that.dinnerCal + that.snackCal - that.exerciseCal
    }

    that.addToRecord = function(e){
    	//since new food added, set updated to false.
    	that.updated = false;
    	var ind = that.currentMenu.toLowerCase();
    	//add the selected food into todayRecord array
    	var finded = false;
    	//locate food in the array
    	for(var i=0;i < that.todayRecord[ind].length;i++ ){
    		
    		if(_.isEqual(that.todayRecord[ind][i].fooditem,e.item.item)){
    			
    			that.todayRecord[ind][i].count++;
    			finded = true;
    			break;
    		}


    	}
    	//if not finded one, add new icon instead
    	if(!finded){
    		var newFood = {fooditem:e.item.item,count:1}
    		that.todayRecord[ind].push(newFood)
    	}

    	that.RawRecordData.set(ind,that.todayRecord[ind])

    	// and at the same time change parse raw data to the same as todayRecord


    	//then check if the search result appear in food search history
    	if(!_.findWhere(that.SearchHistory[ind],e.item.item)){
    		
    		that.SearchHistory[ind].push(e.item.item);
    		
    		that.RawSearchHistory.set(ind,that.SearchHistory[ind])
    	}

    }

    that.increaseCount = function(e){
    	
    	var ind = that.currentMenu.toLowerCase();
    	for(var i=0;i < that.todayRecord[ind].length;i++ ){
    		
    		if(_.isEqual(that.todayRecord[ind][i].fooditem,this.fooditem)){  			
    			that.todayRecord[ind][i].count++;
    			break;
    		}
    	}
    	that.RawRecordData.set(ind,that.todayRecord[ind]);

    }

    that.decreaseCount = function(e){
    	var ind = that.currentMenu.toLowerCase();
    	for(var i=0;i < that.todayRecord[ind].length;i++ ){
    		
    		if(_.isEqual(that.todayRecord[ind][i].fooditem,this.fooditem)){
    			if(that.todayRecord[ind][i].count>0){
    				that.todayRecord[ind][i].count--;
    			}
    			else{
    				that.todayRecord[ind].remove(that.todayRecord[ind][i])
    			}  			
    			break;
    		}
    	}
    	that.RawRecordData.set(ind,that.todayRecord[ind]);
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
    	that.updated = true;

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

    that.on('update',function(){

    	that.totalCalorie();

    })

    String.prototype.capitalize = function() {
    	return this.charAt(0).toUpperCase() + this.slice(1);
	}


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
		background-color: #f3f3f3;
		
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
		cursor: pointer;
		
	}

	.record-panel .highlighted-top{
		background-color: #f6b5a6;
		box-shadow: 3px 3px 6px #CFA498;
		
	}

	.record-panel .highlighted-bottom{
		background-color: #f4c8bd;
		box-shadow: 3px 3px 6px #CFA498;

	}

	.record-panel .highlighted-top-e{
		box-shadow: 3px 3px 6px #7D9E85;
	}

	#ex-style-top{
		background-color: #bad5c9;
	}

	#ex-style-bottom{
		background-color: #98c4b1;
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
	
	.food-image{
		display: block;
		padding: 2px 5px 0px 16px;
		margin-top: 5px;

	}
	
	.food-image .add-button{
		display: inline-block;
		position: relative;
		left:60px;
		top:7px;
		font-size: 12px;
		font-weight: 100;
		color:grey;
		text-shadow: 1px 1px #D3AFAF;
		cursor:pointer;


	}

	.food-image .minus-button{
		display: inline;
		position: relative;
		left:-3px;
		top:8px;
		font-size: 18px;
		font-weight: 100;
		color:grey;
		text-shadow: 1px 1px #D3AFAF;
		cursor:pointer;
	}

	.food-list img{
		width:35px;
	}

	/*~~~~~~~~~~~~~~~~~*/
	/*Here is compute calorie part*/
	.compute-calorie{
		background-color: #e2d2de;
		height:180px;
		font-size: 25px;
		padding: 0;
	}

	.count-number{
		text-align: center;
		background-color: #ef4577;
		color:#fff2f2;
		border-radius: 15px;
		position:relative;
		top:12px;
		left:-18px;
		font-weight: 100;
		font-size: 8px;
		padding:2px 5px;
		display:inline;
	}
	
	.calorie-result{
		font-size: 8px;
		font-weight:200;
		position: relative;
		top:7px;
		
		display:inline;
	}

	.calorie-holder{
		padding: 40px 50px 20px 50px;
		font-size: 20px;
		font-weight: 300;

	}

	.total-come-here{
		text-align: right;
		margin-right: 60px;	
		font-weight: 300;
		font-size: 23px;
	}

	.total-come-here span{
		font-size:25px;
		font-weight: 400;
	}
	
	/*update button style*/
	.compute-calorie .button{
		position: relative;
		color:white;
		display: inline;
		background-color: #d7bace;
		font-size: 18px;
		font-weight: 300;
		padding: 15px 26px;
		left:555px;
		top:28px;
		cursor: pointer;
	}

	.compute-calorie .button:hover{
		background-color: #BFA3B6;

	}

	.compute-calorie .button:active{
		box-shadow: 3px 3px 3px grey;
	}
	
	.update-success{
		float: right;
		color:#7E0505;
	}
	/*~~~~~~~~~~~~~~~*/
	/*Here is search board*/
	
	.search-container{
	  width: 700px;
	  vertical-align: middle;
	  white-space: nowrap;
	  position: relative;
	  margin-bottom: 20px;
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

	
	.exercise-style input{
	  width: 700px;
	  height: 50px;
	  background: white;
	  border: 1px solid #5fc6c7;
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

	.exercise-style .icon{
	  position: absolute;
	  /*top: 20%;*/
	  left:15px;
	  top:10px;
	  margin-left: 0px;
	  margin-top: 3px;
	  z-index: 1;
	  color: #5fc6c7;
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
		font-size: 15px;
	}

	.exercise-style .button{
		background-color: #69b196;
		width:160px;
		height: 48px;
		position: absolute;
		right:1px;
		top:1px;
		color:#fff7ed;
		text-align: center;
		padding-top: 15px;
		font-weight: 100;
		font-size: 15px;
	}
	.search-container .buttonF:focus{
		outline:none;
	}

	
	/*dropdown list style*/
	.search-container ul{
		border: 1px solid #f8c3ae;
		list-style-type: none;
		padding-left: 60px;
		background-color: white;
	}

	.exercise-style ul{
		border: 1px solid #5fc6c7;
		list-style-type: none;
		padding-left: 60px;
		background-color: white;
	}

	.search-container li{
		border-top: 1px solid #f8c3ae;
	}

	.exercise-style li{
		border-top: 1px solid #5fc6c7;
	}

	.search-container .add-button{
		display:none;
		font-size: 24px;
		font-weight: 500;
		background-color: #f9e4d9;
		color:grey;
		padding:0px 5px;
		position:relative;
		right: 430px;
		float:right;
		top:13px;
		cursor: pointer;
		text-shadow: 1px 1px #D3AFAF;
	}

	.exercise-style .add-button{
		display:none;
		font-size: 24px;
		font-weight: 500;
		background-color: #B8E8E8;
		color:grey;
		padding:0px 5px;
		position:relative;
		right: 430px;
		float:right;
		top:13px;
		cursor: pointer;
		text-shadow: 1px 1px #D3AFAF;
	}	
	
	.search-container li:hover{
		background-color: #f9e4d9;
		cursor: pointer;
	}
	
	.exercise-style li:hover{
		background-color: #B8E8E8;
		cursor: pointer;
	}
	
	.search-container li:hover .add-button{
		display:inline-block;
		cursor: pointer;
	}

	.search-container .li-content{
		display: inline;
		font-size: 18px;
		top:10px;
		margin-left:17px;
		position:relative;
		top:7px;

	}

	.search-container span{
		font-size:16px;
		color:grey;
		font-weight: 300;
	}

	.search-container ul img{
		width:38px;
		margin:5px 0px 3px -50px;
		 
	}
	/*Here comes notification*/
	.notification{
		/*background-image: url('Images/dialog.png');*/
		height:100%;
		
		display: inline-block;
		position: fixed;
		top:250px;
		left:1000px;
		padding:40px 10px 40px 30px;
		margin-right: 60px;
	}

	.notification img{
		width: 200px;
	}

	.calorie-in{
		font-size: 20px;
		text-align: center;

	}

	.calorie-out{
		font-size: 20px;
		text-align: center;
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
	.col-xs-45 {
	    width: 80%;
	    float: left;
	}
	@media (min-width: 768px) {
	.col-sm-45 {
	        width: 80%;
	        float: left;
	    }
	}

</style>





</calorie>