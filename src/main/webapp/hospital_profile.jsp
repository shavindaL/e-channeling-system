<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import= "java.util.List" 
		import ="com.hospital.*"
		import= "javax.servlet.http.HttpSession"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
		
	String hospitalId = (String)session.getAttribute("hospitalId");
	String name = (String)session.getAttribute("name");
	String location = (String)session.getAttribute("location");
	String phoneNo = (String)session.getAttribute("phoneNo");
	String usernameHos = (String)session.getAttribute("usernameHos");
	String passwordHos = (String)session.getAttribute("passwordHos"); 
	
		 
	if(usernameHos==null){
			response.sendRedirect("signin.jsp");
	}


%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hospital-Profile</title>
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
    <link rel="stylesheet" href="styles/hopitalDashboard.css">
    <link rel="stylesheet" href="styles\sidebar.css">
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
             <h6 class="nav-item"> <%=name %></h6>
        </header>
    </div>

    <main>
        <div class="row">
            <div class="col-2 sidebar">
                <img class="nav logo-side" src="images/Medic logo.png" alt="logo">
                <ul class="nav flex-column nav-pills">
                    <li class="nav-item ">
                        <a class="nav-link sidebar-link" href="hospital_Dashboard.jsp"><i
                                class="fa-solid fa-chart-line"></i> Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active sidebar-link" href="hospital_profile.jsp"><i class="fa-solid fa-user"></i> Profile</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle sidebar-link" data-bs-toggle="dropdown" href=""><i
                                class="fa-solid fa-calendar-check"></i> Sessions</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="hospital_newAppointment.jsp">New Session</a></li>
                            <li><a class="dropdown-item" href="viewAppt">View Sessions</a></li>    
                        </ul>
                    </li>                                                          
                    <li class="nav-item">
                        <a class="nav-link sidebar-link position-absolute top-50 start-10" href="hosLogout"><i
                                class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="region-main">
            <div class="row">
                        
                <h1 class="">Update Profile</h1>
                               
                <form class="row g-3 needs-validation" method="post" action="updateHosProfile">
                    <div class="col-md-4">
                        <label for="docId" class="form-label">Hospital ID</label>
                        <input type="text" class="form-control" name="hosId" value="<%=hospitalId %>" readonly>
                    </div>
                    <div class="col-md-4">
                        <label for="docId" class="form-label">Hospital Name</label>
                        <input type="text" class="form-control" name="hosName" value="<%=name %>" readonly>
                    </div>
                    <div class="col-md-4">
                        <label for="endTime" class="form-label">User Name</label>
                        <input type="text" class="form-control" name="username" value="<%=usernameHos %>" readonly>
                    </div>             
                    <div class="col-md-4">
                        <label for="date" class="form-label">Location</label>
                        <input type="text" class="form-control" name="location" value="<%=location %>">
                    </div>
                    <div class="col-md-4">
                        <label for="startTime" class="form-label">Phone</label>
                        <input type="text" class="form-control" name="phone" value="<%=phoneNo%>" pattern=[0-9]{10} maxlength="10">
                    </div>
                    <div class="col-md-4">
                        <label for="endTime" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" value="<%=passwordHos %>">
                    </div>
                    <div class="col-12">
                        <button class="btn btn-primary" type="submit">Update</button>
                    </div>
                  </form>             
            </div>
        </div>
    </main>

    <!-- ================================================ Bootstrap ================================================================== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- ================================================ JQUERY ================================================================== -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <!-- Chart API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!-- ================================================ Custom JAVASCRIPT ================================================================== -->
    <script type="text/javascript" src="js\home page.js"></script>
    <script type="text/javascript" src="js\hospitalDashboard.js"></script>


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