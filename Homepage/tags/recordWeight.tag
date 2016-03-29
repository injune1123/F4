<record-weight>


   <p id="Weightrecord">On  
      <input type="date" name="dateInput">
	  I weigh
	  <input type="number" name="weightInput" placeholder = "target weight (lb)">
      <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" onclick={saveWeightRecord}>Yeah!</button>
    </p>


<style>
	#Weightrecord{
		text-align: center;
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


      
		window.location.reload();
      }

</script>


recordWeight

</record-weight>