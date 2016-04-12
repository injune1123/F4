<calorie>
	<div class="date-recorder">
		<input type="date" name="theDate">
	</div>
	<div class="main-board container">

		<div class="row">
			<div class="col-sm-5">
				<div class="meal-nav" each={menuItems}>
					<div class={highlight:done} onclick={parent.toggle}>{title}</div>
				</div>
			</div>
			<div class="record-panel col-sm-7">
				world
			</div>
		</div>
	</div>


<script>
	var that = this;
	
	that.menuItems = [
		{title:"Breakfast",done:false},
		{title:"Lunch",done:false},
		{title:"Dinner",done:false},
		{title:"Snack",done:false},
		{title:"Excercise",done:false}]

	that.toggle = function(e){
		//reset all done property
		for(var i = 0;i<that.menuItems.length;i++){
			
			that.menuItems[i].done=false;
		}
		var item = e.item;
		item.done = !item.done
	}

	console.log(that.theDate.value)

	// that.result = 0;
	// //don't show search result now
	// that.searched = false;
	// //don't show error message
	// that.hasError = false;
	// that.recommend = that.opts.recom;
	// //declare result variable, holder for 
	// that.chosenFoods = chosen.foodArr;
	// //query for search history
	// var queryForHistory = new Parse.Query('SearchHistory');
	// queryForHistory.find().then(function(result){
	// 	that.historyItem = result;
	// 	that.update();
	// })

	// //compute calorie
 //    that.compute = function(e){
    	
 //    	for(i=0;i<that.chosenFoods.length;i++){
 //    		that.result=that.result+Number(that.chosenFoods[i].calorie);
 //    	}
 //    }	
 //    //remove foods from list
 //    that.removeFood = function(e){
 //    	that.chosenFoods.remove(e.item.cho);
 //    }
 //    //search for user-input food
 //    that.searchFood = function(e){
	//    	//don't show search result now
	// 	that.searched = false;
	// 	//don't show error message
	// 	that.hasError = false;
 //    	var query = new Parse.Query('Foods');
    	
 //    	query.contains('name',that.search.value);
 //    	query.find().then(function(result){
 //    		if(result.length>0){
 //    			that.searched = true;
 //    			that.foundFood = result[0];
    			
 //    			that.update();
 //    		}
 //    		else{
 //    			that.hasError = true;
 //    			that.errorMessage = "Not found in database."
 //    			that.update();
 //    		}
 //    	})

 //    }

 //    //add searched food to chosen observable
 //    that.addToChosen = function(e){
    	
 //    	chosen.foodArr.push(that.foundFood.toJSON());
 //    	// that.update();

    	
 //    }


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
	
	.highlight{
		background-color: #f7d4d4;
	}

	
	.beSelected {
		display: inline-block;
	}

	.beSelected img{
		width:50px;
		height:50px;
		margin:5px;
	}

	.computeResult {
		margin:40px;
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

	.searchResult img{
		width:100px;
		height:100px;
	}
	

</style>





</calorie>