<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import= "javax.servlet.http.HttpSession" %>    
    
<%

	String apptId = request.getParameter("apptId");
	String date = request.getParameter("date");
	String sTime = request.getParameter("startTime");
	String eTime = request.getParameter("endTime");
	String hosName = request.getParameter("hosName");
	String location = request.getParameter("location");
	String docName = request.getParameter("docName");
	String dSpecial = request.getParameter("dSpecial");
	
	if(apptId == null){
		System.out.println("ApptId Not Found");
	    
		String redirectURL = "patient_newAppointment.jsp";
	    response.sendRedirect(redirectURL);
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medic</title>
    <!-- ================================================ Google Fonts ================================================================== -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet">

    <!-- ================================================ Bootstrap ================================================================== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- ================================================ Font Awsome ================================================================== -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <!-- ================================================ Custom CSS ================================================================== -->
    <link rel="Stylesheet" href="styles/header.css" />
    <link rel="Stylesheet" href="styles/home page.css" />
    <link rel="Stylesheet" href="styles/footer.css" />
    <link rel="Stylesheet" href="styles/counter.css" />
    <link rel="Stylesheet" href="styles/searchbar.css" />
    <link rel="stylesheet" href="styles/sidebar.css">  
    <link rel="stylesheet" href="styles/paymentPortal.css">
  </head>

  <body>
    <div id="head">
      <header>
        <img class="logo" src="images/Medic logo.png" alt="logo">

        <nav class="navi">
          <a href="#" class="navi-item is-active" active-color="rgba(0, 56, 255, 1)">HOME</a>
          <a href="#" class="navi-item" active-color="rgba(0, 56, 255, 1)">Doctor's near you</a>
          <a href="#" id="covidnews" class="navi-item" active-color="rgba(0, 56, 255, 1)">Covid19<span
              class="dot"></span></a>
          <span class="navi-indicator"></span>
        </nav>
        <a class="cta" href="signin.html">
          <button id="signup">Sign in</button></a>
      </header>
    </div>

    <main>
      <div class="row">
        <div class="col-2 sidebar">
          <img class="nav logo-side" src="images/Medic logo.png" alt="logo">
          <ul class="nav flex-column nav-pills">
            <li class="nav-item ">
              <a class="nav-link sidebar-link" href="hospital_Dashboard.jsp"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle active sidebar-link" data-bs-toggle="dropdown" href=""><i
                  class="fa-solid fa-calendar-check"></i></i> Appointment</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="patient_createNewAppointment.jsp">New Appointment</a></li>
                <li><a class="dropdown-item" href="updateAppointment.jsp">Update Appointment</a></li>
                <li><a class="dropdown-item" href="appointmentHistory.jsp">History</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link sidebar-link" href="_Profile.html"><i class="fa-solid fa-user"></i> Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link sidebar-link logout-btn" href=""><i class="fa-solid fa-arrow-right-from-bracket"></i>
                Logout</a>
            </li>
          </ul>
        </div>
      </div>
    <div class="region-main">
      <div class="row formArea">
        <h1>Payment Portal</h1>           
        <form class="row g-3" method="post"  action="makeAppointment"> 
              	
              	<h3>Appointment Information</h3>
              	<div class="col-md-3">        			
            		<label class="form-label">Appointment ID</label>
           			<input type="text" class="form-control" id="apptId" name="apptId" value ='<%=apptId %>' readonly>
         		</div>
         		<div class="col-md-3">        			
            		<label class="form-label">Date</label>
           			<input type="text" class="form-control" id="date" name="date" value = '<%=date %>' readonly>
         		</div>
         		<div class="col-md-3">        			
            		<label class="form-label">Start Time</label>
           			<input type="text" class="form-control" id="sTime" name="sTime" value ='<%=sTime %>' readonly>
         		</div>
         		<div class="col-md-3">        			
            		<label class="form-label">End Time</label>
           			<input type="text" class="form-control" id="eTime" name="eTime" value ='<%=eTime %>' readonly>
         		</div>
         		<div class="col-md-3">        			
            		<label class="form-label">Hospital Name</label>
           			<input type="text" class="form-control" id="hosName" name="hosName" value ='<%=hosName %>' readonly>
         		</div>
         		<div class="col-md-3">        			
            		<label class="form-label">Location</label>
           			<input type="text" class="form-control" id="location" name="location" value ='<%=location %>' readonly>
         		</div>
         		<div class="col-md-3">        			
            		<label class="form-label">Doctor Name</label>
           			<input type="text" class="form-control" id="docName" name="docName" value = '<%=docName %>' readonly>
         		</div>
         		<div class="col-md-3">        			
            		<label class="form-label">Specialization</label>
           			<input type="text" class="form-control" id="special" name="special" value = '<%=dSpecial %>' readonly>
         		</div>
              	
              	<h3>Payment Information</h3>
        		<div class="col-md-3">        			
            		<label for="cvc" class="form-label">Hospital Fees</label>
           			<input type="text" class="form-control" id="hosCharge" value ="1000.00" readonly>
         		</div>
         		<div class="col-md-3">
          			<label for="cvc" class="form-label">Doctor Fees</label>
           			<input type="text" class="form-control" id="docFee" value ="2000.00" readonly>
          		</div>
        		<div class="col-md-3">
            		<label for="cvc" class="form-label">Other Fees</label>
           			<input type="text" class="form-control" id="otherFees" value ="500.00" readonly>
        		</div>
        		<div class="col-md-3">
           			<label for="cvc" class="form-label">Total Amount</label>
           			<input type="text" class="form-control" id="totalAmount" name="total" value ="3500.00" readonly>
          		</div>
          		<div class="col-md-3">
            <label for="cardSelect" class="form-label">Card Type</label>
            <select class="form-select" id="cardType" name="cardtype" required>
              <option selected disabled value="choose">Choose...</option>
              <option value="visa" name="cardtype">VISA</option>
              <option value="master" name="cardtype">MasterCard</option>
              <option value="amex" name="cardtype">American Express</option>
            </select>
          </div>
          <div class="col-3">
          <label for="cvc" class="form-label card-text">Card Number</label>
          <div class="input-group mb-3">
  			<span class="input-group-text" id="card-logo"><i class="fa-solid fa-credit-card"></i></span>
  			<input type="text" class="form-control" id="card-num"  pattern="[0-9]{16}" maxlength="16" placeholder="XXXX XXXX XXXX XXXX" required>
		</div>
		</div>
          <div class="col-md-3">
            <label for="cvc" class="form-label">CVC</label>
            <input type="text" class="form-control" id="cvc" maxlength="3" required>
          </div>
          <div class="col-md-3">
            <label for="Expire Date" class="form-label">Expire Date</label>
            <input type="text" class="form-control" id="expireDate" placeholder="YY-mm" required>
          </div>
          <div class="col-md-6">
             <button class="btn btn-primary" type="submit"><i class="fa-solid fa-credit-card"></i> Pay Now</button>
          </div>
		</form>
      </div>
    </div>
  </main>

  <!-- ================================================ Bootstrap ================================================================== -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <!-- ================================================ JQUERY ================================================================== -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

  <!-- Chart API -->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <!-- ================================================ Custom JAVASCRIPT ================================================================== -->
  <script type="text/javascript" src="js\home page.js"></script>
  <script type="text/javascript" src="js\paymentPortal.js"></script>


  <!-- header script -->
  <script src="js/home page.js"></script>

  <!-- scroll script -->
  <script src="js/scroll-out.js"></script>
  <script type="text/javascript">
    ScrollOut({
      targets: "#r1c2a,.r1c2,.r1c1,img,h1,h2,h3,h4,p,a,ul,.searchbtn1",
    });
  </script>

</body>

</html>
    