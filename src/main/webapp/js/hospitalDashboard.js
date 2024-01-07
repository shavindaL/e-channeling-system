window.addEventListener("load", setTime);
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);


function setTime() {
    var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();

	today = yyyy + '-' + mm + '-' + dd;

    
    console.log(today);
    document.getElementById("date").innerHTML = today;
}


function drawChart() {
    var data = google.visualization.arrayToDataTable([
    ['Task', 'Appointments'],
    ['Active', 8],
    ['Completed', 2],
    ['Canceled', 2]
  ]);

    // Optional; add a title and set the width and height of the chart
    var options = {'title':'Appointments', 'width':500, 'height':200};

    // Display the chart inside the <div> element with id="piechart"
    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    chart.draw(data, options);
  }
