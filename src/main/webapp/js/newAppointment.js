document.getElementById("endTime").addEventListener('input',chkDateDifference);

function chkDateDifference(){
	var startTime = document.getElementById("startTime").value;
	var endTime = document.getElementById("endTime").value;
	
	const d = new Date();
	var sTime = d.getTime(startTime);
	var eTime = d.getTime(endTime);
	
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0');
	var yyyy = today.getFullYear(); 

		today = sTime;
		var today1 = eTime;
	
		var diff = today - today1;
	
	//diff = eTime.diff(sTime, 'hours');
	
	console.log(today1);
	console.log(today);
	console.log(diff);
}