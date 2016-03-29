<dashboard > 

<!-- No header, and the drawer stays open on larger screens (fixed drawer). -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer">
  <div class="mdl-layout__drawer">
    <nav class="mdl-navigation">

      <a class="mdl-navigation__link" href="">
        <i class="material-icons mdl-list__item-avatar color-set-peach">create</i>
        <span>Record  weight</span>

      </a>
      <a class="mdl-navigation__link" href="#calorieCal">

        <i class="material-icons mdl-list__item-avatar color-set-blue">exposure</i>
        <span>Calculate  Carolie</span>
      </a>

      
    </nav>
  </div>
  <main class="mdl-layout__content">
    <div class="page-content">
    <!--  content goes here -->

    <h3 class="text-center " > Dashboard</h3>


      <div class='col-md-3'>
            <BMI></BMI>
        </div>  
    <div class="row">

    
                <line></line>

     
    </div> 


    </div>
  </main>
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
    side-nav{
        position: fixed;
    }
    .mdl-layout--fixed-drawer{
        margin-top: -5px;
    }
    .mdl-layout__drawer{
        width: 280px;
    }



    .mdl-list__item-avatar, .mdl-list__item-avatar.material-icons {

    font-size: 38px;
    margin-left: -15px;
    height: 50px;
    width: 50px;
    text-align: center;
    }
    span{
        font-size: 20px
    }

    .color-set-peach{

    background-color: #FFCCB9;
    color:#EC1460;


    }

    .color-set-blue{
    background-color:#00BBD6;
    color: #A0F4FF;
    }

    .material-icons{
        padding-top:5px;
    }

    a {
    text-decoration: none;
    }

    .mdl-layout__drawer .mdl-navigation .mdl-navigation__link:hover {
    background-color: transparent;
}




  </style>

</dashboard>