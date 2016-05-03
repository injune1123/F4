<record>
	<h1 id="dashboard-title">RECORD TO SEE YOUR PROGRESS</h1>
   <p id="Weightrecord">
    On <input type="date" name="dateInput" if= {!displayRecord} onChange={changeDateRecord}> <span if= {displayRecord}>{recordDate}</span>
    ,  &nbsp I am <input type="number" name="weightInput" placeholder = "target weight (lb)" if= {!displayRecord}> <span if= {displayRecord}>{recordWeight} lb</span> 
  <i class="fa fa-pencil" aria-hidden="true" onclick={editWeightRecord}  if= {displayRecord}></i>
<i class="fa fa-check-circle-o" aria-hidden="true" onclick={saveWeightRecord}  if= {!displayRecord}></i>
  
  </p>
  <div class="row">
    <div class='col-md-3'>
        <BMI></BMI>
    </div>
    <div class='col-md-9'>

    <line></line> 
    <p class="center">Body Weight History</p>   
    </div>
  </div> 


  <div id="FitnessDiary">
  <div id="FitnessDiaryContent">
  <p class="center" id="emojiRecord" if= {displayRecord}>
    <br>
    I am feeling <i class={"em em-" + emoji }></i>
  </p>
  <p class="center" if= {!displayRecord}>
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
  <textarea name="textArea" type="text" class="form-control" row="4" placeholder="I am working hard, and I will keep doing it..."  if = {!displayRecord}></textarea>
  
  <p class= "center" id="dailyMoodRecord" if={displayRecord}>{textAreaValue}</p>

  <!-- validate message -->
  <p if={validatedInfoShow} class="center blue"> Have you selected date, entered weight, and checked the emoji?
  </p>

  <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick={saveWeightRecord}  if= {!displayRecord}>Yeah!</button>
  <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick={editWeightRecord}  if= {displayRecord}>Edit</button>
  </div>
</div>

<style scoped>
  :scope{
    background-color: #f3f3f3;
    height:120vh;
    padding-left:5%;
    padding-right:5%;
    padding-top: 1.5%
  }
  #dashboard-title{
    font-size: 24px;
    text-align: left !important;
    font-weight: 600;
  }
  .fa-check-circle-o{
    font-size:24px;
    cursor:pointer
  }
  .fa-check-circle-o:hover{
    color:#f94283
  }





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


  .center{
    text-align:center
  }

  textarea{
    width: 80% !important;
    margin: auto !important;
  }



	#Weightrecord, h2{
		text-align: left;
    padding-bottom: 10px; 
    height: 30px;
    margin-bottom: 20px;
	}

  #Weightrecord{
        font-weight: 600;

  }

  #Weightrecord > span{
    font-size: 14px;
    font-weight: 500;
    padding-left: 5px;
  }


  #FitnessDiary{
    margin-top:2%;
    width: 95%;
    margin-right: 5%;
    background-color: white;
    height: 30%;
  }

  #FitnessDiaryContent{
    padding-top: 5% 
  }
  .mdl-button--accent.mdl-button--accent.mdl-button--raised, .mdl-button--accent.mdl-button--accent.mdl-button--fab{
    margin: 10 auto;
    display: block;
  }  
  .blue{
    color: steelblue;
  }

  #emojiRecord>i{
    font-size: 40px;
  }

  #dailyMoodRecord{
    text-decoration: underline;
  }

</style>

    <script>

    var that = this;
    // this controls whether we should show the edit ot the display view of the weight log
    // set the date of the input box with a name of currentDate
    setDateToToday(that.dateInput);
    

    that.displayRecord = false;
    that.validatedInfoShow = false;
    // get the info of the current user
    var currentUser = Parse.User.current();
    var allWeightLog = currentUser.get('weightLog');
          // check whether weight log exists
    if (currentUser.get('weightLog')===undefined){
        var weightLog = [];
    } else{
        var weightLog = currentUser.get('weightLog');
    }
    //check whether target data exsits

    function checkDateExistsAndDisplay (targetDate) {
          for (var i = 0; i < weightLog.length; i++){
              if(weightLog[i].date == targetDate){
                that.displayRecord = true;
                that.recordWeight = weightLog[i].weight;
                that.emoji = weightLog[i].emojiValue;
                that.recordDate = targetDate;
                that.textAreaValue = weightLog[i].textAreaValue;
              }
          }
        }
    function checkDateExistsAndDisplayEdit (targetDate) {
          for (var i = 0; i < weightLog.length; i++){
              if(weightLog[i].date == targetDate){
                that.weightInput.value = weightLog[i].weight;
                document.querySelector('input[value='+ weightLog[i].emojiValue+']').checked = true;
                that.textArea.value = weightLog[i].textAreaValue;
                return
              }
          }
          that.weightInput.value = "";
          that.textArea.value = "";
          if (document.querySelector('input[name="emoji"]:checked')){
            document.querySelector('input[name="emoji"]:checked').checked = false;
          }
    }

    //check whether today's data exsits
    var todayObj = {};
    setDateToToday(todayObj);
    checkDateExistsAndDisplay(todayObj.value)
    


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


    that.changeDateRecord = function(){
      checkDateExistsAndDisplayEdit(that.dateInput.value)
      that.update();
    }
    that.editWeightRecord = function(e){

        for (var i = 0; i < weightLog.length; i++){
              if(weightLog[i].date == that.dateInput.value){
                that.displayRecord = false;
                that.update();
                that.weightInput.value = weightLog[i].weight;
                document.querySelector('input[value='+ weightLog[i].emojiValue+']').checked = true;
                that.textArea.value = weightLog[i].textAreaValue;

              }
          }
    }
    that.saveWeightRecord = function(e){

    // check the user input fields
    if (!document.querySelector('input[name="emoji"]:checked') || !this.weightInput.value || !this.dateInput.value){
        that.validatedInfoShow =  true;
      } else{
        that.validatedInfoShow =  false;


      //check whether the date record already exists
      var dateRecordAlreadyExist = false;

        for (var i = 0; i < weightLog.length; i++){
              if(weightLog[i].date == this.dateInput.value){
                // change the existent date record
                weightLog[i].weight = that.weightInput.value;
                 weightLog[i].emojiValue = document.querySelector('input[name="emoji"]:checked').value;
                weightLog[i].textAreaValue = that.textArea.value;
                 dateRecordAlreadyExist = true;
              }
        }

        if (!dateRecordAlreadyExist){
          // create a variable called newRecord and store all the information into the 
          var newRecord = {
            date: that.dateInput.value,
            weight: that.weightInput.value,
            emojiValue: document.querySelector('input[name="emoji"]:checked').value,
            textAreaValue: that.textArea.value
          }

          weightLog.push(newRecord);
          // sort the dates
          weightLog.sort(function(a,b){
            return new Date (b.date) - new Date(a.date)
          })


        }


      currentUser.set('weightLog',weightLog);
      
      currentUser.save(null, {
        success: function(user) {
          // Execute any logic that should take place after the object is saved.
          // alert('New object created with objectId: ' + gameScore.id);
          // console.log("success")
          that.displayRecord = true;
          that.recordWeight = that.weightInput.value;
          that.emoji = document.querySelector('input[name="emoji"]:checked').value;
          that.recordDate = that.dateInput.value;
          that.textAreaValue = that.textArea.value;
          // riot.mount('#Mount-dashboard','record');
          // mounts custom tag "my-tag" to div#main and pass api as options
          riot.mount('line')
          riot.mount('BMI')

          that.update();

        },
        error: function(user, error) {
          // Execute any logic that should take place if the save fails.
          // error is a Parse.Error with an error code and message.
          // alert('Failed to create new object, with error code: ' + error.message);
        }
      });

      }


    }

</script> 

</record>