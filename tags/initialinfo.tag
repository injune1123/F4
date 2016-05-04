<initialinfo>
	<h2>Welcome to our site!</h2> 

	<p>Before we can help you, we need some more information. 
	Please tell us more about you to let us assist you better.</p>


	<form>
	<div id="errorMessage" if={errorMessage}>
		{errorMessage}
	</div>
	<div class="row">
	<div class="col-sm-6">
	<label for="heightFeetInch" style="display:block">height (feet.inch)</label>
	</div>
	<div class="col-sm-6">
	<input type="number" name="heightFeet" placeholder="5.3" class="form-control" onChange={heightFeetInputed}/>
	</div>
	</div>

	<div class="row">
	<div class="col-sm-6">
	<label for="heightFeetInch" style="display:block">height (m)</label>
	</div>
	<div class="col-sm-6">
	<input type="number" name="heightMeter" placeholder="1.75" class="form-control" onChange={heightMInputed}/>
	</div>
	</div>

	<div class="row">
	<div class="col-sm-6">
	<label for="Age" style="display:block">Age</label>
	</div>
	<div class="col-sm-6">
	<input type="text" name="age" placeholder="Age" class="form-control"/>
	</div>
	</div>

	<div class="row">
	<div class="col-sm-6">
	<label for="Gender" style="display:block">Gender</label>
	</div>
	<div class="col-sm-6">
	<select class="form-control">
		<option value="female">Female</option>
		<option value="male">Male</option>
		<option value="other">Other</option>
	</select>
	</div>
	</div>


	<div class="row">
	<div class="col-sm-6">	
	<label for="Current Weight" style="display:block">Current Weight</label>
	</div>
	<div class="col-sm-6">
	<input type="text" name="currentWeight" placeholder="Current Weight" class="form-control"/>
	</div>
	</div>


	<div class="row">
	<div class="col-sm-6">	
	<label for="ObjectiveWeight" style="display:block">Objective Weight</label>
	</div>
	<div class="col-sm-6">
	<input type="text" name="objective" placeholder="Objective Weight" class="form-control"/>
	</div>
	</div>

	<div class="row">
	<div class="col-sm-6">	
	<label for="Period" style="display:block">Date to be Fit</label>	
	</div>
	<div class="col-sm-6">
	<input type="date" name="dateToBeFit" class="form-control">
	<br/>

	</div>
	</div>

	<div class="row">
	<div class="col-sm-6">
	</div>
	<div class="col-sm-6">
	<input type="button" name="next" class="next action-button btn btn-info" value="Finish" id="setgoal" onClick={cilckHandler}/>
	</div>
	</div>
	</form>

	<script>
		var that = this;
		that.errorMessage = "";

		var currentUser = Parse.User.current();

		that.heightFeetInputed = function(){
				var heightInFeet = that.heightFeet.value;
				var inch = heightInFeet % 1
				var foot = Math.floor(heightInFeet)
				that.heightMeter.value = inch * 0.0254 * 10  + foot * 0.3048;
				// 1 inch = 0.0254 meter
				//1 foot = 0.3048 meter
		}


		that.heightMInputed = function(){
				var heightInMeter = that.heightMeter.value;
				var foot = Math.floor(heightInMeter * 3.28084) 
				var inch = Math.ceil(heightInMeter * 3.28084 % 1 * 12)
				that.heightFeet.value = foot + 0.1 * inch;
				// 1 meter = 0.0254 foot
				//1 foot = 12 inch
		}


		that.cilckHandler = function (){
			if (!that.currentWeight.value || !that.dateToBeFit.value || !that.objective.value){
				that.errorMessage = "* Make sure you put in current weight, ideal weight, and date to be fit"
				return;
			}
	
			currentUser.set('initialWeight',
							{
								date: new Date(),
								weight:that.currentWeight.value,	
							});

				currentUser.set('infos',
							{	
								age:that.age.value,
								heightInMeter:that.heightMeter.value,	
								sex:$('select option:selected').val()
				});

				currentUser.set('Goal',{date: that.dateToBeFit.value, weight: that.objective.value})

				console.log(currentUser)
				//redirect to dashboard
				currentUser.save().then(function(){
					window.location.href = '/#dashboard';
					that.unmount();
				});

		}
		

	</script>


	<style scoped>
	    :scope{
	    	display: block;
			background-color: #f3f3f3;
			padding-left:150px; 
			padding-right: 150px;
			height: 140vh;
	    }
	    .form-control {
	    	display: inline !important;

	    }
	    .row{
	    	margin: 20 0 20 0
	    }
	    form{
	    	background-color: #F2E0E2;
	    	margin: 0 50 0 50;
	    	padding: 50 150 50 150; 

	    }
	    label{
	    	display: inline !important;
	    	font-size: 18px;
	    	weight: 300;
	    } 
		h1{
			weight: 600;
			font-size:30px !important;
		}
		h2{
			text-align: center
		}
		p{
			font-size: 24px;
			text-align: center;
		}
		.FeaturesSection{
			padding:0px;
			list-style-type: none;
			color:#8f8c8c;
			font-size: 12px;
		}

		input[type="button"]{
			background-color:#E0C1D0 !important;
			width:100%;
			border: none;

		}

		#errorMessage{
			color:red;
		}
	</style>



</initialinfo>