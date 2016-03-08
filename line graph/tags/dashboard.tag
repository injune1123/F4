<dashboard >
    <div center>
        
        <weightInput if={this.has_finished}></weightInput>

        <grid if={this.has_finished}></grid>
    </div>


    <script>
          this.has_finished = true;

    </script>


  <style scoped>
    :scope 
    h1{
      text-align : center !important;
    }



  </style>

</dashboard>