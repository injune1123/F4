Parse.initialize("yiG8gq1FCWUdkMSFSNs8jMQvPGgVeRSccgVikA8K", "uWvwbnCc1PcNxwGM22lj1z7xqoy7jG0jLIHZ0P8q");

//this function will clear all form input
function clearForm() {
    $('#Email').val('');
    $('#Password').val('');
    $('#ReinputPassword').val('');
}

//check if email address is valid
function checkEmail() {
    var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
    return testEmail.test($('#Email').val());

}

//check if password reinput is correct
function checkPassword() {
    return $('#Password').val() == $('#ReinputPassword').val();
}

$('#signup').click(function(event) {
    if (checkPassword()) {
        var user = new Parse.User();
        user.set("username", $('#Email').val());
        user.set("password", $('#Password').val());
        user.set("email", $('#Email').val());

        user.signUp(null, {
            success: function(user) {
                // Hooray! Let them use the app now.
                console.log('user signup')
                clearForm();
            },
            error: function(user, error) {
                // Show the error message somewhere and let the user try again.
                alert("Error: " + error.code + " " + error.message);
            }
        });
    }
    else{
    	alert('Two passwords not confirm. Input them again.')
    	$('#Password').val('');
    	$('#ReinputPassword').val('');
    }

})
