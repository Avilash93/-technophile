<%-- 
    Document   : ExceptionHandler
    Created on : 08-Nov-2022, 8:21:18 pm
    Author     : Avilash
--%>
<%@page  isErrorPage="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- Bootstrap CSS CNN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
    </head>
    <body>
     
        <div class="container p-3 text-center">
            <img src="images/error.png" class="img-fluid" />
            <br>
            <h3 class="display-3">Sorry! Something went wrong.</h3>
            <p> <%= exception%></p>
             <a class="btn btn-outline-primary" href="index.jsp">Home Page</a>
        </div>
    </body>
</html>
