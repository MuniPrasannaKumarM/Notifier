<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <script>
        function name()
        {
            var name = document.getElementById("nameofme").value;
            
            if(name == '')
                {var m = document.getElementById('name_error').style.display = 'block';}
            else
            {var m = document.getElementById('name_error').style.display = 'none';}

        }
            function username()
            {
                var name = document.getElementById("usernameofme").value;
                
                if(name == '')
                    {var m = document.getElementById('username_error').style.display = 'block';}
                else
                {var m = document.getElementById('username_error').style.display = 'none';}

            }
            function password()
            {
                var name = document.getElementById("passwordofme").value;
                
                if(name == '')
                    {var m = document.getElementById('password_error').style.display = 'block';}
                else
                {var m = document.getElementById('password_error').style.display = 'none';}

            }
            function mobile()
            {
                var name = document.getElementById("mobileofme").value;
                
                if(name == '')
                    {var m = document.getElementById('mobile_error').style.display = 'block';}
                else
                {var m = document.getElementById('mobile_error').style.display = 'none';}

            }
            function email(){
                var emai = document.getElementById('emailofme').value;
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                if (reg.test(emai) == false)
                {
                    var m = document.getElementById('email_error').style.display = 'block';
                    
                }
                else
                {
                    var m = document.getElementById('email_error').style.display = 'none';
                }
            }
            function checkpass()
            {
                var name = document.getElementById("confirmofme").value;
                var pass = document.getElementById("passwordofme").value;
                
                if(name != pass)
                    {var m = document.getElementById('confirm_error').style.display = 'block';}
                else
                {var m = document.getElementById('confirm_error').style.display = 'none';}

            }
        </script>
</head>
<body>
	<div class="d-flex justify-content-center">
            <h1 style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;">Remaind Me</h1>
        </div>
        <div class="d-flex justify-content-center mt-5">
            <div class="card" style="width: 30rem; background-color:lemonchiffon;">
                
                <div class="card-body">
                  <h3 class="card-title text-center">Sign Up</h3>
                  <form class="text-center mt-5" method="Post">
                  <input type="text" name="name" id="nameofme" placeholder="Name" class="form-control mb-3" style="width: 100%;" onblur="name()" required>
                    <p id="name_error" style="display: none;">Enter Valid Name</p>
                    <input type="text" name="username" id="usernameofme" placeholder="Username" class="form-control mb-3" style="width: 100%;" onblur="username()" required>
                    <p id="username_error" style="display: none;">Enter Valid Username</p>
                    <input type="text" name="mobile" id="mobileofme" placeholder="Mobile Number" class="form-control mb-3" style="width: 100%;" onblur="mobile()" required>
                    <p id="mobile_error" style="display: none;">Enter Valid Mobile</p>
                      <input type="email" name="email" id="emailofme" placeholder="Email" class="form-control mb-3" style="width: 100%;" required onblur="email()">
                      <p id="email_error" style="display: none;">Enter Valid Email</p>
                      <input type="text" name="password" id="passwordofme" placeholder="Password" class="form-control mb-3" style="width: 100%;" onblur="password()" required>
                      <p id="password_error" style="display: none;">Enter Valid Password</p>
                      <input type="text"  id="confirmofme" placeholder="Confirm Password" class="form-control" style="width: 100%;" required onblur="checkpass()">
                      <p id="confirm_error" style="display: none;">Password is not equal to Confirm Password</p>
                      
                      <button type="submit" class="btn btn-success mt-5 form-control" style="width: 50%;">Submit</button>
                  </form>
                        <div class="mt-5">

                        </div>
                        <form method="post">
                        <div class="mt-5 d-flex justify-content-center">
                            Already a Member? &nbsp; <button type="submit" style="border:none;" name="already" value="login into"> LogIn</button>
                        </div>
                        </form>
                </div>
        </div>
</body>
</html>