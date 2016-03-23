<record-weight>
<div>
        <!-- the input value card -->
        <div class="weight-input-card-wide mdl-card mdl-shadow--2dp center">
          <div class="mdl-card__title">
            <h2 class="mdl-card__title-text"><b>Track your steps</b></h2>
          </div>

          <div class="mdl-card__supporting-text">
            <p>You are getting here.</p>
            <p>Enter your current wieight.</p>
          </div>

          <div class="mdl-card__actions mdl-card--border">
            <p>
				On  <input type="date" name="idealDate">
				</p>
			<p>
				I wieigh             <input type="number" name="targetWeight" placeholder = "target weight (lb)">

				</p>

                        

             <!-- Accent-colored raised button with ripple -->
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick={saveGoalData}>
              Yeah!
            </button>
          </div>
        </div>

</div>
    <script>
     // create the WeightTrack 
     var  WeightTrack = Prase.Object.extend('WeightTrack');


    </script>

  <style scoped>
    :scope 

    .weight-input-card-wide.mdl-card {
      width: 512px;
      padding-top: 20px;
                margin: 0 auto;

    }
    .weight-input-card-wide > .mdl-card__title {
      color: #33691E;
      height: 176px;
      background: url('http://img2.3lian.com/2014/f2/35/d/7.jpg') center / cover;
    }
    .weight-input-card-wide .mdl-card__title-text {
    margin-left: 250px
    }
    .mdl-card__actions{
        text-align: center        
    }
    .mdl-card__supporting-text{
        text-align: center;
    }

    .mdl-card__supporting-text>p{
        font-size: 16px !important;
        color: #558B2F

    }


    input{
        border: 2px solid #9CCC65;
        border-radius: 6px;
        padding: 5px 10px;
        width: 10em;
    }

    button{
        width:20%;
        background-color: #CD5C5C !important;

    }
</style>


</record-weight>