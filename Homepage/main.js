
            var imagecount = 1;
            var total = 6;
                        
            // var with links and first image link is set directly in a tag
            var link1 = '#';
            var link2 = '#';
            var link3 = '#';
            var link4 = '#';
            var link5 = '#';
            var link5 = '#';
            
            function slide(x) {
                var Image = document.getElementById('img');
                var hyperLink = document.getElementById('link'); // get element method of a hyperlink having id 
                imagecount = imagecount + x;
                if(imagecount > total){ imagecount = 1;}
                if(imagecount < 1){imagecount = total;}
                Image.src = "Images/img"+ imagecount +".jpg";
                
                // compare it with imagecount and change the href attribute according to it
                if(imagecount == 1){hyperLink.href = link1;}
                if(imagecount == 2){hyperLink.href = link2;}
                if(imagecount == 3){hyperLink.href = link3;}
                if(imagecount == 4){hyperLink.href = link4;}
                if(imagecount == 5){hyperLink.href = link5;}              
                if(imagecount == 6){hyperLink.href = link6;}
            }
            
                        
         window.setInterval(function slide() {
                var Image = document.getElementById('img');
                var hyperLink = document.getElementById('link');    
                imagecount = imagecount + 1;
                if(imagecount > total){ imagecount = 1;}
                if(imagecount < 1){imagecount = total;}
                Image.src = "Images/img"+ imagecount +".jpg";
             
                if(imagecount == 1){hyperLink.href = link1;}
                if(imagecount == 2){hyperLink.href = link2;}
                if(imagecount == 3){hyperLink.href = link3;}
                if(imagecount == 4){hyperLink.href = link4;}
                if(imagecount == 5){hyperLink.href = link5;}
                if(imagecount == 6){hyperLink.href = link6;}
            },5000);