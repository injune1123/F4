<navbar>
	<!-- Always shows a header, even in smaller screens. -->
<<<<<<< HEAD

	<div class="header">
            <div class="container">
                <div class="logo">
                    <a href="#" style="text-decoration:none">F4</a>
                </div>
                <div class="nav">
                    <ul>
                        <li><a href="#calorieCal">Calorie Calculator</a></li>
                        <li><a href="#dashboard">Dashboard</a></li>
                        <li><a href="#" onclick={showLogin}>Log In | Sign Up</a></li>
                        <!-- <a if={!loggedIn} class="mdl-navigation__link" href="#" onclick={showLogin}>Log In | Sign Up</a>
		      			<a if={loggedIn} class="mdl-navigation__link" href="#" onclick={logOut}>Log Out</a>
		      			<a if={loggedIn} class="mdl-navigation__link" href="#personal" > <img class="head-icon" src="https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686909-user_people_man_human_head_person-512.png" alt=""></a> -->
                    </ul>
                </div>
            </div>
        
=======
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  <header class="mdl-layout__header my-header">
	    <div class="mdl-layout__header-row">
	      <!-- Title -->
	      <span class="mdl-layout-title"><a href="#">F4</a></span>
	      <!-- Add spacer, to align navigation to the right -->
	      <div class="mdl-layout-spacer"></div>
	      <!-- Navigation. We hide it in small screens. -->
	      <nav class="mdl-navigation mdl-layout--large-screen-only">
		      <a class="mdl-navigation__link" href="#calorieCal">Calorie Calculator</a>
		      <a if={loggedIn} class="mdl-navigation__link" href="#dashboard">Dashboard</a>
		      <!-- <a class="mdl-navigation__link" href="">knowledge</a> -->
		      <a if={!loggedIn} class="mdl-navigation__link" href="#" onclick={showLogin}>Log In | Sign Up</a>
		      <a if={loggedIn} class="mdl-navigation__link" href="#" onclick={logOut}>Log Out</a>
		      <!-- don't need this anymore -->
		      <!-- <a if={loggedIn} class="mdl-navigation__link" href="#personal" > <img class="head-icon" src="https://cdn0.iconfinder.com/data/icons/superuser-web-kit/512/686909-user_people_man_human_head_person-512.png" alt=""></a> -->


	      </nav>
	    </div>
	  </header>
	  <div class="mdl-layout__drawer" >
	    <span class="mdl-layout-title">F4</span>
	    <nav class="mdl-navigation">
	      <a class="mdl-navigation__link" href="">Calorie Calculator</a>
	      <a class="mdl-navigation__link" href="">Weight Prediction</a>
	      <!-- <a class="mdl-navigation__link" href="">knowledge</a> -->
	      <a class="mdl-navigation__link" href="">Log In | Sign Up</a>
	    </nav>
	  </div>
	  
	</div>
>>>>>>> master

	<script>
	var that = this;
	that.loggedIn = that.opts.loggedIn;

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


  </style>

</navbar>

