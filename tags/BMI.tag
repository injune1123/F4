<BMI>

<a class="BMI-tooltip" data-toggle="tooltip" title="Note: BMI(Body Mass Index). The Body mass index (BMI) or Quetelet index is a value derived from the mass (weight) and height of an individual. Commanly accepted BMI ranges are underweight: under 18.5, normal weight: 18.5 to 25, overweight:25 to 30, obese: over 30.">
<div id="container">
  <div id="navi"></div>

  <div id="infoi">
    <img src="../Images/yiyi.png" height="270" width="175" />
  </div>
</div>
</a>
	Recent BMI: {bmiValue.toFixed(2)} 
  	<span id="bmiMessage"></span>
<script>

var that = this;
that.obese = false;
that.overweight = false;
that.healthy = false;
that.underweight = false;

this.on("updated",function(){

$('a[data-toggle="tooltip"]').tooltip({
    animated: 'fade',
    placement: 'right',
    html: true
});
})


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
	document.getElementById("navi").className += "danger";
	document.getElementById("navi").style.height = "" + bmiValue/50*270 + "px";
    document.getElementById("navi").style.marginTop =  (270- bmiValue/50*270) + "px"; 
    document.getElementById("bmiMessage").innerHTML =  "Underweight!"; 
}

if (bmiValue>18.5&&bmiValue<24.9){
	document.getElementById("navi").className += "green";
	document.getElementById("navi").style.height = "" + bmiValue/50*270 + "px";
    document.getElementById("navi").style.marginTop =  (270- bmiValue/50*270) + "px"; 
    document.getElementById("bmiMessage").innerHTML =  "Healthy!"; 


}

if (bmiValue>25&&bmiValue<29.9){
	document.getElementById("navi").className += "warning";
	document.getElementById("navi").style.height = "" + bmiValue/50*270 + "px";
    document.getElementById("navi").style.marginTop =  (270- bmiValue/50*270) + "px"; 
    document.getElementById("bmiMessage").innerHTML =  "Overweight!"; 

}
if (bmiValue>30){
	document.getElementById("navi").className += "danger";
    that.obese = true;
    if (bmiValue/50*200>200){
    document.getElementById("navi").style.height ="270px";
    }else{
    document.getElementById("navi").style.height = "" + bmiValue/50*270 + "px";
    document.getElementById("navi").style.marginTop =  (200- bmiValue/50*270) + "px";
    }
    document.getElementById("bmiMessage").innerHTML =  "Obese"; 

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
		  width: 175px;
		  height: 270px;
		  position: relative;
		}		
		#navi, #infoi {
		  width: 100%;
		  height: 100%;
		  position: absolute;
		  top: 0;
		  left: 0;
		}
		.BMI-tooltip + .tooltip > .tooltip-inner {
			background-color:rgba(255, 255, 255, 1);
			color:black;
			width: 500px;
			padding: 10 10 10 10;
			text-align:left;
			font-size: 14px;
		}
		.tooltip.in {
		  opacity: 1;
		  filter: alpha(opacity=100);
		}
		.tooltip-inner {
	    border: groove 3px #ccc;
	    	border-style: outset;
		}
		.danger{
			background-color:#e16778; 
		}
		.green{
			background-color:#99c4b2; 
		}
		.warning{
			background-color:#f6cabe; 
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
			width: 270px;
			display: block;
		    margin-left: auto;
		};
		div{
			margin: 0 auto; 
		};*/

		
	</style>

</BMI>