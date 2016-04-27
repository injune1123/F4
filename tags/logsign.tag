<logsign>
	<div class="outside-background">
	</div>
	<!-- login -->
	<div class="panel panel-info loginPanel" if= {!inRegister}>	
			<a href="/#" onclick={unmount} class="panel-close"><img src="https://cdn4.iconfinder.com/data/icons/online-menu/64/x_close_denied_delete_cross_circle-128.png" alt=""></a>
	        <div class="panel-heading">
				<h1>Log In</h1>
				<h3 if={signInErrorMessage} class="signInErrorMessage">{signInErrorMessage}</h3>
	        </div>
			<div class="panel-body" >
	            <form class="login form-signin">
	                <fieldset onkeypress={SigninKey}>
	                    <label for="Email" style="display:block">Email address</label>
	                    <input type="text" name="username" placeholder="Email" id="EmailLog" class="form-control">
	                    <label for="Password">Password</label>
	                    <input type="password" name="password" placeholder="password" id="PasswordLog" class="form-control">
	                    <div class="checkbox">
	                        <label>
	                            <input type="checkbox" value="rememberMe"> remember me
	                        </label>
	                    </div>
	                    <div class="signinButton">
	                        <div class="btn btn-info" onclick={Signin}>Log in</div>
	                    </div>
	                </fieldset>
	            </form>
	            <div class="sign-up">
	        	Not a member yet? Become a <a onclick={goRegister}>member</a> today!
	        	</div>
	        </div>
	</div>
	<!--  the register form-->
	<!-- here are actually three forms -->
	<!-- source code copyright from Atakan Goktepe http://codepen.io/atakan/pen/gqbIz -->

	<div id="multiple-step-register-from" if={inRegister}>
		<!-- the 1st register form -->	
		<div id="step1-register-from" class="register-from-steps"> 
			<div class="panel panel-info registerPanel">	
				<a href="/#" onclick={unmount} class="panel-close"><img src="https://cdn4.iconfinder.com/data/icons/online-menu/64/x_close_denied_delete_cross_circle-128.png" alt=""></a>
		        <div class="panel-heading title">
					<h1>Create your account: 1/3</h1>					
					<h3 if={errorMessage} class="errorMessage">{errorMessage}</h3>
	    	    </div>
				<div class="panel-body" >
	            	<form class="register form-register">
	                	<fieldset>
	                		<label for="Email" style="display:block">Email address</label>
	                  		<input type="text" name="email" placeholder="Email" class="form-control"/>
	                  		<label for="Password">Password</label>
			    			<input type="password" name="pass" placeholder="Password" class="form-control"/>
			    			<label for="ConfirmPassword">Confirm Password</label>
			    			<input type="password" name="cpass" placeholder="Confirm Password" class="form-control"/>
			    			<br/>

	           				<input type="button" name="next" class="next action-button btn btn-info" value="Next" id="register"/>
	           				<br/>
	                	</fieldset>
	            	</form>
	            	
					<div class="registered-hint">
	        		Already a member? <a onclick={goRegister}>Sign in</a> Now!
	        		</div>
	        	</div>
			</div>
		</div>
		<!-- the 2nd register form -->	
		<div id="step2-register-from" class="register-from-steps">
			<div class="panel panel-info registerPanel">	
				<a href="/#" onclick={unmount} class="panel-close"><img src="https://cdn4.iconfinder.com/data/icons/online-menu/64/x_close_denied_delete_cross_circle-128.png" alt=""></a>
		        <div class="panel-heading title">
					<h1 class="title">Input personal info: 2/3</h2>
			    	<h3 class="subtitle">Account created! Now let's have your personal information.</h3>
	    	    </div>
				<div class="panel-body" >
	            	<form class="register form-register">
	                	<fieldset>
	                		<label for="Nickname" style="display:block">Nickname</label>
							<input type="text" name="nickname" placeholder="Nickname" class="form-control"/>
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
						    <br/>
						    <input type="button" name="next" class="next action-button btn btn-info" value="Next" id="personal"/>
	                	</fieldset>
	            	</form>

	        	</div>
	       		<div id="registered-hint2">
	        	Already a member? <a onclick={goRegister}>Sing in</a> Now!
	        	</div>
			</div>			
		</div>
		<!-- the 3rd register form -->	
		<div id="step3-register-from" class="register-from-steps">
			<div class="panel panel-info registerPanel">	
				<a href="/#" onclick={unmount} class="panel-close"><img src="https://cdn4.iconfinder.com/data/icons/online-menu/64/x_close_denied_delete_cross_circle-128.png" alt=""></a>
		        <div class="panel-heading title">
					<h1 class="title">Set Goal: 3/3</h1>
			    	<h3 class="subtitle">Now set up the objective weight and expecting period. Don't be too harsh on yourself!</h3>
	    	    </div>
				<div class="panel-body" >
	            	<form class="register form-register">
	                	<fieldset>
	                		<label for="Current Weight" style="display:block">Current Weight</label>
							<input type="text" name="currentWeight" placeholder="Current Weight" class="form-control"/>
							<label for="ObjectiveWeight" style="display:block">Objective Weight</label>
			    			<input type="text" name="objective" placeholder="Objective Weight" class="form-control"/>
							<label for="Period" style="display:block">Date to be Fit</label>	
							<input type="date" name="dateToBeFit" class="form-control">
			    			<br/>
			    			<input type="button" name="next" class="next action-button btn btn-info" value="Finish" id="setgoal"/>
	                	</fieldset>
	            	</form>
	        	</div>
	        	<div id="registered-hint3">
	        	Already a member? <a>Sing in</a> Now!
	        	</div>
			</div>						
		</div>
	</div>

	<script>

    var that = this;
	
	if(Parse.User.current()){
		window.location.replace("/#");
	}

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

	that.inRegister = false;

	that.checkUserExistance = function(username,callback){
		
    	var query = new Parse.Query(Parse.User);
	    query.equalTo("username", username);
	    
	    query.find().then(function(result){callback(result)});
	};

	that.checkPassword = function() {
		if(that.Password.value == "" || that.ReinputPassword.value == ""){return false;}
		else{ return (that.Password.value == that.ReinputPassword.value); }
     
	};

	that.Signin = function(e){
	
		var usrname = that.EmailLog.value;

		that.checkUserExistance(usrname,function(response){
			if(!response.length){
				that.signInErrorMessage = "Email not found.";
				that.EmailLog.value = that.PasswordLog.value = "";
				riot.update();	
			}
			else{
				Parse.User.logIn(EmailLog.value,PasswordLog.value).then(function(user){
					window.location.reload();
				},function(error){
					that.signInErrorMessage = "Wrong password";
					that.PasswordLog.value = "";
					riot.update();
				})
			}
		});
		window.location.replace = '/#dashboard';
		            riot.mount('#Mount-dashboard','record');

	};

	that.SigninKey = function(event){
		if (event.which === 13){
			this.Signin(event);
		}
		return true;
	};
	
	that.goRegister = function(e){
		that.inRegister = true;
		// this.unmount();
		return true;
	}

	// save the user data into database
	that.register = function(callback){
		//create a Parse promise object
		var promise = new Parse.Promise();
		var usrname = that.email.value;
	
		if(that.pass.value == that.cpass.value){
		
			var user = new Parse.User();

	        user.set("username", that.email.value);
	        user.set("password", that.pass.value);
	        user.set("email", that.email.value);
			user.signUp().then(function(user){
				promise.resolve(user);
			}, function(error){
				promise.reject(error);
			})	
		}
		else{
			that.errorMessage = "Two passwards not confirm.";
			that.pass.value = that.cpass.value = "";
			riot.update();
			promise.reject(that.errorMessage);
		}
		return promise;
	};

	that.moveToNext = function(current_fs,next_fs){
		var left, opacity, scale; //fieldset properties which we will animate
		var animating; //flag to prevent quick multi-click glitches
	
		//show the next fieldset
		next_fs.show(); 
		//hide the current fieldset with style
		current_fs.animate({opacity: 0}, {
			step: function(now, mx) {
				//as the opacity of current_fs reduces to 0 - stored in "now"
				//1. scale current_fs down to 80%
				scale = 1 - (1 - now) * 0.2;
				//2. bring next_fs from the right(50%)
				left = (now * 50)+"%";
				//3. increase opacity of next_fs to 1 as it moves in
				opacity = 1 - now;
				current_fs.css({
	        'transform': 'scale('+scale+')',
	        'position': 'absolute'
	      	});
				next_fs.css({'left': left, 'opacity': opacity});
			}, 
			duration: 800, 
			complete: function(){
				current_fs.hide();
				animating = false;
			}, 
			//this comes from the custom easing plugin
			easing: 'easeInOutBack'
		});
	}


	that.on('updated',function(){

		//jQuery has to go into updated function
		//first need to check which step is currently on
		$(".next").click(function(){
			var $pane = $(this);
			//if user is registering account
			if($pane.attr('id') == 'register'){
				//register. use deffered
				
				that.register().then(function(user){
					that.moveToNext($("#step1-register-from"),$("#step2-register-from"))
					}, function(error){
			      		that.errorMessage = "Email address aleady exists."
			      		that.email.value = that.pass.value = that.cpass.value = "";
			      		riot.update();
				});

			}
			else if ($(this).attr('id') == 'personal') {
				var currentUser = Parse.User.current();
				currentUser.set('infos',
					{nickname:that.nickname.value,
						age:that.age.value,
						heightInMeter:that.heightMeter.value,	
						sex:$('select option:selected').val()
					});
				currentUser.save().then(function(user){

				that.moveToNext($("#step2-register-from"),$("#step3-register-from"))
				},
					function(error){
						//some errors here
					})
				
			}
			else{
				var currentUser = Parse.User.current();
				var currentDate = new Date();
				currentUser.set('initialWeight',{date: currentDate, weight: that.currentWeight.value});
				currentUser.set('Goal',{date: that.dateToBeFit.value, weight: that.objective.value});
				currentUser.save().then(function(){
					that.moveToNext($(this).parent(),$(this).parent().next());
					window.location.href = '/#dashboard';
					that.unmount();
				});
				
			}
		})
	})




	</script>

    <style scoped>

		.outside-background{
			position:fixed;
			top:0;
			bottom: 0;
			left:0;
			right:0;
			background-color: rgb(102,102,102);
			opacity: 0.7;
			z-index: 1;
			display: block;
		}
		.loginPanel, #multiple-step-register-from{
			position: fixed;
			top:0;
			left:0;
			right:0;
			z-index: 10;
			max-width: 330px;
			margin: 100px auto 100px auto;
		}
		.sign-up{
			background-color: rgb(217, 237, 247);
			padding:10px;
			margin:-16px;
			border-radius: 8px;
			color:rgb(49, 112, 143);
		}

		.registered-hint{
			    background-color: rgb(217, 237, 247);
			    padding: 10px;
			    margin: -16px;
			    border-radius: 8px;
			    color: rgb(49, 112, 143);
		}
		#registered-hint2{
				background-color: rgb(217, 237, 247);
			    padding: 10px;
			    border-radius: 8px;
			    color: rgb(49, 112, 143);
		}
		#registered-hint3{
				background-color: rgb(217, 237, 247);
			    padding: 10px;
			    border-radius: 8px;
			    margin-top: -16px;

			    color: rgb(49, 112, 143);
		}

	


		.panel-heading>div{
			display:inline-block;
			width: 48%;
			text-align: center;	
		}
		.panel-heading .active{
			background-color: grey;
		}
		h1{
			text-align: center;
			font-size: 20px;
		}
		.loginPanel input{
			margin-bottom: 20px;
		}
		.login_result{
			height: 100px;
		}
		.signinButton{
			margin-top: 20px;
			margin-bottom: 20px;
			text-align: center
		}
		.errorMessage{
			color:red;
			font-size: 18px;
				height: 30px;

		}
		.panel-close{
			position: absolute;
			right: -3px;
			top:-3px;
		}
		.panel-close img{
			width:20px;
		}
	
		.register-from-steps{
			/*stacking fieldsets above each other*/
			position: relative;
		}
		/*at first only show #step1-register-from*/
		#step2-register-from, #step3-register-from {
			display: none;
		}

		.subtitle {
		font-weight: normal;
		font-size: 13px;
		color: #666;
		margin: -15px 0 10px;
		line-height: 20px;
		}

		/*error message*/
		.errorMessage, .signInErrorMessage {
			font-weight: normal;
			font-size: 13px;
			color: #B51E1E;
			margin: -15px 0 10px;
		}
		.action-button{
			margin: 0 auto;
			display: block
		}



    </style>

</logsign>