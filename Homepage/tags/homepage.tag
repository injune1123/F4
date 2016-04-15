<homepage>
<meta name="viewpoint" content="width=device-width, initial-scale=1.0">

    <div>
        <img id="wierdImg" src="Images/fitness4.jpg">
        <h1 id="slogan">EFFECTIVE, FIT AND FUN</h1>
        <h2 id="slogan2">CHECK OUT OUR TOOLS</h2>
        <img id="arrow" src="Images/arrow.png">
    </div>

    <div class="jumbotron">
        <h2 id="FitnessTools">FITNESS TOOLS</h2>
        <div class="lists">
            <div class="container">
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="circle">
                            <p>Check calories and keep track of what you eat everyday.</p>
                            <div class="buttonlink"><a href="#">CALORIE CALCULATOR</a></div>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="circle">
                            <p>Keep track of your workout and see how much you burn.</p>
                            <div class="buttonlink"><a href="#">WORKOUT CALCULAOTR</a></div>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="circle">
                            <p>Keep a record of your weight and see the results.</p>
                            <div class="buttonlink"><a href="#">WEIGHT PREDICTION</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="introductionNew">
        <div class="container">
            <div class="row no-gutter">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <img id="ad1" src="Images/ad1.jpg">
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <h3>More than 1000 users choose F4 for weight control!</h3>
                    <img id="ad11" src="Images/adwhite.jpg">
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <img id="ad2" src="Images/ad2.jpg">
                </div>
                 <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <h3>With F4, it's impossible for you to give up halfway! </h3>
                    <img id="ad22" src="Images/adwhite.jpg">
                </div>
            </div>
            <div class="row no-gutter">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <h3>F4, the simplest way to track calorie and weight!</h3>
                    <img id="ad33" src="Images/adwhite.jpg">
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <img id="ad3" src="Images/ad3.jpg">
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <h3>F4, check your celendar and see the results!</h3>
                    <img id="ad44" src="Images/adwhite.jpg">
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" class="columns">
                    <img id="ad4" src="Images/ad4.jpg">
                </div>
            </div>
        </div>
    </div>




<style scoped>
    :scope

    #wierdImg{
        height:auto;
        width:100vw;
        display: block;
        margin-left: auto;
        margin-right: auto;
        position:relative;
    }
    
    #arrow {
        /*size still need to be modified*/
    }

    h1#slogan{
        font-family:times;
        font-size:2.85vw;
        text-align:left;
        position:absolute;
        top:27%;
        left:7%;
        color:white;
    }
    
    h2#slogan2 {
        font-family: arial;
        font-size: 1.5vw;
        text-align: left;
        position: absolute;
        top: 32%;
        left: 17%;
        color: white;
    }
    
    #arrow {
        top: 41%;
        left: 28%;
        position: absolute;
        width: 14px;
        height: 50px;
    }
    
    .container{
        height:750px;
        width:100%;
        margin-left:0px;
        margin-right:0px;
/*        padding-top:75px;*/
        padding-left:0px;
        padding-right:0px;
/*        background-image: url("Images/adback.jpg");*/
        background-repeat: no-repeat;
        background-size: 100% 750px;

/*        width: 100%;
        height: auto;*/
    }

    img {
        width:330px;
        height:300px;
    }

    h3{
        padding-top: 35%;
        padding-left: 5%;
        padding-right: 5%;
        font-size: 18px;
        font-size: 1.5vw;
        text-align: center;
        position: absolute;
        color:black;
        line-height: 19px
    }

    .jumbotron {
        background-color: #424242;
        height:400px;
        margin-bottom:0px;
        width:100vw;
    }
    
    h2#FitnessTools{
        text-align:center;
        margin:0px;
        margin-top: 30px;
        color:white;
        font-family: times;
        padding-bottom:50px;
    }

    .jumbotron .circle {
        background: #424242;
        margin-left: auto;
        margin-right: auto;
        line-height:50px;
        text-align: center;
    }

    .jumbotron p {
        color: white;
    }

    .jumbotron .buttonlink{
        width: 200px;
        height: 50px;
        border-radius: 20px 20px 20px 20px;
        border: 1px solid white;
        margin-top: 25px;
        margin-left: auto;
        margin-right: auto;
    }

    .jumbotron .circle a:hover {
        color:white;
        text-decoration:none;
    }

    .jumbotron .col-xs-4.col-sm-4.col-md-4 {
        padding-left: 1.2%;
    }
    
    .introductionNew .container .row img {
        width: 100%;
        height: auto;
    }

    .introductionNew {
        width: 100vw;
        margin-bottom: -5%;
    }

/*     .introductionNew .container {
        border-top: solid 2px grey;
     }*/

    .row.no-gutter {
        margin-left: 0;
        margin-right: 0;
    }

    .row.no-gutter [class*='col-']:not(:first-child),
    .row.no-gutter [class*='col-']:not(:last-child) {
        padding-right: 0;
        padding-left: 0;
    }

/*    .introductionNew .container .row.no-gutter .columns {
        position: relative;
    }*/

/*    .introductionNew .container .row.no-gutter .columns h3 {
        position: relative;
        font-size: 100%;

    }*/


</style>



</homepage>