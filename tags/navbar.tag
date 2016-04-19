<navbar>
	<!-- Always shows a header, even in smaller screens. -->
<!-- <navbar> -->
	<!-- Always shows a header, even in smaller screens. -->

	<div class="header">
            <div class="container">
                <div class="logo">
                    <a href="#" style="text-decoration:none">F4</a>
                </div>
                <div class="nav">
                    <ul>
                        <li><a href="#calorieCal">Calorie Calculator</a></li>
                        <li><a href="#dashboard">Dashboard</a></li>
                        <li><a if={!loggedIn} href="#" onclick={showLogin}>Log In | Sign Up</a></li>
                        
		      			<li><a if={loggedIn} href="#" onclick={logOut}>Log Out</a></li>
		      			<li><a if={loggedIn} href="#personal" > <img class="head-icon" src="https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686909-user_people_man_human_head_person-512.png" alt=""></a></li>
                    </ul>
                </div>
            </div>
        


	<script>
	var that = this;
	that.loggedIn = that.opts.loggedIn;
	console.log(that.loggedIn)

	that.logOut = function(e){
		Parse.User.logOut();
		document.location.href="/";

	}

	that.showLogin = function(e){

		riot.mount('#Login','logsign');
	}

	</script>
  <style scoped>
    :scope 
    /*.mdl-layout__header{
		background-color: red !important; 
	}*/

	.header {
		background: #424242;
		border-color: #e7e7e7;
		width:100%;
		top:0;
		position: fixed;
		z-index: 99;
	}
	

	.logo{
		float:left;
		font-family: "Helvetica";
		font-size: 20px;
		color:white;
		margin-top: 30px;
	}

	.logo a {
		text-decoration: none;
		color: white;
	}

	.logo a:hover {
        color:#f94283;
        text-decoration:none
	}

	.nav a {
		text-decoration: none;
		color: white;
	}

	.nav a:hover {
        color:#f94283;
        text-decoration:none
	}

	li {
		list-style: none;
		float: left;
		margin: 15px;
		padding-top: 15px;
	}

	.nav {
		float: right;
		height:75px;
	}

	.head-icon{
		border-radius: 50%;
		width:30px;
		margin-left: -20px;
	}


  </style>

</navbar>

 -->