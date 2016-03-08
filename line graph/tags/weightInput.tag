<weightInput>
    <div>
        <div class="weight-input-card-wide mdl-card mdl-shadow--2dp center">
          <div class="mdl-card__title">
            <h2 class="mdl-card__title-text"><b>See up your goal</b></h2>
          </div>

          <div class="mdl-card__supporting-text">
            <p>Desire is the key to motivation.</p>
            <p>Enter your current wieight, target weight, and time duration.</p>
          </div>

          <div class="mdl-card__actions mdl-card--border">
            <label for="currentWeight"> Current Weight : </label>
            <input type="text" name="currentWeight" placeholder = "current weight">
            <br>
            <br>


            <label for="targetWeight"> target Weight : </label>
            <input type="text" name="targetWeight" placeholder = "target weight">
            <br>
            <br>

            <label for="targetWeight"> Time duration : </label>
            <input type="text" placeholder = "time you have">
            <br>
            <br>
             <!-- Accent-colored raised button with ripple -->
            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
              Go!
            </button>
          </div>
        </div>
    </div>


  <style scoped>
    :scope 

    .weight-input-card-wide.mdl-card {
      width: 512px;
      padding-top: 20px
    }
    .weight-input-card-wide > .mdl-card__title {
      color: #33691E;
      height: 176px;
      background: url('http://tw.becuber.com/attachment/201203/29/64_13330370169arA.jpg') center / cover;
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
    }

    button{
        width:20%;
        background-color: #CD5C5C !important;

    }

      .center{
    margin-left: 30%; 
  }


  </style>


    <script>
        this.title = "Your dashboard"
    </script>
</weightInput>