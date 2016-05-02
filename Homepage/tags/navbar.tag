<navbar>
<meta name="viewpoint" content="width=device-width, initial-scale=1.0">
	<!-- Always shows a header, even in smaller screens. -->
	
	  



<!-- <navbar> -->
	<!-- Always shows a header, even in smaller screens. -->

	<div class="header">
            <div class="container">
                <div class="logo">
                    <a href="#" style="text-decoration:none">WeightLoss Diary</a>
                </div>
                <div class="nav">
                    <ul>
<!--                         <li><a href="#calorieCal">Calorie Calculator</a></li>
                        <li><a href="#dashboard">Dashboard</a></li> -->
                        <li><a if={!loggedIn} href="#" onclick={showLogin}>LOG IN | SIGN UP</a></li>
                        
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
		height: 10vh;
		top:0;
		position: fixed;
		z-index: 99;
	}
	

	.logo{
		float:left;
		font-family: "Helvetica";
		font-size: 1.3vw;
		color:white;
		margin-top: 3.3vh;
		padding-right: 60%;
		margin-left: 1.6%;
	}

	.logo a {
		text-decoration: none;
		color: white;
		left: 60%;
	}

	.logo a:hover {
        color:#f94283;
        text-decoration:none
	}

	.nav a {
		text-decoration: none;
		color: white;
		font-size: 1.05vw;
	}

	.nav a:hover {
        color:#f94283;
        text-decoration:none;
        font-size: 1.05vw;
	}

	li {
		list-style: none;
		float: left;
		padding-left: 2.5vw;
	}

	.nav {
/*		float: right;*/
/*		height:75px;*/
		margin-top: 3vh;
		margin-left: 55vw;
		width: 35vw;
		margin-right: 2vw;
/*		margin-left: 400px;*/
/*		margin-right: -10%;*/
	}

	ul {
/*		margin-right: 2%;*/
		float: right;
	}


	.head-icon{
		border-radius: 50%;
		width:30px;
		margin-left: -20px;
	}


  </style>

</navbar>

 -->