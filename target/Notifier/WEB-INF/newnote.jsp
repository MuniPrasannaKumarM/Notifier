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
<title>new note</title>
</head>
<body>
<div class="container " style="margin-top:20px;">
    <div class="row align-items-center h-100">
        <div class="col-6 mx-auto">
            <div class="jumbotron">
                <div class="card vertical-center">
                     <div class="card-header text-center">New Note</div>
                        <div class="card-body">
                            <form method="post">
                            <table class=" table table-stripped">
                                <tr>
                                    <td>NoteBook Name</td>
                                    <td><input type="text" name="notebookname" class="form-control" value="${nbname}"></td>
                                </tr>
                                <tr>
                                    <td>Note name</td>
                                    <td><input type="text" name="notename" class="form-control" ></td>
                                </tr>
                                
                                <tr>
                                    <td>Start Time</td>
                                    <td><input type="date" name="start" class="form-control" ></td>
                                </tr>
                                <tr>
                                    <td>End Time</td>
                                    <td><input type="date" name="end" class="form-control" ></td>
                                </tr>
                                <tr>
                                    <td>Remainder Time</td>
                                    <td><input type="date" name="remainder" class="form-control" ></td>
                                </tr>
                                <tr>
                                    <td>Status</td>
                                    <td><select name="status" id="status" class="form-control">
                                     <option value="Started">Started</option>
                                     <option value="Not Started">Not Started</option>
                                   </select></td>
                                </tr>
                                <tr>
                                    <td>Tag</td>
                                    <td><select name="tag" class="form-control" id="tag">
                                     <option value="private">Private</option>
                                     <option value="public">Public</option>
                                   </select></td>
                                </tr>
                                <tr>
                                    <td>Description</td>
                                    
                                    <td><textarea name="desc" class="form-control"></textarea></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center">
                                        <input type="submit" name="submit" value="Submit" class="btn btn-secondary">
                                    </td>
								                                    
                                </tr>
                                <tr>
                                    <td colspan="2" class="text-center">
                                        <a class="btn btn-danger" href="/Notifier/notebooks">Cancel</a>
                                    </td>
								                                    
                                </tr>
                            </table>
                                </form>
                        </div>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>