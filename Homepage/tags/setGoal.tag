<set-goal>

    <div>
        <!-- the goal setting card -->
        <div class="weight-input-card-wide mdl-card mdl-shadow--2dp center">
          <div class="mdl-card__title">
            <h2 class="mdl-card__title-text"><b>See up your goal</b></h2>
          </div>

          <div class="mdl-card__supporting-text">
            <p>Desire is the key to motivation.</p>
            <p>Enter your current wieight, target weight, and time duration.</p>
          </div>

          <div class="mdl-card__actions mdl-card--border">
            <p>
              I am 
            <input type="number" name="currentWeight" placeholder = "140"> 
            lb on
            <input type="date" name="currentDate">
            </p>

            <p> I wish I will be             
            <input type="number" name="targetWeight" placeholder = "130"> lb
            on             
            <input type="date" name="idealDate">

            </p>

             <!-- Accent-colored raised button with ripple -->
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick={saveGoalData}>
              Go!
            </button>
          </div>
        </div>
    </div>



    <script>

    function setDateToToday (el) {
          var today = new Date();
          var dd = today.getDate();
          var mm = today.getMonth()+1; //January is 0!
          var yyyy = today.getFullYear();

          if(dd<10) {
              dd='0'+dd // format the date
          } 

          if(mm<10) {
              mm='0'+mm // format the month
          } 

          today = yyyy + '-' + mm+'-'+dd;
          el.value = today;
    }
    setDateToToday(this.currentDate);



    this.saveGoalData = function(e){
      goalInfo = {};
      goalInfo.currentWeight = this.currentWeight.value;
      goalInfo.targetWeight = this.targetWeight.value;
      goalInfo.timeDuration = this.currentDate.value;
      goalInfo.timeDuration = this.idealDate.value;
      goalInfo.user = Parse.User.current();
    }


    </script>


  <style scoped>
    :scope 

    h2{
      margin-left: 0px !important;
    }

    .weight-input-card-wide.mdl-card {
      width: 512px;
      padding-top: 20px;
          margin: 0 auto;

    }
    .weight-input-card-wide > .mdl-card__title {
      color: pink;
      height: 176px;
      background: url('http://www.coolsc.net/imguploads/Image/08new/06/zm/11/20/4/3.jpg') center / cover;
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
        padding: 5px;
        width: 11em;

    }

    input[type="number"]{
      width: 5em;
    } 

    button{
        width:20%;
        background-color: #CD5C5C !important;

    }



  </style>

</set-goal>