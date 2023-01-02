<%-- 
    Document   : signin
    Created on : 12-Nov-2022, 12:32:47 pm
    Author     : Avilash
--%>
<%@page import="com.tech.hub.entities.Message" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <body class=" bg-primary-welcome">
        <!--Nav bar-->
        <%@include file="navbar.jsp" %>

        <!--Login--> 
        <main class="d-flex align-items-center" style="height: 79vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">

                            <div class="card-header  bg-primary-navbar text-white text-center">
                                <span class="fa fa-user-circle fa-spin"  style="font-size:50px;color: rgb(10,208,17)"></span>
                                <H1>Login Hear !!</H1>
                            </div>
                            
                             <!--Alert message for User not found-->
                            <%
                                //check if msg is not null and print error msg else follow its natural flow
                                Message msg=(Message)session.getAttribute("msg");
                                if(msg !=null){          
                            %>
                            <!--Alert message for User not found-->
                             <div class="container bg-primary-navbar ">
                                <div class="<%= msg.getCssClass() %>" role="alert">
                                    <%=msg.getContent() %>
                                </div>
                             </div>
                                <%
                                    session.removeAttribute("msg");
                                   
                                }
                                %>
                                  <!--Alert message for User not found-->
                            <form action="SignInServlet" method="post" id="sign-form">
                                <div class="card-body bg-primary-navbar text-white">
                                    <div class="form-group">
                                        <label for="email">Email address</label>
                                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" required>
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                                    </div>
                                    <div class="container text-center">
                                        <button id="submit-btn" class="btn btn-outline-success my-2 my-sm-0 " type="submit">LogIn</button>
                                    </div>

                                    <div class="card-footer text-center" id="loader" style="display: none">
                                        <span class="fa fa-refresh fa-spin fa-2x" ></span>   
                                    </div>
                            </form>

                        </div>

                    </div><!-- card -->
                    <p class="text-white text-center mt-1">Didn't have an account? <a href="signup.jsp" >Signup hear.</a></p>
                </div>
            </div>
        </div>
    </main>


    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/javascript.js" type="text/javascript"></script><!-- Custom java script -->
    <!--Sweet alert CDN  URL(https://cdnjs.com/libraries/sweetalert)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <!--JQuery-->
    <script>
        $(document).ready(function () {
            console.log("Sign in page ready.");

        });

    </script>
</body>
</html>
