<calorie>
	<div class="date-recorder">
		<input type="date" name="theDate" id="theDate">
	</div>
	<div class="main-board container">

		<div class="row">
			<div class="col-sm-5 meal-nav">
				<div each={menuItems}>
					<div class={highlight:done} onclick={parent.toggle}>{title}</div>
				</div>
			</div>
			<div class="record-panel col-sm-7" each={menuItems}>
				<div class="meal">{title}</div>
				<div class="food-list">
					<div class="food-image" each={todayRecord[title.toLowerCase()]}>
						<img src={url} alt={name}>
					</div>
				</div>

			</div>
		</div>
	</div>



<script>
	var that = this;
	var user = Parse.User.current().toJSON();

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

    //query for FoodsRecord
    var FoodsRecordQuery = new Parse.Query('FoodsRecord')
    //two equals query to find the user's input on that date
    
    FoodsRecordQuery.equalTo('email',user.email).
    	equalTo('date',that.theDate.value).
    	include('breakfast').
    	first().
    	then(function(result){
    		
    	if(!result){
    		//create a new fooodsRecord object if there no existing result
    		var FoodsRecord = Parse.Object.extend("FoodsRecord")
    		var todayRecord = new FoodsRecord();

    		// that.record = result.toJSON();
    		// console.log(that.record)
    	}
    	else{
    		that.todayRecord = result.toJSON();
    		console.log(that.todayRecord)
    		that.update();
    		
    	}
    });
   
    



</script>





<style scoped>
	:scope{
		text-align: center;
	}
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
	
	.highlight{
		background-color: #f7d4d4;
	}

	.food-image{
		display: inline-block;
	}
	
	.food-list img{
		width:30px;
	}
	


</style>





</calorie>