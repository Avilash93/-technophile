<%-- 
    Document   : posted_content
    Created on : 20-Nov-2022, 5:01:10 pm
    Author     : Avilash
--%>
<%@page  import="com.tech.hub.entities.Users" %>
<%@page  import="com.tech.hub.entities.*" %>
<%@page  import="com.tech.hub.dao.*" %>
<%@page  import="java.util.*" %>
<%@page  import="java.text.DateFormat" %>



<div class="row">
    <% 
        
        int cId=Integer.parseInt(request.getParameter("cid"));
        List<PostContent> list=null;
        if(cId ==0){
       list=PostContentDao.getAllContent();
        }
        else{
        list=PostContentDao.getContentByCatId(cId);
        }
      
        if(list.size() == 0){
        out.print("<p class='display-3 text-center ml-5 text-white'>No post in this category.</p>");
        return;
        }
        for(PostContent postContent:list){
    %>

    <div class="col-sm-6">
        <div class="card mb-3 ">
                  
                    <div class="card-header bg-primary-welcome text-white">
                        <h3  class="post-title" style="font-size: 16px;font-weight: bold"><%=postContent.getPostTitle()%></h3>
                    </div>
            <div class="card-body">                    
                    <p class="post-content" style="font-size:14px"><%=postContent.getPostContent()%></p>
                    <a href="postedcontent_readmore.jsp?postId=<%=postContent.getPostId()%>" class=" " type="submit" style="font-size: 13px">Read more...</a>  
            </div> 
            <div class="card-footer ">
                <div class="row">
                    <div class="col-sm-8">
                        <%Users u=(Users)  session.getAttribute("currentUser");%>
                <a href="#!" onclick="doLike(<%=postContent.getPostId()%>, <%=u.getId()%>)" class="btn btn-outline-success btn-sm " type="submit"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%=LikedDao.countLike(postContent.getPostId())%></span></a>
                <a href="#!" class="btn btn-outline-success btn-sm ml-1" type="submit"><i class="fa fa-commenting-o"> 10</i></a>
                    </div>
                    <div class="col-sm-4">
                             <p style="font-size: 13px">Posted by: <a href="#!"><%=UsersDao.getUsersByUserId(postContent.getUserId()).getName()%></a></p>
                                <p style="font-size: 12px; margin-top: -14px"><%= DateFormat.getDateInstance().format(postContent.getRegisterDate())%></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
    }
    %>
</div>
