<personal>
	
	<div class="container">
		<div class="row">
			<h3>Personal Information</h3>
			<div class="col-sm-offset-3 col-sm-6">
				
				<div class="info" if={!editing}>
					<p>First Name: {data.first}</p>
					<p>Last Name: {lastName.value ? lastName.value : data.last}</p>
					<p>Age: {age.value ? age.value : data.age} </p>
					<p>Objective Weight: {objective.value ? objective.value : data.objective} lb</p>
					<p>Weight Loss Period: {period.value ? period.value : data.period} month</p>

				</div>
				<div class="edit-info" if={editing}>
					<input type="text" placeholder={data.first} name="firstName">
					<input type="text" placeholder={data.last} name="lastName">
					<input type="text" placeholder={data.age} name="age">
					<input type="text" placeholder={data.objective} name="objective">
					<input type="text" placeholder={data.period} name="period">
				</div>
			</div>
		</div>
		<div class="btn btn-info edit-btn" onclick={editInfo} if={!editing}>Edit</div>
		<div class="btn btn-info edit-btn" onclick={finish} if={editing}>Finish</div>
	</div>

	
	<script>
	//parse query find all related user information.
	var that = this;
	that.data = that.opts.info.toJSON();
	that.editing = false;
	that.editInfo = function(e){
		that.editing = !that.editing;

	}

	that.finish = function(e){
		that.editing = !that.editing;
		that.opts.info.save({first:that.firstName.value || that.data.first,last:that.lastName.value || that.data.last,age:that.age.value || that.data.age, objective:that.objective.value || that.data.objective,period:that.period.value || that.data.period}).then(function(){
			console.log(that)
			that.update()})
		
		//update stored value in database
		

	}

	// firstName.value ? firstName.value : 

	</script>





	<style scoped>
		h3{
			text-align: center;
		}
	
		.edit-btn{
			margin:0 0 30px 50%;
		}

	</style>



</personal>