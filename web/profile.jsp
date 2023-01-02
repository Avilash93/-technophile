<%-- 
    Document   : profile
    Created on : 14-Nov-2022, 4:39:58 pm
    Author     : Avilash
--%>
<%@page  import="com.tech.hub.entities.Users" %>
<%@page  import="com.tech.hub.entities.*" %>
<%@page  import="com.tech.hub.dao.*" %>
<%@page  import="java.util.ArrayList" %>
<%@page errorPage="ExceptionHandler.jsp" %>
<% 
       Users user= (Users)  session.getAttribute("currentUser");
       if(user == null){
         
            response.sendRedirect("signin.jsp");
            System.out.println("Inside if cond:"+user);
            }
%>


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
    <body  >

        <!--User Nav-bar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary-navbar">
            <a href="index.jsp" class="navbar-brand" href="#"><span class="fa fa-drupal" style="font-size:28px;color: rgb(10,208,17) "></span> TechHub</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item ">
                        <a class="nav-link" href="#"><span class="fa fa-file-code-o"></span> Learn with me <span class="sr-only">(current)</span></a>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-th-large"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Core Java</a>
                            <a class="dropdown-item" href="#">Advanced Java</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    </li>

                    <li class="nav-item"> 
                        <a class="nav-link" href="#"><span class="fa fa-phone"></span> Contact</a>
                    </li>


                    <li class="nav-item"> 
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#modal-write-post"><span class="fa fas fa-edit"></span> Write</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item ">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#modal-profile"><span class="fa fa-user-circle"></span> <%=user.getName()%> <span class="sr-only">(current)</span></a> 
                    <li class="nav-item ">
                        <a class="nav-link" href="Logout"><span class="fa fa-circle-o-notch"></span> Logout <span class="sr-only">(current)</span></a>
                </ul>

            </div>
        </nav>
        <!--End Nav-bar--> 

        <!--Alert message for profile updated or not-->
        <%
            //check if msg is not null and print error msg else follow its natural flow
            Message msg=(Message)session.getAttribute("msg");
            if(msg !=null){          
        %>
        <!--Alert message for User not found-->

        <div class="<%= msg.getCssClass() %>" role="alert">
            <%=msg.getContent() %>
        </div>

        <%
            session.removeAttribute("msg");
                                   
        }
        %>
        <!--Alert message for profile updated or not-->

        <!--Profile modal START-->   
        <!-- Modal -->
        <div class="modal fade" id="modal-profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title " id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">
                            <a data-toggle="modal" data-target="#modal-view-pimage"> <img src="images/profile/<%=user.getProfile()%>" alt="image" height="70px"> </a>    
                            <p><%=user.getName()%></p> 
                            <!--Profile modal table container START-->
                            <div id="profile-table-view">
                                <table class="table table-hover " >

                                    <tbody>
                                        <tr>

                                            <td>Name</td>
                                            <td> <%=user.getName()%> </td>

                                        </tr>
                                        <tr>

                                            <td>Email</td>
                                            <td> <%=user.getEmail()%> </td>

                                        </tr>
                                        <tr>

                                            <td >Gender</td>
                                            <td> <%=user.getGender()%> </td>
                                        </tr>

                                        <tr>

                                            <td >About</td>
                                            <td> <%=user.getAbout()%> </td>
                                        </tr>

                                        <tr>

                                            <td >Register date</td>
                                            <td> <%=user.getDateAndTime().toString()%> </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <!--Profile modal table container END-->

                            <!--Profile modal table EDIT START-->
                            <div id="profile-table-edit" style="display: none">

                                <form action="EditProfile" method="post"  enctype="multipart/form-data">

                                    <div class="custom-file mb-3">
                                        <input type="file" class="custom-file-input" id="customFile" name="user_profile_img">
                                        <label class="custom-file-label" for="customFile">Edit Profile </label>
                                    </div>


                                    <table class="table table-hover " >
                                        <tbody>

                                            <tr>

                                                <td>Name</td>
                                                <td> <input type="text" name="user_name" value="<%=user.getName()%>" class="form-control"> </td>

                                            </tr>
                                            <tr>

                                                <td>Email</td>
                                                <td> <input type="text" name="user_email" value="<%=user.getEmail()%>" class="form-control"> </td>

                                            </tr>
                                            <tr>
                                                <td >Password</td>
                                                <td> <input type="password" name="user_password" value="<%=user.getPassword()%>" class="form-control"> </td>
                                            </tr>

                                            <tr>
                                                <td >Gender</td>
                                                <td> <input type="text" name="user_gender" value="<%=user.getGender()%>" class="form-control"> </td>
                                            </tr>

                                            <tr>

                                                <td >About</td>
                                                <td> <textarea id="about" name="user_about" class="form-control" rows="2" cols="10"> <%=user.getAbout()%> </textarea> </td>
                                            </tr>

                                        </tbody>

                                    </table>
                                    <!--Save Changes button-->
                                    <div class="container text-right">
                                        <button id="submit-btn" class="btn btn-primary form-control" type="submit" name="">Save</button>    
                                    </div>
                                </form>
                            </div>
                            <!--Profile modal table EDIT END-->
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close-profile-btn">Close</button>
                        <button type="button" class="btn btn-primary" id="edit-profile-btn">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--Profile modal END-->      


        <!--View image modal START-->
        <div class="modal fade bd-example-modal-lg" id="modal-view-pimage" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="container text-center">
                        <span>
                            <img src="images/profile/<%=user.getProfile()%>" alt="alt" > 
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <!--View image modal END-->

        <!--Write a post modal START-->
        <!-- Modal -->
        <div class="modal fade" id="modal-write-post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="WritePostServlet" method="post" id="write-post-form" enctype="multipart/form-data">
                            <div class="form-group">
                                <select class="form-control" name="catId">
                                    <option selected disabled>--Select Categories--</option>
                                    <%
                                    PostContentDao catDao=new PostContentDao();
                                    ArrayList<Categories> list=catDao.getAllCategories();
                                    for(Categories cat:list){
                                    %>

                                    <option value="<%=cat.getCatId()%>"><%=cat.getCatName()%></option>
                                    <%
                                        }
                                    %>


                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Title" name="postTitle">
                            </div>
                            <div class="form-group">
                                <textarea id="content" name="postContent" rows="5" cols="10" class="form-control" placeholder="Write content hear"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea id="code" name="postCode" rows="5" cols="10" class="form-control" placeholder="Write code(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Picture if any</label>
                                <input type="file" class="form-control"  name="postImg">
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Reference link" name="postLink">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-secondary" id="btn-post">Post</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!--Write a post modal END-->


        <!--Main body START-->
        <div class="container-fluid p-0 ">
            <div class="row flex-xl-nowrap ">
                <!--Side nav-bar START-->
                <div class="col-sm-3 bd-sidebar border-right ">
                    <div class="list-group list-group-flush ">
                        <a href="#" onclick="getPost(0,this)" class="cat-link list-group-item list-group-item-action bg-primary-navbar">
                            All Post
                        </a>
                        <%
//                                    PostContentDao catDao=new PostContentDao();
//                                    ArrayList<Categories> list=catDao.getAllCategories();
                                    for(Categories cat:list){
                        %>

                        <a href="#"  onclick="getPost(<%=cat.getCatId()%>,this)" class="cat-link list-group-item list-group-item-action bg-primary-navbar"><%=cat.getCatName()%></a>
                        
                        <%
                            }
                        %>

                    </div>
                </div>
                <!--Side nav-bar END-->
              
                 
                <!--page start-->
                <div class="col-sm-9 ">
                    <!--loader start-->
                    <div class="container text-center mt-1" id="profile-page-loader">
                        <i class="fa fa-refresh fa-spin" style="font-size:48px;color:gray"></i>
                    </div>
                     <!--loader end-->
                     <!--Main body of page START-->
                     <div class="container-fluid " id="posted-content">
                         <!--Main code present in [posted-content.jsp] page-->
                     </div>
                     <!--Main body of page END-->
                </div>
                <!--page end-->
            </div>
        </div>
        <!--Main body START-->






        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/javascript.js" type="text/javascript"></script><!-- Custom java script -->
        <!--Sweet alert CDN  URL(https://cdnjs.com/libraries/sweetalert)-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


        <!--JQuery-->
        <script>
            $(document).ready(function () {

                let editStatus = false;
                $('#edit-profile-btn').click(function () {
                    if (editStatus === false) {
                        $('#profile-table-view').hide();
                        $('#profile-table-edit').show();
                        $(this).text("Back");
                        editStatus = true;
                    } else {
                        $('#profile-table-view').show();
                        $('#profile-table-edit').hide();
                        $(this).text("Edit");
                        editStatus = false;
                    }
                })

            });

        </script>
        <!--Write a post is JQuery START-->
        <script>
            $(document).ready(function (e) {

              
                $("#write-post-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "WritePostServlet",
                        data: form,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() == 'success') {
                                swal("Good job!", "Posted a content!", "success");
                            } else {
                                swal("Failed!", "Something went wrong!", "success");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR)
                            swal("Error!", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false

                    })
                })
            })
        </script>
        <!--Write a post is JQuery END-->
        
        <!--Posted content body START-->
        <script>
            function getPost(catId,refLink){
                 $('#profile-page-loader').show()
                 $('#posted-content').hide()
                //catch all link with class cat-link
                $('.cat-link').removeClass('active')
                
               $.ajax({
                   url: "posted_content.jsp",
                   data: {cid:catId},
                   success: function (data, textStatus, jqXHR) {
                       
                           $('#profile-page-loader').hide();
                           $('#posted-content').show()
                        $('#posted-content').html(data);
                        $(refLink).addClass('active')
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                    }
                    
               })
            }
            $(document).ready(function(){
//            add class actie in all post category
                let allPostRef=$('.cat-link')[0]
             getPost(0,allPostRef) //by default it takes zero
            })
        </script>
        <!--Posted content body END-->
    </body>
</html>
