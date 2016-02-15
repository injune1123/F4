// initialize parse app
// connect to the parse porject
Parse.initialize("yiG8gq1FCWUdkMSFSNs8jMQvPGgVeRSccgVikA8K", "uWvwbnCc1PcNxwGM22lj1z7xqoy7jG0jLIHZ0P8q");

//get username and password
function GetUserNameAndPassword (){
	var userNameAndPassword = {};
	var username = $("[name='username']").val();
	var password = $("[name='password']").val();
	userNameAndPassword.username = username;
	userNameAndPassword.password = password;
	return userNameAndPassword;
}

// when the signinButton is clicked...
$(".signinButton >.btn").click(function(){
	GetUserNameAndPassword();
})
// check if the username exists
	// if the username does not exist 
			// show a message says {{username}} has not registered
			// ***and the singup link  
	//	if the username exists
			// if the password does not match
				// show a message says your password does not match our record
				// try again
				// ***may be show forget password
			// if the password matches 
				// redirect to the dashboard page