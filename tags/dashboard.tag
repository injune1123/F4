<dashboard > 

<!-- No header, and the drawer stays open on larger screens (fixed drawer). -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-drawer">
<!-- Side nav bar -->
  <div class="mdl-layout__drawer">
    <nav class="mdl-navigation">
      <a class="mdl-navigation__link" href="" onclick={showCalculator}>
        <i class="material-icons mdl-list__item-avatar color-set-blue">exposure</i>
        <span>Calculate  </span>
      </a>
      <a class="mdl-navigation__link" href=""  onclick={showWeightTrack}>
        <i class="material-icons mdl-list__item-avatar color-set-peach">create</i>
        <span>Record </span>
      </a>
      <a class="mdl-navigation__link" href="" onclick={showInfo}>
        <i class="material-icons mdl-list__item-avatar">sentiment_satisfied</i>
        <span>Profile  </span>
      </a>
    </nav>
  </div>

  <main class="mdl-layout__content">
    <div class="page-content" id="Mount-dashboard" >
        <div class="row instruction">
          <div class="col-sm-4"><img src="Images/instruction/both1.png" alt="" onclick={showCalculator}></div>
          <div class="col-sm-4"><img src="Images/instruction/both2.png" alt="" onclick={showWeightTrack}></div>
          <div class="col-sm-4"><img src="Images/instruction/both3.png" alt="" onclick={showWeightTrack}></div>
        </div>
        
    </div>
  </main>
</div>


    <script>
          var that = this;
          
          that.showWeightTrack = function(e){
            riot.mount('#Mount-dashboard','record');
          }

          that.showInfo = function(e){
            riot.mount('#Mount-dashboard','personal')
          }

          that.showCalculator = function(e){
            riot.mount('#Mount-dashboard','calorie')
          }


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

    .color-set-green{
      background-color: #9FDC80;
      color:white;
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

    .instruction img{
      width:260px;
      margin:50px 0px 0px 20px;
    } 
    
    .instruction img:hover{
      cursor: pointer;
    }



  </style>

</dashboard>