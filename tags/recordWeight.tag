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
    <p class="center">
      I am feeling  
        <i class="em em-astonished"></i>
        <i class="em em-angry"></i>
        <i class="em em-anguished"></i>
        <i class="em  em-blush"></i>
        <i class="em  em-grinning"></i>
        <i class="em  em-flushed"></i>
        <i class="em  em-full_moon_with_face"></i>
        <i class="em  em-mask"></i>
        <i class="em  em-satisfied"></i>
        <i class="em  em-smile"></i>
        <i class="em  em-stuck_out_tongue_winking_eye"></i>
        <i class="em  em-stuck_out_tongue_closed_eyes"></i>
        <i class="em  em-sweat"></i>


    </p>
      <textarea type="text" class="form-control" row="4" placeholder="The weather is nice, and I am doing well..."></textarea>
      <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick={saveWeightRecord}>Yeah!</button>

</div>

<style scoped>
  :scope
  #note{
    width: 50%;
    height: 50vh;
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
    setDateToToday(this.dateInput);

    this.saveWeightRecord = function(e){
      // get the info of the current user
      var currentUser = Parse.User.current();

      // get the weight log of current user
      var weightLog = [];

      // create a variable callled goalInfo and store all the information into the 
      var newRecord = {
      	date: this.dateInput.value,
      	weight: this.weightInput.value
      }

      weightLog.push(newRecord);

      // update the parese object
      
      }

</script>

</recordWeight>