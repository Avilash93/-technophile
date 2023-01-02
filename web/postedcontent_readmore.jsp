<%-- 
    Document   : postedcontent_readmore
    Created on : 21-Nov-2022, 12:37:16 pm
    Author     : Avilash
--%>
<%@page  import="com.tech.hub.entities.Users" %>
<%@page  import="com.tech.hub.entities.*" %>
<%@page  import="com.tech.hub.dao.*" %>
<%@page  import="java.util.*" %>
<%@page  import="java.text.DateFormat" %>
<% 
       Users user= (Users)  session.getAttribute("currentUser");
       if(user == null){
         
            response.sendRedirect("signin.jsp");
            System.out.println("Inside if cond:"+user);
            }
%>

<% int postId=Integer.parseInt(request.getParameter("postId")); 
        PostContent post=PostContentDao.getContentByPostId(postId);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--Bootstrap 4 CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
        <!--custom CSS-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--W3 school Icon css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
      
    <style>
        .post-register-date{
            font-style: italic;
            font-weight: 100;
            margin-top: -14px;
            font-size: 12px;
        }
        .post-title{
            font-size: 16px;
            font-weight: bold;
        }
        .post-user-name{
            font-weight: 100;
            font-size: 12px;
        }

    </style>
    
    
</head>
<body >






    <div class="container">
        <div class="row">
            <div class="col-sm ">
                <div class="card ">
                </div>
                <div class="card-header bg-primary-navbar ">
                    <div class="row">
                        <div class="col-sm-9">
                            <h3  class=" post-title text-white" ><%=post.getPostTitle()%></h3>
                        </div>
                        <div class="col-sm-3zx">

                            <p class="post-user-name " >Posted by: <a href="#!"><%=UsersDao.getUsersByUserId(post.getUserId()).getName()%></a></p>
                            <p class="post-register-date text-white"><%= DateFormat.getDateInstance().format(post.getRegisterDate())%></p>

                        </div>
                    </div>
                </div>
                <div class="card-body ">
                    <p>wehabufhjc fdcnwq fncwffjhb cfweafhfcifc cfhbi cfcn ncf wancfdhi</p>
                    <hr>
                    <label>Code</label>
                    <p>wehabufhjc fdcnwq fncwffjhb cfweafhfcifc cfhbi cfcn ncf wancfdh</p>
                    <label>Code</label>
                    <!--Like and Comment button-->

                    <a href="#!" onclick="doLike(<%=post.getPostId()%>, <%=user.getId()%>)" class="btn btn-outline-success btn-sm btn-like" type="submit"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=LikedDao.countLike(post.getPostId())%></span></a>
                    <a href="#!" class="btn btn-outline-success btn-sm ml-1" type="submit"><i class="fa fa-commenting-o"> 10</i></a>


                </div>
                <div class="card-body ">
                    <img alt="Jpg Image" class="card-img-top embed-responsive-item " src="images/posted/<%=post.getPostImg()%>" height="600px" />
                </div>
                <div class="card-footer">
                    <div class="fb-comments" data-href="http://localhost:8080/TechHub/postedcontent_readmore.jsp?postId=<%=post.getPostId()%>" data-width="" data-numposts="5"></div>
                </div>
            </div>
        </div>
    </div>





    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/javascript.js" type="text/javascript"></script><!-- Custom java script -->
    <!--Sweet alert CDN  URL(https://cdnjs.com/libraries/sweetalert)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


</body>
</html>
