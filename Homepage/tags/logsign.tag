<logsign>
	

<div class="panel panel-info loginPanel">
        <div class="panel-heading">
            
			<div class={active:signup} onclick={toggle}><h1>Sign Up</h1></div>
			<div class={active:login} onclick={toggle}><h1>Log In</h1></div>
            </div>
        <div class="panel-body" >
            <form class="login form-signin" >
	            <label>
                    <div class="login_result"> 
                        <p class='errorMessage'>{errorMessage}</p>
                    </div>
               	</label>
                <fieldset if={signup} onkeypress={registerKey}>
                    
                    <div class="form-group" >
                        <label for="Email">Email address</label>
                        <input type="email" class="form-control" id="Email" placeholder="Email" >
                    </div>
                    <div class="form-group" >
                        <label for="Password">Password</label>
                        <input type="password" class="form-control" id="Password" placeholder="Password">
                    </div>
                    <div class="form-group" >
                        <label for="ReinputPassword" >Input Password Again</label>
                        <input type="password" class="form-control" id="ReinputPassword" placeholder="Password">
                    </div>
                    <div class="signinButton" >
                        <div class="btn btn-info" onclick={register} >Sign Up</div>
                    </div>
                </fieldset>
            </form>
        </div>
		<div class="panel-body" >
            <form class="login form-signin">
                <fieldset if={login} onkeypress={SigninKey}>
                    <!-- <label>
                        <div class="login_result"> 
                            <p class='errorMessage'>{errorMessage}</p>
                        </div>
                    </label> -->
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
        </div>

    </div>


	<script>

	if(Parse.User.current()){
		window.location.replace("/#");
	}

	this.signup= true;
	this.login = false;

	this.toggle = function(e){
		this.signup=!this.signup;
		this.login=!this.login;
	}

	this.checkUserExistance = function(username,callback){
		
    	var query = new Parse.Query(Parse.User);
	    query.equalTo("username", username);
	    
	    query.find().then(function(result){callback(result)});
	    

	    

	};

	this.checkPassword = function() {
		if(this.Password.value == ""|| this.ReinputPassword.value == ""){return false;}
		else{ return (this.Password.value == this.ReinputPassword.value); }
     
	};

	this.register = function(e){
		
		var usrname = this.Email.value;

		this.checkUserExistance(usrname,function(response){

			if(!response.length){
				if(this.Password.value == this.ReinputPassword.value){
				
					var user = new Parse.User();

			        user.set("username", this.Email.value);
			        user.set("password", this.Password.value);
			        user.set("email", this.Email.value);
					user.signUp(null, {
			            success: function(user) {
			                // Hooray! Let them use the app now.
			                window.location.reload();
			            },
			            error: function(user, error) {
			                // Show the error message somewhere and let the user try again.
			                alert("Error: " + error.code + " " + error.message);
			            }
		        	});	
				}
				else{
					this.errorMessage = "Two passwards not confirm.";
					this.Password.value = this.ReinputPassword.value = "";
					riot.update();
				}

			}
			else{
				this.errorMessage = "Email address aleady exists."
				this.Email.value = this.Password.value = this.ReinputPassword.value = "";
				riot.update();
			}

		});
	};

	this.registerKey = function(event){
		if (event.which === 13){
			this.register(event);
		}
		return true;
	};
			

	this.Signin = function(e){
	
		var usrname = this.EmailLog.value;

		this.checkUserExistance(usrname,function(response){
			if(!response.length){
				this.errorMessage = "Email not found.";
				this.EmailLog.value = this.PasswordLog.value = "";
				riot.update();	
			}
			else{
				// Parse.User.logIn(EmailLog.value,PasswordLog.value,{
					

				// 	success:function(user){
				// 		window.location.reload();
				// 	},
				// 	error: function(user, error) {
				// 		this.errorMessage = "Wrong password";
				// 		this.PasswordLog.value = "";
	   //                  return;
	   //              }
				// })
				Parse.User.logIn(EmailLog.value,PasswordLog.value).then(function(user){
					window.location.reload();
				},function(error){
					this.errorMessage = "Wrong password";
					this.PasswordLog.value = "";
					riot.update();
				})
			}
		});
	};

	this.SigninKey = function(event){
		if (event.which === 13){
			this.Signin(event);
		}
		return true;
	};
	
	</script>

    <style scoped>
		


		.loginPanel{

			max-width: 330px;

		    margin: 100px auto;

		}
		
		.panel-heading>div{
			display:inline-block;
			width: 48%;
			
		}
		
		.panel-heading .active{
			background-color: grey;
		}

		.loginPanel h1{
			text-align: center;
			font-size: 20px;

		}

		.loginPanel input{
			margin-bottom: 20px;
		}

		/*
		.login_result{
			height: 100px;
		}*/

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

    </style>











</logsign>