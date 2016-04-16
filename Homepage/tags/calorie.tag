<calorie>
	<div class="date-recorder" >
		<input type="date" name="theDate" id="theDate">
	</div>
	<div class="main-board container">

		<div class="row">
			<div class="col-sm-5 meal-nav">
				<div each={menuItems}>
					<div class={highlight:done} onclick={parent.toggle}>{title}</div>
					<div class="search-board" if={done}>
						<div class="container-1">
					      <input type="search" id="search" placeholder="Search..." />
					      <span class="icon" onclick={searchFood}><i class="fa fa-search"></i></span>
					  	</div>

					  	<div class="food-image" each={SearchHistory[title.toLowerCase()]}>
							<img src={url} alt={name} onclick={parent.addToRecord}>
						</div>
					</div>
				</div>
			</div>
			<div class="record-panel col-sm-7" each={menuItems}>
				<div class="meal">{title}</div>
				<div class="food-list">
					<div class="food-image" each={todayRecord[title.toLowerCase()]}>
						
						<img src={url} alt={name} onclick={parent.removeFromRecord}>
					</div>
					<div class="calorie-result">
					{computeCalorie(todayRecord[title.toLowerCase()])}
					</div>
				</div>

			</div>
			<div class="btn btn-info" onclick={updateToDatabase}>Update</div>
		</div>
	</div>
	



<script>
	var that = this;
	var user = Parse.User.current().toJSON();
	that.currentMenu


	that.menuItems = [
		{title:"Breakfast",done:false},
		{title:"Lunch",done:false},
		{title:"Dinner",done:false},
		{title:"Snack",done:false},
		{title:"Exercise",done:false}]

	that.toggle = function(e){
		//reset all done property
		for(var i = 0;i<that.menuItems.length;i++){
			
			that.menuItems[i].done=false;
		}
		var item = e.item;
		that.currentMenu = item.title.toLowerCase()
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
    

    //compute sum of calorie
    that.computeCalorie = function(foodsArr){
    	var sum = 0;
    	for(var i=0;i<foodsArr.length;i++){
    		sum = sum + Number(foodsArr[i].calorie)
    	}
    	return sum
    }

    that.addToRecord = function(e){
    	//add the selected food into todayRecord array
    	that.todayRecord[that.currentMenu].push(e.item);
    	//and at the same time change parse raw data to the same as todayRecord
    	that.RawRecordData.set(that.currentMenu,that.todayRecord[that.currentMenu])

    }

    that.removeFromRecord = function(e,title){
    	// console.log(e)
    	// console.log(title)
    	// that.todayRecord[title.toLowerCase()].remove(e.item);
    }

    that.updateToDatabase = function(e){
    	//update change to the data base
    	that.RawRecordData.save()


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
		    			date:that.theDate.value,
		    			breakfast:[],
		    			lunch:[],
		    			dinner:[],
		    			snack:[],
		    			exercise:[],
		    			email:user.email
	    			})
	   			}
	   			else{
	   				that.SearchHistory = result.toJSON();

	   			
	   			}
	   		})
	   	)

	   	Parse.Promise.when(promises).then(function(){
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

	
    



</script>





<style scoped>
	:scope{
		text-align: center;
	}

	/*Hear is main board*/
	.date-recorder{
		margin: 20px auto auto 70px;
		text-align: left;

	}

	.main-board{
		width:500px;
		height:400px;
		border:grey solid 1px;
		margin-left: 70px;
	}

	.meal-nav{
		height:100%;
	}
	
	.meal-nav img{
		width:30px;
	}

	.highlight{
		background-color: #f7d4d4;
	}

	.food-image{
		display: inline-block;
	}
	
	.food-list img{
		width:30px;
	}

	/*~~~~~~~~~~~~~~~*/
	/*Here is search board*/
	.search-board{
		border:grey solid 1px;
		width:300px;
		height:350px;
		position: absolute;
		left:498px;
		top:20px;
	}
	.container-1{
	  width: 300px;
	  vertical-align: middle;
	  white-space: nowrap;
	  position: relative;
	}

	.container-1 input#search{
	  width: 150px;
	  height: 25px;
	  background: #e7e7e7;
	  border: none;
	  font-size: 10pt;
	  
	  color: #63717f;
	  padding-left: 10px;
	  -webkit-border-radius: 5px;
	  -moz-border-radius: 5px;
	  border-radius: 5px;
	}	
	
	.container-1 input#search:focus{
		outline:none;
	}

	.container-1 .icon{
	  position: absolute;
	  /*top: 20%;*/
	  margin-left: -20px;
	  margin-top: 3px;
	  z-index: 1;
	  color: #4f5b66;
	  cursor: pointer;
	}


</style>





</calorie>