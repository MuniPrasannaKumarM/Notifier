<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	 <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
        <script>
            function password()
            {
                var name = document.getElementById("passwordofme").value;
                
                if(name == '')
                    {var m = document.getElementById('password_error').style.display = 'block';}
                else
                {var m = document.getElementById('password_error').style.display = 'none';}

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
        </script>
</head>
<body>
        <div class="d-flex justify-content-center">
            <h1 style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;">Remaind Me</h1>
        </div>
        <div class="d-flex justify-content-center mt-5 col-sm-12">
            <div class="card" style="width: 30rem; background-color:lemonchiffon;">
                
                <div class="card-body">
                  <h3 class="card-title text-center">Login</h3>
                  <form class="text-center mt-5 col-sm-12 " method="Post">
                      <input type="email" id="emailofme" placeholder="Email" class="form-control mb-3" style="width: 100%;" onblur="email()" name="email" required>
                      <p id="email_error" style="display: none;">Enter Valid Email</p>
                      <input type="text" id="passwordofme" placeholder="Password" class="form-control" style="width: 100%;" onblur="password()" name="password" required>
                      <p id="password_error" style="display: none;">Enter Valid Password</p>
                      <button class="btn btn-success mt-5 form-control" style="width: 50%;">Login</button>
                  </form>
                        <div class="mt-5">

                        </div>
                        <form method="post">
                        <div class="mt-5 d-flex justify-content-center">
                            Not a Member? &nbsp; <button type="submit" style="border:none;" name="already" value="signup into"> SignUp</button>
                        </div>
                        </form>
                </div>
        </div>

</body>
</html>