<homepage>
<meta name="viewpoint" content="width=device-width, initial-scale=1.0">

    <div class="container" id="Ad">
<!--         <img id="wierdImg" src="Images/fitness4.jpg"> -->
        <h1 id="slogan">EAT, EXERCISE, TRACK, 
        <br>
        and REPEAT!</h1>
        <br>
        <h2 id="slogan2" style="line-height: 120%">WeightLoss Journal is here to help you lose weight! 
        <br>
        Enter your current and desired weight, and we will help 
        <br>
        you track your weight losing progress.</h2>
        <a href="#" class="button" id="join" onclick={showSignup}>JOIN NOW</a>
    </div>

    <div class="container" id="Intro">
        <h1 id="title">HOW WeightLoss Journal WORKS?</h1>
        <img id="line" src="Images/line.png">
        
        <div class="row" id="step1">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2 id="subtitle1">1. CALORIE CALCULATOR</h2>
                <p id="detail1" style="line-height: 150%">Check and keep track of your calorie in and out everyday.</p>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <img class="icon" id="icon1" src="Images/homepage111.png">
            </div>
        </div>
        <div class="row" id="step2">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2 id="subtitle2">2. WEIGHT TRACKING CURVE</h2>
                <p id="detail2" style="line-height: 150%">Keep a record of your weight to see which stage you are.</p>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <img class="icon" id="icon2" src="Images/calendar.png">
            </div>
        </div>
        <div class="row" id="step3">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2 id="subtitle3">3. DIARY</h2>
                <p id="detail3" style="line-height: 150%">Write your emoji diary so you can see your persistence!</p>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <img class="icon" id="icon3" src="Images/homepage222.png">
            </div>
        </div>
        <div class="container" id="startnow">
            <img id="line2" src="Images/line.png">
            <a href="#" class="button" id="start" onclick={showSignup}>START</a>
        </div>
    </div>

    
<script>
    var that = this;
    that.showSignup = function(e){
        riot.mount('#Login','logsign',{inRegister:true});
    }
</script>




<style scoped>
    :scope
    
    #Ad {
        margin-left: 0;
        margin-right: 0;
        margin-top: -5vh;
        padding-left: 0;
        padding-right: 0;
        width: 100vw;
        height: 88vh;
        background-image: url("Images/fitness4.jpg");
        background-size: 100vw 88vh;
    }
    

    h1#slogan{
        font-family:times;
        font-size:2.5vw;
        text-align:left;
        position:absolute;
        top:16%;
        left:9%;
        color:white;
    }
    
    h2#slogan2 {
        font-family: arial;
        font-size: 1.4vw;
        text-align: left;
        position: absolute;
        top: 35%;
        left: 9%;
        color: white;
    }
    
    #Ad a {
        top: 54%;
        left: 9%;
        text-align:left;
        position:absolute;
        font-size: 1.33vw;
    }

    #Ad .button {
        background-color: white;
        border: none;
        color: #073F8C;
        padding: 0.75vh 2.55vw;
        text-align: center;
        text-decoration: none;
        display: inline-block;
    }

    h1#title {
        font-family: times;
        font-size:2.6vw;
        font-weight: bold;
        text-align: center;
        position: absolute;
        top: 104%;
        left: 29%;
    }

    img#line {
        position: absolute;
        top: 119%;
        left: 37%;
        width: 20vw;
    }

    #Intro .row h2 {
        font-size: 1.7vw;
        position: absolute;
        text-align: center;
        font-weight:bold;
    }

    #Intro .row p {
        font-size: 1.45vw;
        position: absolute;
        text-align: center;
        left: 18%;
    }

    #Intro .row img {
        text-align: center;
    }

    h2#subtitle1 {
        padding-top: 28vh;
        left: 35%;
    }

    p#detail1 {
        padding-top: 43vh;
    }
    
    h2#subtitle2 {
        padding-top: 5vh;
        left: 32%;
    }

    p#detail2 {
        padding-top: 20vh;
    }

    h2#subtitle3 {
        padding-top: 11vh;
        padding-left: 20vw;
    }
    
    p#detail3 {
        padding-top: 26vh;
    }
    
    img#icon1 {
        width: 30vw;
        height: 62vh;
        padding-top: 24vh;
        padding-left: 7vw;
    }
    
    img#icon2 {
        padding-top: 6vh;
        padding-left: 13vw;
        height: 32vh;
        width: 24vw;
    }
    
    img#icon3 {
        width: 30vw;
        height: 49vh;
        padding-top: 6vh; 
        padding-left: 8vw;       
    }

    #startnow {
        margin-top: 15vh;
        margin-bottom: 20vh;
    }

    img#line2 {
        position: absolute;
        top: 248%;
        left: 37%;
        width: 20vw;
    }

    #startnow a {
        top: 257%;
        left: 42.3%;
        text-align:center;
        position:absolute;
        font-size: 2.2vw;
    }
   
    #startnow .button {
        background-color: white;
        border-style: solid;
        border-width: thin;
        border-color: #424242;
        padding: 2.2vh 1.4vw;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        color: #424242;
        font-family: times;
        font-weight: bold;
    }

</style>



</homepage>