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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
  
  
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
  
  
}
var count=1;
function buttOpen(){
    console.log(count++);
    if(count%2==0)
        document.getElementById('linking').style.display = "block";
    else
    document.getElementById('linking').style.display = "none";
}
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
$('#deleteModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  
})
        </script>

<title>Notebooks</title>
</head>
<body>
<nav class="navbar navbar-expand-lg  " style="background-color: lightgrey;">
            <div class="offset-sm-0"><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span></div>
            <a class="navbar-brand offset-sm-5" href="#"><h4 style="color:black; margin-top: 10px;">Notifier</h4></a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse justify-content-end" id="navbarTogglerDemo02" >
              <ul class="navbar-nav  mt-2 mt-lg-0 ">
                <li class="nav-item">
                    <button type="button" class="btn" data-toggle="modal" data-target="#exampleModalCenter"> ADD NOTEBOOK</button>
                  </li>
                <li class="nav-item ">
                  <a class="nav-link" href="#" onclick="buttOpen()"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16" style="margin-top: 5px;">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                  </svg>20</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="login.html"><i style="font-size: 25px;margin-top: 5px;" class="fa fa-sign-out"></i> Logout</a>
                </li>
            
              </ul>
              
            </div>
          </nav>
          <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">Add NoteBook</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <form method="Post">
                <div class="modal-body">
                  		<input type="hidden" name ="notevalue" value="add">
                      <label for="notebook">Notebook Name : </label>
                      <input type="text" id="notebook" placeholder="NoteBook" class="form-control" name="addNotebook">
                  
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                   <button type="submit" class="btn btn-success">Submit</button>
                   
                </div>
                </form>
              </div>
            </div>
          </div>
          
          <div id="linking" style="display: none; position:absolute;"class="offset-sm-9"  >
                <div class="card " style="width: 20rem;" >
                    <div class="card-title offset-sm-1 mt-2">Remainder</div>
                    <hr>
                    <div class="card-body text-center"><h5>NPTEL</h5>
                        <b>2021-08-07</b>
                    </div>

                    <hr>
                    <div class="card-body text-center"><h5>NPTEL</h5>
                        <b>2021-08-07</b>
                    </div>

                    <hr>
                </div>
          </div>
          <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <h2>Hii Muni Prasanna Kumar M</h2>
            <a href="#">Dashboard</a>
            <a href="#">NoteBooks</a>
            <a href="#">Notes</a>
            <a href="#">Edit User</a>
          </div>
          
          <div id="main">
            <div class="d-flex flex-row" >
                
                    

                
                <div class="" style="width: 100vw; position: initial; padding: 2vw;">
                    
                        
                    <div class="d-flex justify-content-between ">
                        <h3>NOTEBOOKS</h3>
                        <form class=" ">
                            <table>
                                <tr>
                                <td><input type="text" placeholder="Search..." style="width: max-content;" class="form-control"></td><td><button type="submit" class="btn btn-success">Search</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div style="padding: 5vw; background-color: grey;">
                    <!-- start for -->
                    <c:forEach var="categoryName" items="${notebooks}" varStatus="loop">
     				
	                        <div id="cardColor" class="card mb-4" style="position: initial;">
                        <div class="card-body">
                            
                            <div class="card-body mb-3">
                                <table class="mb-4">
                                    <tr>
                                <td><h5 class="" style="color: blue; padding-right:100px ;" id="new_note" name="new_note" >${categoryName}</h5></td>                              
                            </tr>
                            
                            </table>
                            <div class="d-flex align-self-end">
                                <a href="#" style="text-decoration: none; color: black;" class="">${count[loop.index]} Notes</a>
                            <i class="fa fa-edit mx-auto" aria-hidden="true"><button data-bookname= "${categoryName}" data-count ="${count[loop.index]}"type="button" class="open-AddBookDialog" style="border: none; background-color: white;" data-toggle="modal" >Edit</button></i>
                            <i class="fa fa-trash "  aria-hidden="true"><button type="button"data-bookname= "${categoryName}" class="open-DeleteBookDialog" style="border: none; background-color: white;" data-toggle="modal" id="deleteme" data-target="#deleteModal">Delete</button></i>
                        </div>
                            </div>
                          
                        </div>
                    </div>
                    <!-- end for -->
</c:forEach>                    
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
$(document).on("click", ".open-AddBookDialog", function () {
    var bookname = $(this).data('bookname');
    
    $(".modal-body #booknameme").val( bookname );
    
    
   $('#editModal').modal('show');
});
$(document).on("click", ".open-DeleteBookDialog", function () {
    var bookname = $(this).data('bookname');
    console.log(bookname);
    $(".modal-body #deletenotename").html( bookname );
    $(".modal-body #deletenotebox").val( bookname );
   var hey = document.getElementById("deletenotebox").value = bookname;
   
   $('#deleteModal').modal('show');
});
</script>
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="Modal-edit" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="editnotetitle">Edit Notebook</h5>
                  <button type="button" class="close" onclick="window.location.reload();">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <form method="POST">
                <div class="modal-body">
                  	<input type="hidden" name="editnotebookme" value="edit">
                      <label for="bookname">Name</label>
                      <input type="text" id="booknameme" placeholder="NoteBook" class="form-control" name="editnotebook" >
                  	<label for="newbookname">New Name</label>
                      <input type="text" id="newbooknameme" placeholder="New Name " class="form-control" name="newnotebook">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" onclick="window.location.reload();">Close</button>
                  <a href="#" ><button type="submit" class="btn btn-success">Submit</button></a>
                  
                </div>
                </form>
              </div>
            </div>
          </div>
                    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="DeleteModalTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLongTitle">Delete</h5>
                              <button type="button" class="close" onclick="window.location.reload();">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <form method="Post">
             				<div class="modal-body">
             					Are you sure ?
             					<input type="hidden" name="deletemeornot" value="delete">
             					<input type="hidden" id="deletenotebox" name="deletenotebookme">
             					<h6 id="deletenotename"></h6>
             				</div>
             				
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" onclick="window.location.reload();">Cancel</button>
                              <a href="" ><button type="submit" class="btn btn-success">Confirm</button></a>
                            </div>
                            </form>
                          </div>
                        </div>
                      </div>  
                    
                    
                    
                    
                    </div>
                </div>
              </div>
              </div>
            </div>       
            
</body>
</html>