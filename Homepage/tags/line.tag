<line>
    <div>
        <h4> {line} </h4>

         <div id="graph" class="aGraph"></div>




    </div>




  <style scoped>
    :scope 

    /* tell the SVG path to be a thin blue line without any area fill */
    svg{
        background-color: white;
        margin: 0 10%
    }

    path {
        stroke: steelblue;
        stroke-width: 1;
        fill: none;
    }
    
    .axis {
        shape-rendering: crispEdges;
    }
    
    .x.axis line {
        stroke: lightgrey;
    }
    
    .x.axis .minor {
        stroke-opacity: .5;
    }
    
    .x.axis path {
        display: none;
    }
    
    .y.axis line,
    .y.axis path {
        fill: none;
        stroke: #000;
    }
    </style>


    <script>
    /* implementation heavily influenced by http://bl.ocks.org/1166403 */
    
    this.on('updated', function(){

    // define dimensions of graph
    var m = [80, 80, 80, 80]; // margins
    var w = 1000 - m[1] - m[3]; // width
    var h = 400 - m[0] - m[2]; // height

    // create a simple data array that we'll plot with a line (this array represents only the Y values, X will just be the index location)
    var data = [120,110];
    // X scale will fit all values from data[] within pixels 0-w
    var x = d3.scale.linear().domain([0, 12]).range([0, w]);
    // Y scale will fit values from 0-10 within pixels h-0 (Note the inverted domain for the y-scale: bigger is up!)
    var y = d3.scale.linear().domain([110, 120]).range([h, 0]);
    // automatically determining max range can work something like this
    // var y = d3.scale.linear().domain([0, d3.max(data)]).range([h, 0]);
    // create a line function that can convert data[] into x and y points
    var line = d3.svg.line()
    // assign the X function to plot our line as we wish
    .x(function(d,i) {

        if (i==0){
            return 0;
        }
        else if( i==1 ){
            return w
        }
    // verbose logging to show what's actually being done
    console.log('Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.');
    // return the X coordinate where we want to plot this datapoint
    return x(i);
    })
    .y(function(d) {
    // verbose logging to show what's actually being done
    console.log('Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + " using our yScale.");
    // return the Y coordinate where we want to plot this datapoint
    return y(d);
    })
    // Add an SVG element with the desired dimensions and margin.
    var graph = d3.select("#graph").append("svg:svg")
    .attr("width", w + m[1] + m[3])
    .attr("height", h + m[0] + m[2])
    .append("svg:g")
    .attr("transform", "translate(" + m[3] + "," + m[0] + ")");
    // create yAxis
    var xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true);
    // Add the x-axis.
    graph.append("svg:g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + h + ")")
    .call(xAxis);
    // create left yAxis
    var yAxisLeft = d3.svg.axis().scale(y).ticks(4).orient("left");
    // Add the y-axis to the left
    graph.append("svg:g")
    .attr("class", "y axis")
    .attr("transform", "translate(-25,0)")
    .call(yAxisLeft);

    // Add the line by appending an svg:path element with the data line we created above
    // do this AFTER the axes above so that the line is above the tick-lines
    graph.append("svg:path").attr("d", line(data));
    });






    // Set the dimensions of the canvas / graph
    var margin = {top: 30, right: 20, bottom: 30, left: 50},
    width = 600 - margin.left - margin.right,
    height = 270 - margin.top - margin.bottom;

    // Parse the date / time
    var parseDate = d3.time.format("%d-%b-%y").parse;

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
    .y(function(d) { return y(d.close); });

   

    </script>

</line>