<singleFood >

	<img src={data.url} onclick={addToChosen}> 
	<div class="foodName">{data.name}</div>




<script>
	var that = this;
	that.on('update', function() {

        that.data = that.fo.toJSON();

    })

    that.addToChosen = function(e){
    	
    	chosen.foodArr.push(e.item.fo.toJSON());
    	
    }
</script>


<style scoped>
	:scope{
		display: inline-block;
		margin:10px;
	}

	img{
		width:100px;
		height:100px;
	}


</style>



</singleFood>