<navbar>
<meta name="viewpoint" content="width=device-width, initial-scale=1.0">
	<!-- Always shows a header, even in smaller screens. -->
	
	  



<!-- <navbar> -->
	<!-- Always shows a header, even in smaller screens. -->

	<div class="header">
<!--             <div class="container"> -->
            <div class="nav row">
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 logo">
                	<img src="Images/logonew.png" id="logonew">
                    <a href="#homepage" style="text-decoration:none">WeightLoss Journal</a>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div>
				<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 login">
                    <ul>
<!--                         <li><a href="#calorieCal">Calorie Calculator</a></li>
                        <li><a href="#dashboard">Dashboard</a></li> -->
                        <li><a if={!loggedIn} href="#" onclick={showLogin}>LOG IN </a>
                        <a if={!loggedIn} href="#" onclick={showSignup}> &nbsp;&nbsp;&nbsp; SIGN UP</a></li>
                        
<!--                         <li><a if={loggedIn} href="#personal" > <img class="head-icon" src="https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686909-user_people_man_human_head_person-512.png" alt=""></a></li> -->
		      			<li><a if={loggedIn} href="#" onclick={logOut}>Log Out</a></li>
		      			<li><a if={loggedIn} href="#dashboard">Dashboard</a></li>
		      			
                    </ul>
                </div>
                </div>
            </div>
        


	<script>
	var that = this;
	that.loggedIn = that.opts.loggedIn;
	

	that.logOut = function(e){
		Parse.User.logOut();
		document.location.href="/";

	}

	that.showLogin = function(e){

		riot.mount('#Login','logsign',{inRegister:false});
	}

	that.showSignup = function(e){
		riot.mount('#Login','logsign',{inRegister:true});
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
		height: 65px;
		top:0;
		position: fixed;
		z-index: 99;
	}
	
	.nav a {
		text-decoration: none;
		color: white;
		font-size: 1.05vw;
/*		margin-top: 32px;*/
	}

	.nav a:hover {
        color:#f94283;
        text-decoration:none;
        font-size: 1.05vw;
/*        margin-top: 32px;*/
	}

	.logo{
		/*float:left;*/

/*		margin-top: 3.3vh;*/
/*		padding-right: 60%;*/
/*		margin-left: 3.9%;*/
		margin-top: 25px;
	}

	.logo a {
		text-decoration: none;
		color: white;
/*		left: 60%;*/
		margin-left: 11vw;
		font-family: "Helvetica";
		font-size: 1.3vw;
		color:white;
		font-weight: bold;
	}

	.logo a:hover {
        color:#f94283;
        text-decoration:none;
        margin-left: 11vw;
		font-family: "Helvetica";
		font-size: 1.3vw;
		color:white;
		font-weight: bold;
	}

	img#logonew {
		height: 40px;
		width: 2.2vw;
		position: absolute;
		margin-top: -12px;
		margin-left: 8vw;
		margin-right: 3vw;
	}

	li {
		list-style: none;
/*		float: left;*/
/*		padding-left: 2.5vw;*/
	}

	.nav {
/*		float: right;*/
/*		height:75px;*/
/*		margin-top: 7px;*/
/*		margin-left: 55vw;*/
/*		width: 35vw;*/
/*		margin-right: 2vw;*/
/*		margin-left: 400px;*/
/*		margin-right: -10%;*/
	}

	.login {
		margin-top: 25px;
	}

	.login li {
		display: inline;
		margin-right: 5vw;
		float: right;
	}

/*	.head-icon{
		border-radius: 50%;
		width:2vw;
		height: 30px;
		margin-right: 1vw;
	}*/



  </style>

</navbar>

 -->