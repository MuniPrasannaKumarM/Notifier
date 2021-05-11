<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <style>
        body {
    font-family: "Lato", sans-serif;
  }
  
  .sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
  }
  .sidenav h2{
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;   
  }
  .sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
  }
  
  .sidenav a:hover {
    color: #f1f1f1;
  }
  
  .sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
  }
  
  @media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
  }
  
        </style>
        <script>
            function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  //document.getElementById("main").style.marginLeft = "250px";
  document.body.style.backgroundColor = "white";//rgba(0,0,0,0.4)
  document.getElementById('cardColor').style.backgroundColor = "rgb(249, 150, 107)";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  document.body.style.backgroundColor = "grey";
  document.getElementById('cardColor').style.backgroundColor = "white";
}
        </script>
<title>Edit User</title>
</head>
<body style="background-color: grey;">
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <h2>Hii ${nameme}</h2>
            <a href="/Notifier/dashboard">Dashboard</a>
            <a href="/Notifier/notebooks">NoteBooks</a>
            <a href="notes">Notes</a>
            <a href="edituser">Edit User</a>
          </div>
          <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
          <div id="main">
        <div class="d-flex justify-content-center mt-5">
            <div id="cardColor" class="card" style="width: 30rem; background-color:white;">
                <div class="card-body">
                    <h3 class="card-title text-center">Edit User</h3>
                    <form class=" mt-5" method="POST">
                        <label for="nameofme" class="mb-3">Name</label>
                    <input type="text" id="nameofme"  class="form-control mb-3" style="width: 100%;" name="name" value="${name}">
                    
                        <label for="usernameofme" class="mb-3">UserName</label>
                    <input type="text" id="usernameofme"  class="form-control mb-3" style="width: 100%;" name="username" value="${username}">
                    <label for="mobileofme" class="mb-3">Mobile Number</label>
                    <input type="text" id="mobileofme"  class="form-control mb-3" style="width: 100%;" name="mobile" value="${mobile }">
                    <label for="Emailofme" class="mb-3">Email (Change not Required)</label>
                    <input type="text" id="emailofme"  class="form-control mb-3" style="width: 100%;" name="email" value="${email }" >
                    <label for="passwordofme" class="mb-3">Password</label>
                    <input type="text" id="passwordofme"  class="form-control mb-3" style="width: 100%;" name="password" value="${password}">
                    <button href="#" class="btn btn-success mt-5 form-control" style="width: 50%;margin-left: 25%;" >Save</button>
                    </form>
                </div>
            </div>
        </div>           
    </div>   
    </body>
</html>