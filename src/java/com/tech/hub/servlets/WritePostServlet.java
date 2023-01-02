
package com.tech.hub.servlets;

import com.tech.hub.dao.PostContentDao;
import com.tech.hub.entities.PostContent;
import com.tech.hub.entities.Users;
import com.tech.hub.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author Avilash
 */
@MultipartConfig
@WebServlet(name = "WritePostServlet", urlPatterns = {"/WritePostServlet"})
public class WritePostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
         int cId=Integer.parseInt(request.getParameter("catId"));
//            System.out.println("CATEGORY ID"+cId);
         String pTitle=request.getParameter("postTitle");
         String pContent=request.getParameter("postContent");
         String pCode=request.getParameter("postCode");
         Part part=request.getPart("postImg");
         String pLink=request.getParameter("postLink");
         //get Users Id from HttpSession to insert users id to DB
         HttpSession session=request.getSession();
         Users user=(Users)session.getAttribute("currentUser");
         
//         out.println(pTitle);
//         out.println(pContent);
//         out.println(pCode);
         out.println(part.getSubmittedFileName());
//         out.println(pLink);
//         out.println(user.getId());
        
//         set all posted content to [PostContent]
            PostContent postContent=new PostContent(pTitle, pContent, pCode, part.getSubmittedFileName() , cId,pLink,user.getId());
             //send all Posted Content to PostContentDAO
             //check id data is inserted successfully or not!!
             if(PostContentDao.setPostedContent(postContent)){
                 //Save posted image to disk
                  String path = request.getRealPath("/") + File.separator + "images" + File.separator + "posted" + File.separator + part.getSubmittedFileName();
                  //first delete existing imag with same name
                  Helper.deleteImg(path);
                  //After deleting save file to disk
                  Helper.saveImageToDisk(part.getInputStream(), path);
                 out.println("success");
             }
             else{
                  out.println("failed"); 
             }
             
        }
        catch(Exception e){e.printStackTrace();}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
