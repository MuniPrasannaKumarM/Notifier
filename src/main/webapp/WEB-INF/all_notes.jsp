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

        </script>
<title>All Notes</title>
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
              
                <li class="nav-item ">
                  <a class="nav-link" href="#" onclick="buttOpen()"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16" style="margin-top: 5px;">
                    <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
                  </svg>${notify}</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/Notifier/login"><i style="font-size: 25px;margin-top: 5px;" class="fa fa-sign-out"></i> Logout</a>
                </li>
            
              </ul>
              
            </div>
          </nav>
          <div id="linking" style="display: none; position:absolute;"class="offset-sm-9"  >
                <div class="card " style="width: 20rem;" >
                    <div class="card-title offset-sm-1 mt-2">Remainder</div>
                    <hr>
                    <c:forEach var="remainderitem" items="${remaindernotes}">
                    <div class="card-body text-center"><h5>${ remainderitem.getName()}</h5>
                        <b>${ remainderitem.getRemainderdate()}</b>
                    </div>
				
                    <hr>
                    </c:forEach>
                    
                </div>
          </div>
          <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <h2>Hii ${name }</h2>
            <a href="/Notifier/dashboard">Dashboard</a>
            <a href="/Notifier/notebooks">NoteBooks</a>
            <a href="notes">Notes</a>
            <a href="edituser">Edit User</a>
          </div>
          
          <div id="main">
            <div class="d-flex flex-row" >
                <div class="p-1 ">
                    <div id="cardColor" class="card" style="width: 20rem; background-color:lightcoral; border: none;">
                        <div class="card-body">
                            <h3 class="card-title text-center">Your Daily Task!!!</h3>
                            <c:forEach var="remainder" items="${remaindernotes}">
                            <div class="card-body mb-3">
                                <h5 class="" style="color: blue;">${remainder.getName()}</h5>
                                <h6>Start Date : ${remainder.getStartdate()}</h6>
                                <h6>End Date : ${remainder.getEnddate() }</h6>   
                                
                            </div>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>

                <div class="p-2">&nbsp;&nbsp;</div>
                <div class="p-2 " style="width: 74%; position: initial;">
                    <div class="d-flex justify-content-end ">
                        <form class=" " method="POST">
                            <table>
                                <tr>
                                <td><a href="/Notifier/newnote?nbname=${notebooknameme}" class="btn btn-info" > ADD NOTE</></td>
                                <td><input type="text" placeholder="Search..." name="search" style="width: max-content;" class="form-control"></td><td><button type="submit" class="btn btn-success">Search</button></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <c:forEach var="note" items="${notes}">
                    <div id="cardColor" class="card mb-4" style="position: initial;">
                        <div class="card-body">
                            
                            <div class="card-body mb-3">
                                <table class="mb-4">
                                    <tr>
                                <td><h5 class="" style="color: blue; padding-right:100px ;">${note.getName()}</h5></td>
                                <td><h6 style="padding-right:30px ;">Start Date : ${note.getStartdate() }</h6></td>
                                <td><button class="btn btn-primary">${note.getStatus()}</button></td>
                                
                            </tr>
                            
                            </table>
                            <div class="d-flex align-self-end">
                                <a href="#" style="text-decoration: none; color: black;" class=""><b>${note.getNotebookname()}</b></i></a>
                            <i class="fa fa-edit mx-auto" aria-hidden="true"><button data-email="${note.getEmail() }" data-name= "${note.getName()}" data-notebookname="${note.getNotebookname()}" data-startdate="${note.getStartdate() }" data-enddate="${note.getEnddate() }" data-remainder="${note.getRemainderdate()}" data-status="${note.getStatus()}" data-tag="${note.getTag() }" data-desc="${note.getDescription() }" type="button" class="open-AddBookDialog" style="border: none; background-color: white;" data-toggle="modal" >Edit</button></i>
                            <i class="fa fa-trash "  aria-hidden="true"><button type="button"data-email="${note.getEmail() }" data-name= "${note.getName()}" class="open-DeleteBookDialog" style="border: none; background-color: white;" data-toggle="modal" id="deleteme" data-target="#deleteModal"> Delete</button></i>
                        </div>
                            </div>
                            
                        </div>
                    </div>
                    </c:forEach>
                    
                </div>
              </div>
              </div>
          <script>
          $(document).on("click", ".open-AddBookDialog", function () {
       	   console.log("heyhey");
       	    var notename = $(this).data('name');
       	    var notebook = $(this).data('notebookname');
       	    var startdate = $(this).data('startdate');
       	    var enddate = $(this).data('enddate');
       	    var remainder = $(this).data('remainder');
       	    var status = $(this).data('status');
       	    var tag = $(this).data('tag');
       	 var email = $(this).data('email');
       	    var desc = $(this).data('desc');
       	    console.log(notename);
       	 $(".modal-body #notebookname").val( notebook );
       	 $(".modal-body #notename").val( notename );
       	$(".modal-body #notename1").val( notename );
       	 $(".modal-body #sdate").val( startdate );
       	$(".modal-body #edate").val( enddate );
       	$(".modal-body #rdate").val( remainder );
       	$(".modal-body #status").val( status );
       	$(".modal-body #tag").val( tag );
       	$(".modal-body #email").val( email );
       	$(".modal-body #desc").val( desc );
            $('#editModal').modal('show');
       	   
       	});
          $(document).on("click", ".open-DeleteBookDialog", function () {
        	  var notename = $(this).data('name');
        	  var email = $(this).data('email');
        	    
        	    $(".modal-body #deletenotename").html( notename );
        	    $(".modal-body #deletenotebox").val( notename );
        	    $(".modal-body #deleteemail").html( email );
        	    $(".modal-body #deleteemailbox").val( email );
        	   
        	   
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
                  	<input type="hidden" name="editnoteme" value="edit">
             		<input type="hidden" name="notebookname" id="notebookname">
             		<input type="hidden" name="notename1" id="notename1">
             		<input type="hidden" name="email" id="email">
                               <label for="notename"> NoteName</label>
                               <input type="text" name="notename" id="notename"placeholder="NoteName" class="form-control"><br>
                               <label for="sdate"> StartDate</label>
                               <input type="date" name="sdate" id="sdate" placeholder="StartDate" class="form-control"><br>
                               <label for="edate"> EndDate</label>
                               <input type="date" name="edate" id="edate" placeholder="EndDate" class="form-control"><br>
                               <label for="rdate"> RemainderDate</label>
                               <input type="date" name="rdate" id="rdate" placeholder="RemainderDate" class="form-control"><br>
                               <label>Status</label>
                               <div class="input-field col s12">
                                   <select name="status" id="status" class="form-control">
                                     <option value="Started">Started</option>
                                     <option value="Not Started">Not Started</option>
                                   </select>
                                   
                               </div><br>
                               <label>Tag</label>
                               <div class="input-field col s12" >
                                   <select name="tag" class="form-control" id="tag">
                                     <option value="private">Private</option>
                                     <option value="public">Public</option>
                                   </select>
                                   
                               </div><br>
                               <label>Description</label>
                               <textarea class="form-control" name="desc" id="desc" cols="30" rows="4" placeholder="Description"></textarea>&nbsp;<br>
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
             					<input type="hidden" id="deletenotebox" name="deletenoteme">
             					<input type="hidden" id="deleteemailbox" name="deleteemailme">
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
                    
</body>
</html>