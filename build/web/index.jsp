<%-- 
    Document   : index
    Created on : 11-Nov-2022, 7:03:40 pm
    Author     : Avilash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.hub.helper.*" %>
<!--Nav bar-->
<%@include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Hub Home Page</title>
        <!--Bootstrap 4 CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--custom CSS-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--W3 school Icon css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
              clip-path: polygon(50% 0%, 81% 0, 100% 0, 100% 93%, 68% 100%, 33% 91%, 0 99%, 0 0, 20% 0);
            }
        </style>
    </head>
    <body>
        <!--welcome section start-->
        <div class="container-fluid ">
            <div class="jumbotron bg-primary-welcome text-white banner-background ">
                <div class="container">
                    <h3 class="display-4 ">Welcome To TechHub</h3>
                    <p>“Education is evolving due to the impact of the Internet. We cannot teach our students in the same manner in which we were taught. Change is necessary to engage students, not in the curriculum we are responsible for teaching, but in school. Period.” – April Chamberlain</p>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Get Started!</button>
                    <a href="signin.jsp" class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign In</a>

                </div>
            </div>
        </div>
        <!--welcome section End-->
        <!--card start-->
        <div class="container">
            <!--first row-->
            <div class="row mb-3">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Core Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Core</button>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Advanced Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">JAva</button>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">DSA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign Up</button>
                        </div>
                    </div>
                </div>
                
            </div>
           
            <!--Secoond Row-->
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Core Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign Up</button>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Advanced Java</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign Up</button>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">DSA</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                             <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign Up</button>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <!--card end-->





        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/javascript.js" type="text/javascript"></script><!-- Custom java script -->

        <!--JQuery-->
        <script>
            $(document).ready(function () {


            });

        </script>
    </body>
</html>
