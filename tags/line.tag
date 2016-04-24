<line>
    <div>
        <div id="graph"></div>
    </div>

    <style scoped>
    :scope 
        .axis path,
        .axis line {
            fill: none;
            stroke: grey;
            stroke-width: 3;
            shape-rendering: crispEdges;
        }
        div.tooltip {   
            text-align: center;         
            width: 100px;                   
            height: 28px;                   
            padding: 2px;               
            font: 12px sans-serif;      
            background: lightsteelblue; 
            border: 0px;        
            border-radius: 8px;         
            pointer-events: none; 
            margin-left: -250px;          
            margin-top: -50px;          
        }
        .area {
          fill: red;
          opacity: 1;

        }
    </style>
    <script>
 //http://bl.ocks.org/d3noob/38744a17f9c0141bcd04

        var currentUser = Parse.User.current();
        
        // get goal data
        var goalInfo = {};
        goalInfo.date = currentUser.get("Goal").date;
        goalInfo.weight =  currentUser.get("Goal").weight;

        var initialInfo = {};
        initialInfo.weight = currentUser.get("initialWeight").weight;

        var intialWeightRecordDate = currentUser.get("initialWeight").date;
        if (typeof(intialWeightRecordDate) == "string" ){
            initialInfo.date = intialWeightRecordDate.substring(0,10);
        } else if (typeof(intialWeightRecordDate) == "object" ){

          var dd = intialWeightRecordDate.getDate();
          var mm = intialWeightRecordDate.getMonth()+1; //January is 0!
          var yyyy = intialWeightRecordDate.getFullYear();

          if(dd<10) { dd='0'+dd} // format the date 
          if(mm<10) {mm='0'+mm}  // format the month

          initialInfo.date = yyyy + '-' + mm+'-'+dd;
        }
        var goalData =[];
        goalData.push(initialInfo);
        goalData.push(goalInfo);

        //http://stackoverflow.com/questions/7556591/javascript-date-object-always-one-day-off

        var goalDataForD3 = goalData.map(function(dateWeightObj){
            var dateWeightObjForD3 = {};
            dateWeightObjForD3.date = new Date( 
                (new Date (dateWeightObj.date)).getTime() +
                (new Date (dateWeightObj.date)).getTimezoneOffset()*60000);
            dateWeightObjForD3.weight = +dateWeightObj.weight
            return dateWeightObjForD3;
        })


        var weightLogData = currentUser.get("weightLog");
        if(!weightLogData){
            weightLogData = [];
            weightLogDataForD3 = [];
        } else{
        var weightLogDataForD3 = weightLogData.map(function(dateWeightObj){
            var dateWeightObjForD3 = {};
            dateWeightObjForD3.date = new Date( 
                (new Date (dateWeightObj.date)).getTime() +
                (new Date (dateWeightObj.date)).getTimezoneOffset()*60000);
            dateWeightObjForD3.weight = +dateWeightObj.weight
            return dateWeightObjForD3;       
        })

        }


        var allDatesForD3 = [];
        for ( var i = 0; i < weightLogDataForD3.length; i++){
            allDatesForD3.push(weightLogDataForD3[i].date);
        }

        for ( var i = 0; i < goalDataForD3.length; i++){
            var currentDayObj = goalDataForD3[i].date
            if ( allDatesForD3.indexOf(currentDayObj) == -1 ){
                allDatesForD3.push(currentDayObj)
            }
        }


        console.log(allDatesForD3)
        var allDataForD3 = weightLogDataForD3;
        allDataForD3.push(goalDataForD3[0])
        allDataForD3.push(goalDataForD3[1])

        console.log(goalDataForD3, weightLogDataForD3, allDataForD3, allDatesForD3)
        
        this.on('updated', function(){
            d3.select("svg").remove();

            // Set the dimensions of the canvas / graph
            var margin = {top: 30, right: 20, bottom: 30, left: 50},
                width = 600 - margin.left - margin.right,
                height = 270 - margin.top - margin.bottom;


            // Set the ranges
            var x = d3.time.scale().range([0, width]);
            var y = d3.scale.linear().range([height, 0]);

            // Define the axes
            var xAxis = d3.svg.axis().scale(x)
                .orient("bottom").ticks(5);

            var yAxis = d3.svg.axis().scale(y)
                .orient("left").ticks(5);

            // Define the line
            var valueline = d3.svg.line()
                .x(function(d) { return x(d.date); })
                .y(function(d) { return y(d.weight); });
               

            // Define the div for the tooltip
            var div = d3.select("#graph").append("div")   
                .attr("class", "tooltip")               
                .style("opacity", 0);

            // Adds the svg canvas
            var svg = d3.select("#graph")
                .append("svg")
                    .attr("width", width + margin.left + margin.right)
                    .attr("height", height + margin.top + margin.bottom)
                .append("g")
                    .attr("transform", 
                          "translate(" + margin.left + "," + margin.top + ")");



            // Scale the range of the data
             // current date's milliseconds - 1,000 ms * 60 s * 60 mins * 24 hrs * (# of days beyond one to go back)
            x.domain([d3.min(allDatesForD3, function(d) { return d; }) - 1000 * 60 * 60 * 24 * 2,d3.max(allDatesForD3, function(d) { return d; })]);
            y.domain([d3.min(allDataForD3, function(d) { return d.weight; })-10, 20 + d3.max(allDataForD3, function(d) { return d.weight; })]);

            // add the area graph
            var area = d3.svg.area()
                .x(function(d) { return x(d.date); })
                .y0(function(d) { return y(d.weight-8); })
                .y1(function(d) { return y(d.weight+8); });

            svg.append("path")
              .datum(goalDataForD3)
              .attr("class", "area")
              .attr("d", area)




            // Add the goalDataForD3 path.
            svg.append("path")
                .attr("class", "line")
                .attr("d", valueline(goalDataForD3))
                .attr("stroke", "pink")
                .attr("stroke-width", 2)
                .attr("fill","none")


            // Add the scatterplot for weightGoal
            svg.selectAll("dotForGoal")
                .data(goalDataForD3)
                .enter()
                .append("circle")
                .attr("r", 4)
                .attr("cx", function(d) { return x(d.date); })
                .attr("cy", function(d) { return y(d.weight); })
                .style("fill", "pink")
                .on("mouseover", function(d) {      
                        div.transition()        
                            .duration(200)      
                            .style("opacity", .9);      
                        div .html(showDateText(d.date) + "<br/>"  + d.weight + " lb")  
                            .style("left", (d3.event.pageX) + "px")     
                            .style("top", (d3.event.pageY - 28) + "px"); 
                        d3.select(this).attr("r", 6).style("fill", "green");
                        })                  
                .on("mouseout", function(d) {       
                        div.transition()        
                            .duration(500)      
                            .style("opacity", 0);
                        d3.select(this).attr("r", 4).style("fill", "pink");
                });




            // Add the weightLogDataForD3 path.
            svg.append("path")
                .attr("class", "line")
                .attr("d", valueline(weightLogDataForD3))
                .attr("stroke", "steelblue")
                .attr("stroke-width", 2)
                .attr("fill","none")



            // Add the scatterplot for weightLog
            svg.selectAll("dot")
                .data(weightLogDataForD3)
                .enter()
                .append("circle")
                .attr("r", 3.5)
                .attr("cx", function(d) { return x(d.date); })
                .attr("cy", function(d) { return y(d.weight); })
                .attr("r", 4).style("fill", "black")
                .on("mouseover", function(d) {      
                        div.transition()        
                            .duration(200)      
                            .style("opacity", .9);      
                        div .html(showDateText(d.date) + "<br/>"  + d.weight + " lb")  
                            .style("left", (d3.event.pageX) + "px")     
                            .style("top", (d3.event.pageY - 28) + "px"); 
                        d3.select(this).attr("r", 6).style("fill", "#D36117");
                        })                  
                .on("mouseout", function(d) {       
                        div.transition()        
                            .duration(500)      
                            .style("opacity", 0);
                        d3.select(this).attr("r", 4).style("fill", "black");
               
                });

            //helper function to display date
            function showDateText (dateObj){
                var monthNames = [
                  "Jan", "Feb", "Mar",
                  "Apr", "May", "Jun", "Jul",
                  "Aug", "Sep", "Oct",
                  "Nov", "Dec"
                ];

                var day = dateObj.getDate();
                var monthIndex = dateObj.getMonth();
                var year = dateObj.getFullYear();

               return (year+"-"+monthNames[monthIndex]+"-"+day);

            }




            // Add the X Axis
            svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis);

            // Add the Y Axis
            svg.append("g")
                .attr("class", "y axis")
                .call(yAxis);


        })

    </script>

</line>