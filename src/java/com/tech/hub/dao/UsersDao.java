/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.hub.dao;

import com.tech.hub.entities.Users;
import com.tech.hub.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Avilash
 */
public class UsersDao {

    //Insert users sign up Details
    public static boolean setUsers(Users user) {
        try {

            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pstm = con.prepareStatement("insert into users(Name,email,Password,Gender,About) values(?,?,?,?,?)");
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            pstm.setString(4, user.getGender());
            pstm.setString(5, user.getAbout());
            int rc = pstm.executeUpdate();
            if (rc > 0) {
                pstm.close();

                return true;
            }
            pstm.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //Get Users regitser details [SIGN FORM]
    public static Users getUsers(String email, String password) {
        Users user = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pstm = con.prepareStatement("select * from users where Email=? and Password=?");
            pstm.setString(1, email);
            pstm.setString(2, password);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                
                user = new Users();
                user.setId(rs.getInt("Id"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPasssword(rs.getString("Password"));
                user.setGender(rs.getString("Gender"));
                user.setAbout(rs.getString("About"));
                user.setDateAndTime(rs.getTimestamp("RegisterDate"));
                user.setProfile(rs.getString("Profile"));

            } else {
                System.out.println("Outside getaUsers() ELSE");
            }

            pstm.close();
           

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    //Get Users regitser details
    public static boolean updateUsers(Users user) {

        try {
            Connection con = ConnectionProvider.getConnection();

            PreparedStatement pstm = con.prepareStatement("update users set Name=?, Email=?, Password=?, Gender=?,  About=?, Profile=?   where Id=?");

//            String sql = " update users set Name='" + user.getName() + "', Email='" + user.getEmail() + "', Password='" + user.getPassword() + "', Gender='" + user.getGender() + "',  About='" + user.getAbout() + "'   where Id='" + user.getId() + "'";
//            Statement st = con.prepareStatement(sql);
//            int rc=st.executeUpdate(sql);
            
           
            
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            pstm.setString(4, user.getGender());
            pstm.setString(5, user.getAbout());
            pstm.setString(6, user.getProfile());
            pstm.setInt(7,user.getId());
            int rc = pstm.executeUpdate();


            if (rc > 0) {
//                System.out.println("UpdateUsers Dao ID:" + user.getId());
//                System.out.println("Rows impacted: "+rc);
//``              con.commit();
//                st.close();
                return true;
            } else {
                System.out.println("Failed to update  ID:" + user.getId());

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

     //Get Users regitser details by user ID[postedcontent_readmore.jsp] and [posted_content.jsp]
    public static Users getUsersByUserId(int id) {
        Users user = null;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement pstm = con.prepareStatement("select * from users where Id=?");
            pstm.setInt(1, id);
            
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                
                user = new Users();
                user.setId(rs.getInt("Id"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPasssword(rs.getString("Password"));
                user.setGender(rs.getString("Gender"));
                user.setAbout(rs.getString("About"));
                user.setDateAndTime(rs.getTimestamp("RegisterDate"));
                user.setProfile(rs.getString("Profile"));

            } else {
                System.out.println("Outside getaUsers() ELSE");
            }

            pstm.close();
           

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
