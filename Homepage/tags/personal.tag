<personal>
	
	<div class="container">
		<div class="row">
			<h3>Personal Information</h3>
			<div class="col-sm-offset-3 col-sm-6">
				

				<p if={!editing}>First Name: {info.first}</p>
				<p if={!editing}>Last Name: {info.last}</p>
				<p if={!editing}>Age: {info.age} </p>
				<p if={!editing}>Objective Weight: {info.objective} lb</p>
				<p if={!editing}>Weight Loss Period: {info.period} month</p>
				
				<input if={editing} type="text" placeholder={info.first} name="firstName">
				<input if={editing} type="text" placeholder={info.last}>
				<input if={editing} type="text" placeholder={info.age}>
				<input if={editing} type="text" placeholder={info.objective}>
				<input if={editing} type="text" placeholder={info.period}>

			</div>
		</div>
		<div class="btn btn-info edit-btn" onclick={editInfo} if={!editing}>Edit</div>
		<div class="btn btn-info edit-btn" onclick={finish} if={editing}>Finish</div>
	</div>

	
	<script>
	//parse query find all related user information.
	var that = this;
	that.info = that.opts.info;
	that.editing = false;
	that.editInfo = function(e){
		that.editing = !that.editing;

	}

	that.finish = function(e){
		that.editing = !that.editing;
		that.info.first = that.firstName.value;

	}


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