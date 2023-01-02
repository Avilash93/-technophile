/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.hub.servlets;

import com.tech.hub.dao.UsersDao;
import com.tech.hub.entities.Message;
import com.tech.hub.entities.Users;
import com.tech.hub.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
public class EditProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("user_gender");
            String about = request.getParameter("user_about");
            Part part = request.getPart("user_profile_img");
            String newFile = part.getSubmittedFileName();
            String rootDir = request.getRealPath("/");

            HttpSession session = request.getSession();
            Users sessionUser = (Users) session.getAttribute("currentUser");

            //get ID from session bcoz we did't show ID row in edit profile table form.
            int Id = sessionUser.getId();//set it to Users entities and than send to UsersDao 
            //First must get ID and pass To UsersDAO to update by primary key i.e ID
            String oldFile = sessionUser.getProfile();//Return old file name 
//            Use old file name to delete old file from disk

            String newPath = rootDir + File.separator + "images" + File.separator + "profile" + File.separator + newFile;
            String oldPath = rootDir + File.separator + "images" + File.separator + "profile" + File.separator + oldFile;
            String imgDir=rootDir + File.separator + "images" + File.separator + "profile" + File.separator;
            
            Users user=null;
           if(!  newPath.equals(imgDir)){ //If no file/image is uploaded
               
           user = new Users(Id, name, email, password, gender, about, newFile);
              sessionUser.setProfile(newFile);
           }else{
                user = new Users(Id, name, email, password, gender, about, oldFile);
                  sessionUser.setProfile(oldFile);
           }

            boolean istrue = UsersDao.updateUsers(user);
            //If update successfully than set session [sessionUsers] and set it to HttpSession

            if (istrue == true) {
                //if updated successfully than set/override [Users] instance variable
                sessionUser.setId(Id);
                sessionUser.setName(name);
                sessionUser.setEmail(email);
                sessionUser.setPasssword(password);
                sessionUser.setGender(gender);
                sessionUser.setAbout(about);
//                sessionUser.setProfile(newFile);
                    System.out.println("Old file:"+oldFile);
             
             
                    Helper.saveImage(part.getInputStream(), newPath, oldPath,oldFile);
                

                //set session with updated [Users] entitties
                session.setAttribute("currentUser", sessionUser);

                //set alert to [EditProfile] that profile is updated or not.
                Message msg = new Message("Profile updated successfully.", "success", "alert alert-success");
                session.setAttribute("msg", msg);
                //send redirect to profile.jsp 
                response.sendRedirect("profile.jsp");
            }
            
            
            
            else {

                //set alert to [EditProfile] that profile is updated or mot.
                Message msg = new Message("Failed to update profile.", "failure", "alert alert-danger");
                session.setAttribute("msg", msg);
                //send redirect to profile.jsp 
                response.sendRedirect("profile.jsp");
            }

        }
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
