<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    
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
  <link rel="stylesheet" href="styles/hospital_Login.css">

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
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-6">
          <img class="login-img col-12" src="images/hospital1.jpg" alt="">
        </div>

        <div class="col-lg-6">
          <div class="login-form">
            <h1>Login</h1>
            <form class="row g-3" action="login" method="post">
              <div class="col-md-12">
                <label for="validationDefault01" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" placeholder="hospital" required>
              </div>
              <div class="col-md-12">
                <label for="validationDefault02" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" placeholder="********" required>
              </div>
              <div class="col-12">
                <button class="btn btn-primary login-btn" type="submit">Login</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </main>


  <!-- ================================================ Bootstrap ================================================================== -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
  <!-- ================================================ JQUERY ================================================================== -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous"></script>

  <!-- Chart API -->
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <!-- ================================================ Custom JAVASCRIPT ================================================================== -->
  <script type="text/javascript" src="js\home page.js"></script>
  <script type="text/javascript" src="js\hospitalDashboard.html"></script>


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