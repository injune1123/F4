<dashboard > 
    <!-- Welcome message -->
    <h3 class="text-center" >Jun's Dashboard</h3>
    <!-- goal -->

    <div class="row">
        <div class='col-md-6'>    
            
            <set-goal></set-goal>

        </div> 

        <div class='col-md-6'>    
            
            <record-weight></record-weight>

        </div>    
        
    </div>

    <div class="row">

        <div class='col-md-3'>
            <BMI></BMI>
        </div>    
        <div class='col-md-9'>
                <line></line>

        </div> 
     
    </div>

    <script>
          this.has_finished = true;
          console.log(123);
    </script>


  <style scoped>
    :scope 
    h1{
      text-align : center !important;
    }

    h3{
      color: #23527C;
    }



  </style>

</dashboard>