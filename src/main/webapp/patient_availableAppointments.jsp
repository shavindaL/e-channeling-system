<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "javax.servlet.http.HttpSession" %>    
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <!-- ================================================ Font Awesome ================================================================== -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

  <!-- ================================================ Custom CSS ================================================================== -->
  <link rel="Stylesheet" href="styles/header.css" />
  <link rel="Stylesheet" href="styles/home page.css" />
  <link rel="Stylesheet" href="styles/footer.css" />
  <link rel="Stylesheet" href="styles/counter.css" />
  <link rel="Stylesheet" href="styles/searchbar.css" />
  <link rel="stylesheet" href="styles/sidebar.css">
  <link rel="stylesheet" href="styles/patient_makeNewAppointment.css">
</head>

<body>
  <div id="head">
    <header>
      <img class="logo" src="images/Medic logo.png" alt="logo">

      <nav class="navi">
        <a href="#" class="navi-item is-active" active-color="rgba(0, 56, 255, 1)">HOME</a>
        <a href="#" class="navi-item" active-color="rgba(0, 56, 255, 1)">Doctor's near you</a>
        <a href="#" id="covidnews" class="navi-item" active-color="rgba(0, 56, 255, 1)">Covid19<span class="dot"></span></a>
        <span class="navi-indicator"></span>
      </nav>
      <a class="cta" href="signin.html">
        <button id="signup">Sign in</button></a>
    </header>
  </div>

  <main>
    <div class="row">
      <div class="col-md-2 sidebar">
        <img class="nav logo-side" src="images/Medic logo.png" alt="logo">
        <ul class="nav flex-column nav-pills">
          <li class="nav-item ">
            <a class="nav-link sidebar-link" href="hospitalDashboard.html"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active sidebar-link" data-bs-toggle="dropdown" href=""><i class="fa-solid fa-calendar-check"></i></i> Appointment</a>
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
            <a class="nav-link sidebar-link logout-btn" href=""><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
          </li>
        </ul>
      </div>
    </div>
    <div class="col-md-10 region-main">
    	<div class="row">
    		<h1>Available Sessions</h1>    		  		
    		<c:forEach var="appt" items="${apptInfo}">
    		<c:set var="apptId" value="${appt.appointmentID}"/>
            <c:set var="date" value="${appt.date}"/>
            <c:set var="sTime" value="${appt.startTime}"/>
            <c:set var="eTime" value="${appt.endTime}"/>
            <c:set var="hosName" value="${appt.hosName}"/>
            <c:set var="location" value="${appt.location}"/>
            <c:set var="docName" value="${appt.docName}"/>
            <c:set var="docSpecial" value="${appt.docSpecialization}"/>
                    
            <c:url value="patient_paymentPortal.jsp" var="book">
          		<c:param name="apptId" value="${apptId}"/>
          		<c:param name="date" value="${date}"/>
          		<c:param name="startTime" value="${sTime}"/>
          		<c:param name="endTime" value="${eTime}"/>
          		<c:param name="hosName" value="${hosName}"/>
          		<c:param name="location" value="${location}"/>
          		<c:param name="docName" value="${docName}"/>
          		<c:param name="dSpecial" value="${docSpecial}"/>
          </c:url>        
          
    		<div class="col-md-3">    			
    			<div class="card mb-3" style="width: 18rem;">
    				<div class="card-header">Appointment ID : ${appt.appointmentID}</div>
  					<div class="card-body ">
    					<p class="card-text">Hospital : ${appt.hosName}</p>
    					<p class="card-text">Location : ${appt.location}</p>   			
    					<p class="card-text">Start Time : ${appt.startTime}</p>
    					<p class="card-text">End Time : ${appt.endTime}</p>
    					<p class="card-text">Date : ${appt.date}</p>
    					<p class="card-text">Specialization : ${appt.docSpecialization}</p>
    					<a href="${book}" class="btn btn-primary"><i class="fa-solid fa-bookmark"></i>    			
                     		<input class ="btn btn-primary" type="submit" value="Book">
    					</a>
  					</div>
  				</div>	
  			</div>	
  			</c:forEach>    
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


  <!-- Custom Script -->
  <script src="js/patient_makeNewAppointment.js"></script>
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
