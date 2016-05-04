<InitialInfo>

<h2>Welcome to our site!</h2> 

<h3>Before we can help you, we need some more information. 
Please tell us more about you to let us assist you better.</h3>


<form>
<label for="heightFeetInch" style="display:block">height(feet.inch)</label>
<input type="number" name="heightFeet" placeholder="5.3" class="form-control" onChange={heightFeetInputed}/>
<label for="heightFeetInch" style="display:block">height(m)</label>
<input type="number" name="heightMeter" placeholder="1.75" class="form-control" onChange={heightMInputed}/>

<label for="Age" style="display:block">Age</label>
<input type="text" name="age" placeholder="Age" class="form-control"/>
<label for="Gender" style="display:block">Gender</label>
<select class="form-control">
	<option value="female">Female</option>
	<option value="male">Male</option>
	<option value="other">Other</option>
</select>
<label for="Current Weight" style="display:block">Current Weight</label>
<input type="text" name="currentWeight" placeholder="Current Weight" class="form-control"/>
<label for="ObjectiveWeight" style="display:block">Objective Weight</label>
<input type="text" name="objective" placeholder="Objective Weight" class="form-control"/>
<label for="Period" style="display:block">Date to be Fit</label>	
<input type="date" name="dateToBeFit" class="form-control">

<input type="button" name="next" class="next action-button btn btn-info" value="Finish" id="setgoal"/>
</form>



<style scoped>
    :scope{

		background-color: #f3f3f3;
    } 
	
	.FeaturesSection{
		padding:0px;
		list-style-type: none;
		color:#8f8c8c;
		font-size: 12px;
	}
</style>


</InitialInfo>