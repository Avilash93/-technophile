<%@page  import="com.tech.hub.entities.Users" %>
<%@page  import="com.tech.hub.entities.*" %>
<%@page  import="com.tech.hub.dao.*" %>
<%@page  import="java.util.*" %>

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
        out.print("<p class='display-3 text-center ml-5'>No post in this category.</p>");
        return;
        }
        for(PostContent postContent:list){
    %>

    <div class="col-sm-6">
        <div class="card mb-3 ">
                    <div class="embed-responsive embed-responsive-16by9">
                        <img alt="Jpg Image" class="card-img-top embed-responsive-item " src="images/posted/<%=postContent.getPostImg()%>" />
                    </div>
            <div class="card-body">
                    <h3 style="font-size: 16px;font-weight: bold"><%=postContent.getPostTitle()%></h3><hr>
                    <p style="font-size:14px"><%=postContent.getPostContent()%></p>
            </div> 
            <div class="card-footer">
                <a href="#!" class="btn btn-outline-success btn-sm " type="submit">Read more..</a>
                <a href="#!" class="btn btn-outline-success btn-sm ml-1" type="submit"><i class="fa fa-thumbs-o-up"> 10</i></a>
                <a href="#!" class="btn btn-outline-success btn-sm ml-1" type="submit"><i class="fa fa-commenting-o"> 10</i></a>
            </div>
        </div>
    </div>

    <%
    }
    %>
</div>