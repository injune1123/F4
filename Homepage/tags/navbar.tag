<navbar>
	<!-- Always shows a header, even in smaller screens. -->
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
		      <a class="mdl-navigation__link" href="#prediction">Weight Prediction</a>
		      <!-- <a class="mdl-navigation__link" href="">knowledge</a> -->
		      <a class="mdl-navigation__link" href="#logsign">Log In | Sign Up</a>
	      </nav>
	    </div>
	  </header>
	  <div class="mdl-layout__drawer">
	    <span class="mdl-layout-title">F4</span>
	    <nav class="mdl-navigation">
	      <a class="mdl-navigation__link" href="">Calorie Calculator</a>
	      <a class="mdl-navigation__link" href="">Weight Prediction</a>
	      <!-- <a class="mdl-navigation__link" href="">knowledge</a> -->
	      <a class="mdl-navigation__link" href="">Log In | Sign Up</a>
	    </nav>
	  </div>
	  
	</div>


  <style scoped>
    :scope 
    /*.mdl-layout__header{
		background-color: red !important; 
	}*/
	.mdl-layout--fixed-header{
		height: 70px !important;
	}

	.my-header{
		background-color: black;
	}

  </style>

</navbar>

