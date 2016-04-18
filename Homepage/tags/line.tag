<line>
    <div>
        <h4> Your foot print </h4>
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
            position: absolute;         
            text-align: center;         
            width: 100px;                   
            height: 28px;                   
            padding: 2px;               
            font: 12px sans-serif;      
            background: lightsteelblue; 
            border: 0px;        
            border-radius: 8px;         
            pointer-events: none;           
        }
        .area {
          fill: red;
          opacity: 1;

        }
    </style>
    <script>
 //http://bl.ocks.org/d3noob/38744a17f9c0141bcd04

        var weightLogData = [{date: new Date(2016,01,02), weight: 130},{date: new Date(2016,01,06), weight: 125},{date: new Date(2016,01,12), weight: 129},{date: new Date(2016,01,22), weight: 128},{date: new Date(2016,02,02), weight: 130},{date: new Date(2016,02,08), weight: 110}]
        var goalData = [{date: new Date(2016,01,02), weight: 130}, {date: new Date(2016,05,06), weight: 110}];

        var allDates = [];
        for ( var i = 0; i < weightLogData.length; i++){
            allDates.push(weightLogData[i].date);
        }

        for ( var i = 0; i < goalData.length; i++){
            var currentDayObj = goalData[i].date
            if ( allDates.indexOf(currentDayObj) == -1 ){
                allDates.push(currentDayObj)
            }
        }




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
        x.domain([d3.min(allDates, function(d) { return d; }) - 1000 * 60 * 60 * 24 * 2,d3.max(allDates, function(d) { return d; })]);
        y.domain([d3.min(weightLogData, function(d) { return d.weight; })-10, 20 + d3.max(weightLogData, function(d) { return d.weight; })]);

        // add the area graph
        var area = d3.svg.area()
            .x(function(d) { return x(d.date); })
            .y0(function(d) { return y(d.weight-8); })
            .y1(function(d) { return y(d.weight+8); });

        svg.append("path")
          .datum(goalData)
          .attr("class", "area")
          .attr("d", area)




        // Add the goalData path.
        svg.append("path")
            .attr("class", "line")
            .attr("d", valueline(goalData))
            .attr("stroke", "pink")
            .attr("stroke-width", 2)
            .attr("fill","none")


        // Add the scatterplot for weightGoal
        svg.selectAll("dotForGoal")
            .data(goalData)
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




            // Add the weightLogData path.
            svg.append("path")
                .attr("class", "line")
                .attr("d", valueline(weightLogData))
                .attr("stroke", "steelblue")
                .attr("stroke-width", 2)
                .attr("fill","none")



            // Add the scatterplot for weightLog
            svg.selectAll("dot")
                .data(weightLogData)
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






    </script>

</line>