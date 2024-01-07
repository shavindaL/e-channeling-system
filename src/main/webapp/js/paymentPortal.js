document.getElementById("cardType").addEventListener('input',cardType);


function cardType(){
    var filter=document.getElementById("cardType").value
    document.getElementById("cardType").setAttribute("name", filter);
    
    if(filter == "visa"){
	document.getElementById("card-logo").innerHTML = "<i class='fa-brands fa-cc-visa'></i>";
}
    else if(filter == "master"){
    	document.getElementById("card-logo").innerHTML = "<i class='fa-brands fa-cc-mastercard'></i>";
    }
    else{
		document.getElementById("card-logo").innerHTML = "<i class='fa-brands fa-cc-amex'></i>";
	}
}


