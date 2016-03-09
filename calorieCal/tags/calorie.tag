<calorie>

	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<h3>Recommended Recipe</h3>
					<singleFood each = {fo in recommend}>
					</singleFood>
			</div>

			<!-- this is  -->
			<div class="col-sm-4">
				<h3>Search Your Food</h3>
				<!-- this code taken from http://webdesign.tutsplus.com/tutorials/css-experiments-with-a-search-form-input-and-button--cms-2206 example including css-->

				<div class="box">
				  <div class="container-1">
				      <input type="search" id="search" placeholder="Search..." />
				      <span class="icon" onclick={searchFood}><i class="fa fa-search"></i></span>
				  </div>
				</div>
				
				<!-- show search result -->
				<div class="searchResult" if={searched}>
					<img src={foundFood.toJSON().url}>
					<div class="btn btn-info" onclick = {addToChosen}>Add</div>
				</div>
				<!-- show search error message -->
				<div class="error" if={hasError}><p>{errorMessage}</p></div>
				<!-- will display search history -->
				<div class="searchHistory">
					<ul>
						<li each={hi in historyItem}>{hi.toJSON().name}<i class="fa fa-check"></i></li>
					</ul>
				</div>


			</div>
			<!-- this is food calculator column -->
			<div class="col-sm-4">
				<h3>Calculate Here!</h3>
				<div class="beSelected" each={cho in chosenFoods}>
					<img src={cho.url} onclick={removeFood}> 
				</div>
				<div class="computeResult">You have eaten: {result} calorie of food.</div>
				<div class="btn btn-info computeBtn" onclick={compute}>Calculate!</div>
			</div>
		</div>
	</div>


<script>
	var that = this;
	that.result = 0;
	//don't show search result now
	that.searched = false;
	//don't show error message
	that.hasError = false;
	that.recommend = that.opts.recom;
	//declare result variable, holder for 
	that.chosenFoods = chosen.foodArr;
	//query for search history
	var queryForHistory = new Parse.Query('SearchHistory');
	queryForHistory.find().then(function(result){
		that.historyItem = result;
		that.update();
	})

	//compute calorie
    that.compute = function(e){
    	
    	for(i=0;i<that.chosenFoods.length;i++){
    		that.result=that.result+Number(that.chosenFoods[i].calorie);
    	}
    }	
    //remove foods from list
    that.removeFood = function(e){
    	that.chosenFoods.remove(e.item.cho);
    }
    //search for user-input food
    that.searchFood = function(e){
	   	//don't show search result now
		that.searched = false;
		//don't show error message
		that.hasError = false;
    	var query = new Parse.Query('Foods');
    	
    	query.contains('name',that.search.value);
    	query.find().then(function(result){
    		if(result.length>0){
    			that.searched = true;
    			that.foundFood = result[0];
    			
    			that.update();
    		}
    		else{
    			that.hasError = true;
    			that.errorMessage = "Not found in database."
    			that.update();
    		}
    	})

    }

    //add searched food to chosen observable
    that.addToChosen = function(e){
    	
    	chosen.foodArr.push(that.foundFood.toJSON());
    	// that.update();

    	
    }


</script>





<style scoped>
	:scope{
		text-align: center;
	}
	.container{
		margin-top: 70px;
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