<personal>

	<div class="container main-wrapper">
		<h2>Basic Information</h2>
		<form>
			<div class="form-group">
				<label for="age">Age</label>
				<input type="text" class="form-control" name="age" value={data.infos.age}>years old
				<label>Gender</label>
				<div class="radio">
					<label>
						<input type="radio" name="genderradio" value="male" id="radio1" checked={data.infos.sex==radio1.value}>
						Male
					</label>
					
				</div>
				<div class="radio">
					<label>
						<input type="radio" name="genderradio" value="female" id="radio2" checked={data.infos.sex==radio2.value}>
						Female
					</label>
				</div>
				<div class="radio">
					<label>
						<input type="radio" name="genderradio" value="other" id="radio3" checked={data.infos.sex==radio3.value}>
						Other
					</label>
				</div>
				
				<label for="weight">Objective Weight</label>
				<input type="text" class="form-control" name="weight" value={data.Goal.weight}>lb
				<label for="date">Ideal Time</label>
				<input type="date" class="form-control" name="date" value={data.Goal.date} >
			</div>
			<input type="button" class="btn btn-default" value="Update" onclick={updateInfo}>
			<div class="success-message" if={successMessage}>{successMessage}</div>
		</form>
	</div>

	<script>	
		var that = this;
		that.data = Parse.User.current().toJSON();
		
		
		that.updateInfo = function(e){
			var promises = [];

			promises.push(Parse.User.current().set('infos',{
				
				age:that.age.value, 
				sex:$('input[name=sexradio]:checked').val()
			}).save())

			promises.push(Parse.User.current().set('Goal',{
				date:that.date.value,
				weight:that.weight.value
			}));

			Parse.Promise.when(promises).then(function(){
				that.successMessage = "Your records have been updated."
				that.update();
			})

			
		}

	</script>

	<style scoped>
		
		/*placeholder style*/
		::-webkit-input-placeholder { /* WebKit, Blink, Edge */
		    color:    black;
		}
		:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
		   color:    black;
		   opacity:  1;
		}
		::-moz-placeholder { /* Mozilla Firefox 19+ */
		   color:    black;
		   opacity:  1;
		}
		:-ms-input-placeholder { /* Internet Explorer 10-11 */
		   color:    black;
		}
		/*~~~~~~~~~~~~~~~~~~~~~~*/
	
		h2{
			font-size: 25px;
			line-height: 20px;
		}

		.main-wrapper{
			width:500px;
			float: left;
		}

		.success-message{
			color:green;
			font-size: 12px;
		}

	</style>
</personal>