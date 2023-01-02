<%-- 
    Document   : signup
    Created on : 12-Nov-2022, 6:55:58 pm
    Author     : Avilash
--%>

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
    <body class="bg-primary-welcome">

        <!--Nav bar-->
        <%@include file="navbar.jsp" %>

        <!--Login--> 
        <main class="d-flex align-items-center" style="height: 88vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card " style="width: 30rem" >

                            <div class="card-header  bg-primary-navbar text-white text-center">
                                <span class="fa fa-user-circle "  style="font-size:30px;color: rgb(10,208,17)"></span>
                                <H1 style="font-size: 20px">Sign Up</H1>
                                <p>Please fill in this in form to create an account!</p>
                            </div>

                            <div class="card-body bg-primary-navbar text-white">
                                <form  action="SignUpServlet" method="post" id="signup-form">


                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">

                                                <input type="text" class="form-control d-inline-flex p-1"  id="First Name" aria-describedby="FirstNameHelp" name="FirstName" placeholder="First Name" required>
                                            </div>
                                        </div>

                                        <div class="col">
                                            <div class="form-group">

                                                <input type="text"  class="form-control d-inline-flex p-1" id="Last Name " name="LastName" aria-describedby="emailHelp" placeholder="Last Name" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">

                                        <input type="email" class="form-control d-inline-flex p-1" id="Email" aria-describedby="emailHelp" name="Email" placeholder="Email">

                                    </div>

                                    <div class="form-group">

                                        <input type="password" class="form-control d-inline-flex p-1" id="password" name="Password" placeholder="Password" required >
                                    </div>

                                    <div class="form-group">

                                        <input type="password" class="form-control d-inline-flex p-1" id="confirm_password" name="Confirm_Password" placeholder="Confirm Password" required>
                                    </div>

                                    <div class="form-group mb-0">
                                        <label for="gender">Select Gender</label>
                                        <input type="radio"  id="gender" name="gender" value="Male" required>Male
                                        <input type="radio"  id="gender" name="gender" value="Female" required>Female
                                    </div>

                                    <div class="form-group">
                                        <textarea class="form-control " id="about" name="about" rows="3" cols="10" placeholder="Write about yourself  [Role,Skill,etc]."></textarea>
                                    </div>

                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="terms_cond" required >
                                        <label class="form-check-label " style="font-size:15px" for="exampleCheck1" >I accept the Terms of Use & Privacy Policy</label>
                                    </div>

                                    <br>
                                    <div class="container text-center"style="display: none" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-2x" ></span>
                                    </div>
                                    <button class="btn btn-outline-success my-2 my-sm-0" id="submit-btn"type="submit">Sign Up</button>


                                </form>

                            </div>

                        </div> <!-- card -->
                        <p class="text-white text-center mt-1">Already have an account? <a href="signin.jsp" >Login hear.</a></p>
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
                console.log("Sign Up Page Loaded.");

                $('#signup-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    $('#submit-btn').hide();
                    $('#loader').show();
                    //Send to signup servlet
                    $.ajax({
                        url: "SignUpServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $('#submit-btn').show();
                            $('#loader').hide();
                            if (data.trim() === 'done') {
                                swal("Good job!", "Register successfuly!", "success")
                                .then((value) => {
                                    window.location = "signin.jsp";
                                });
                            } else {
                                swal("Email is already regitered!");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $('#submit-btn').show();
                            $('#loader').hide();
                            swal({
                                title: "Failed",
                                text: "Something went wrong!",
                                icon: "error"
                            });
                        },
                        processData: false,
                        contentType: false
                    });
                });


//      Start confirm Password
                var password = document.getElementById("password")
                        , confirm_password = document.getElementById("confirm_password");

                function validatePassword() {
                    if (password.value !== confirm_password.value) {
                        confirm_password.setCustomValidity("Passwords Don't Match");
                    } else {
                        confirm_password.setCustomValidity('');
                    }
                }
                password.onchange = validatePassword;
                confirm_password.onkeyup = validatePassword;
            });
//      End confirm Password
//                Catch form & AJAX Operation




        </script>
    </body>
</html>
