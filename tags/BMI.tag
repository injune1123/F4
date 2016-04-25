<BMI>
  BMI: {bmiValue.toFixed(2)} 
  <span id="bmiMessage"></span>


	<div id="container">
  <div id="navi"></div>

  <div id="infoi">
    <img src="../Images/yiyi.png" height="100" width="100" />
  </div>
</div>

<script>

var that = this;
that.obese = false;
that.overweight = false;
that.healthy = false;
that.underweight = false;


var currentUser = Parse.User.current();
// get user's height
var userHeight = currentUser.get("infos").heightInMeter
// get user's latest weight
var weightLog = currentUser.get("weightLog") || [];
var currentWeight= 0;
if (weightLog.length == 0){
	currentWeight = currentUser.get("initialWeight").weight
}else{
	currentWeight = currentUser.get("weightLog")[0].weight;
}


//  BMI = weight(kg) ÷height^2（m）


var currentWeightInKg = currentWeight/2.20462262185;
var bmiValue = currentWeightInKg/userHeight/userHeight;
that.bmiValue = bmiValue;


//A BMI below 18.5 (shown in white) is considered underweight. grey
//A BMI of 18.5 to 24.9 (green) is considered healthy. green
//A BMI of 25 to 29.9 (yellow) is considered overweight. yellow
//A BMI of 30 or higher (red) is considered obese. red

this.on('updated', function(){
if (bmiValue<=18.5){
	document.getElementById("navi").className += "grey";
	document.getElementById("navi").style.height = "" + bmiValue/50*100 + "%";
    document.getElementById("navi").style.marginTop =  (1- bmiValue/50)*100 + "%"; 
    document.getElementById("bmiMessage").innerHTML =  ": Underweight"; 

}

if (bmiValue>18.5&&bmiValue<24.9){
	document.getElementById("navi").className += "green";
	document.getElementById("navi").style.height = "" + bmiValue/50*100 + "%";
    document.getElementById("navi").style.marginTop =  (1- bmiValue/50)*100 + "%"; 
    document.getElementById("bmiMessage").innerHTML =  ": Overweight"; 


}

if (bmiValue>25&&bmiValue<29.9){
	    that.overweight = true;
    that.update();
	document.getElementById("navi").className += "yellow";
	document.getElementById("navi").style.height = "" + bmiValue/50*100 + "%";
    document.getElementById("navi").style.marginTop =  (1- bmiValue/50)*100 + "%"; 
    document.getElementById("bmiMessage").innerHTML =  ": Healthy"; 


}
if (bmiValue>30){
    that.obese = true;
	document.getElementById("navi").className += "danger";
	document.getElementById("navi").style.height = "" + bmiValue/50*100 + "%";
    document.getElementById("navi").style.marginTop =  (1- bmiValue/50)*100 + "%";
    document.getElementById("bmiMessage").innerHTML =  ": Obese"; 



}
})




</script>



<!-- 	<div>

		<h5 class="text-center">BMI</h5>
		<img src="http://www.daviddarling.info/images/body_outline.jpg" alt="">

	</div> -->

	<style scoped>
		:scope
		#container {
		  width: 100px;
		  height: 100px;
		  position: relative;
		}		
		#navi {
		  width: 100%;
		  height: 30%;
		  position: absolute;
		  top: 0;
		  left: 0;
		}
		.grey{
			background-color:grey 
		}
		.danger{
			background-color:red 
		}
		.green{
			background-color:green 
		}
		.yellow{
			background-color:yellow 
		}


		#infoi {
		  width: 100%;
		  height: 100%;
		  position: absolute;
		  top: 0;
		  left: 0;
		}
		#infoi {
		  z-index: 10;
		}

		/*
		img{
			width: 200px;
			display: block;
		    margin-left: auto;
		};
		div{
			margin: 0 auto; 
		};*/

		
	</style>

</BMI>