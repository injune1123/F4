<personal>

	<div class="container main-wrapper">
		<h2>Basic Information</h2>
		<form>
			<div class="form-group">
				<label for="user-name">Name</label>
				<input type="text" class="form-control" name="nickname" placeholder={data.nickname}>
				<label for="age">Age</label>
				<input type="text" class="form-control" name="age" placeholder="{data.age} years old">
				<label>Sex</label>
				<div class="radio">
					<label>
						<input type="radio" name="sexradio" value="male" id="radio1" checked={data.sex==radio1.value}>
						Male
					</label>
					
				</div>
				<div class="radio">
					<label>
						<input type="radio" name="sexradio" value="female" id="radio2" checked={data.sex==radio2.value}>
						Female
					</label>
				</div>
				<div class="radio">
					<label>
						<input type="radio" name="sexradio" value="other" id="radio3" checked={data.sex==radio3.value}>
						Other
					</label>
				</div>
				<label for="current">Current Weight</label>
				<input type="text" class="form-control" name="current" placeholder="{data.current} pound">
				<label for="objective">Objective Weight</label>
				<input type="text" class="form-control" name="objective" placeholder="{data.objective} pound">
				<label for="period">Losing Period</label>
				<input type="text" class="form-control" name="period" placeholder="{data.period} months">
			</div>
			<input type="button" class="btn btn-default" value="Update" onclick={updateInfo}>
		</form>
	</div>

	<script>	
		var that = this;
		that.data = Parse.User.current().toJSON().infos;
		
		that.updateInfo = function(e){
			Parse.User.current().set('infos',{
				nickname:that.nickname.value || that.data.nickname,
				age:that.age.value || that.data.age, 
				objective:that.objective.value || that.data.objective,
				period:that.period.value || that.data.period,
				sex:$('input[name=sexradio]:checked').val() || that.data.sex
			}).save().then(function(){
				that.data = Parse.User.current().toJSON().infos;
				that.update();
			})


			console.log(that.nickname.value || that.data.nickname )
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

	</style>
</personal>