// initialize parse app
// connect to the parse porject
Parse.initialize("yiG8gq1FCWUdkMSFSNs8jMQvPGgVeRSccgVikA8K", "uWvwbnCc1PcNxwGM22lj1z7xqoy7jG0jLIHZ0P8q");

//get username and password
function GetUserNameAndPassword() {
    var userNameAndPassword = {};
    var username = $("[name='username']").val();
    var password = $("[name='password']").val();
    userNameAndPassword.username = username;
    userNameAndPassword.password = password;
    return userNameAndPassword;
}

// this function shows the error message
function showMessage(message) {
    $(".login_result .errorMessage").empty().html("*" + message);
}


function checkUserExistance(username, password) {
    var user = new Parse.User();
    var query = new Parse.Query(user);
    query.equalTo("username", username);
    query.find({
        success: function(results) {
            if (!results.length) {
                showMessage("wrong username");
            } else {
                Parse.User.logIn(username, password, {
                    success: function(user) {
                        // successfully login.
                        window.location.href = "http://stackoverflow.com";
                    },
                    error: function(user, error) {
                        showMessage("wrong password");
                    }
                });

            }



        },
        error: function(error) {
            alert("Error: " + error.code + " " + error.message);
        }
    })

}





function checkPasswordMatch(username, password) {
    var result = {};
    var user = new Parse.User();
}




// when the signinButton is clicked...
$(".signinButton >.btn").click(function() {
        var username = GetUserNameAndPassword().username;
        var password = GetUserNameAndPassword().password;
        if (!username || !password) {
            showMessage("missing info");
        } else {
            checkUserExistance(username, password);

        }
        console.log(username, password)

    })