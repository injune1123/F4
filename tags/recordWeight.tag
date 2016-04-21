<recordWeight>

<div id="note">
    <h2>My Fitness Diary</h2>
    <br/>
    <br/>
   <p id="Weightrecord">On 
      <input type="date" name="dateInput">
	  I weigh
	  <input type="number" name="weightInput" placeholder = "target weight (lb)">
    </p>
    <br/>
    <p class="center">
      I am feeling  
      <label>
        <input type="radio" name="emoji" value="astonished" />
        <i class="em em-astonished"></i>
      </label>  
      <label>
        <input type="radio" name="emoji" value="angry" />
        <i class="em em-angry"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="anguished" />
        <i class="em em-anguished"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="blush" />
        <i class="em  em-blush"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="grinning" />
        <i class="em  em-grinning"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="flushed" />
        <i class="em  em-flushed"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="full_moon_with_face" />
        <i class="em  em-full_moon_with_face"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="mask" />
        <i class="em  em-mask"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="satisfied" />
        <i class="em  em-satisfied"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="smile" />
        <i class="em  em-smile"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="stuck_out_tongue_winking_eye" />
        <i class="em  em-stuck_out_tongue_winking_eye"></i>
      </label>
      <label>
        <input type="radio" name="emoji" value="em-stuck_out_tongue_closed_eyes" />
        <i class="em  em-stuck_out_tongue_closed_eyes"></i>
      </label>        
      <label>
        <input type="radio" name="emoji" value="sweat" />
          <i class="em  em-sweat"></i>
      </label>


    </p>
      <textarea name="textArea" type="text" class="form-control" row="4" placeholder="I am working hard, and I will keep doing it..."></textarea>
      <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick={saveWeightRecord}>Yeah!</button>

</div>

<style scoped>
  :scope
  label > input{ /* HIDE RADIO */
    visibility: hidden; /* Makes input not-clickable */
    position: absolute; /* Remove input from document flow */
  }
  label > input + i{ /* IMAGE STYLES */
    cursor:pointer;
    border:2px solid transparent;
  }

  label > input:checked + i{ /* (RADIO CHECKED) IMAGE STYLES */
    border:2px solid blue;
    font-size: 30px;
  }

  #note{
    width: 50%;
    height: 70vh;
    margin: 0 auto;
  }
  .center{
    text-align:center
  }

  textarea{
    width: 80% !important;
    margin: auto !important;
  }

	#Weightrecord, h2{
		text-align: center;
	}
  #note{
    background-image: url("../Images/noteBook.png");
    background-size: cover;
  }
  .mdl-button--accent.mdl-button--accent.mdl-button--raised, .mdl-button--accent.mdl-button--accent.mdl-button--fab{
    margin: 10 auto;
    display: block;
  }  


</style>

    <script>

    var that = this;
    // this is the helper function that helps to set the date to current date
    function setDateToToday (el) {
          var today = new Date();
          var dd = today.getDate();
          var mm = today.getMonth()+1; //January is 0!
          var yyyy = today.getFullYear();

          if(dd<10) { dd='0'+dd} // format the date 
          if(mm<10) {mm='0'+mm}  // format the month

          today = yyyy + '-' + mm+'-'+dd;
          el.value = today;
    }

    // set the date of the input box with a name of currentDate
    setDateToToday(that.dateInput);

    this.saveWeightRecord = function(e){
      // get the info of the current user
      var currentUser = Parse.User.current();

      // check whether weight log exists
      if (currentUser.get('weightLog')===undefined){
        var weightLog = [];
      } else{
        var weightLog = currentUser.get('weightLog');
      }

      // create a variable called newRecord and store all the information into the 
      var newRecord = {
        date: this.dateInput.value,
        weight: this.weightInput.value,
        emojiValue: document.querySelector('input[name="emoji"]:checked').value,
        textAreaValue: that.textArea.value
      }

      weightLog.push(newRecord);

      currentUser.set('weightLog',weightLog);
      
      currentUser.save(null, {
        success: function(user) {
          // Execute any logic that should take place after the object is saved.
          // alert('New object created with objectId: ' + gameScore.id);
        },
        error: function(user, error) {
          // Execute any logic that should take place if the save fails.
          // error is a Parse.Error with an error code and message.
          // alert('Failed to create new object, with error code: ' + error.message);
        }
      });


    }

</script>

</recordWeight>