/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.hub.dao;


import com.tech.hub.entities.Categories;
import com.tech.hub.entities.PostContent;
import com.tech.hub.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Avilash
 */
public class PostContentDao {
    
    //method to get all category type.When profile.jsp page is loaded the category type will updated in WRITE a POst content modal
    public  ArrayList<Categories> getAllCategories(){
        ArrayList<Categories> list=new ArrayList<Categories> () ;
        
        try{
            
            Connection con= ConnectionProvider.getConnection();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from categories");
            while(rs.next()){
                int cId=rs.getInt("Cat_Id");
                String cName=rs.getString("Name");
                String cDesc=rs.getString("Description");
                Categories cat=new Categories(cId,cName,cDesc);
                list.add(cat);
            }
            st.close();
   
        }catch(Exception e){e.printStackTrace();}
        return list;
    }
    //method to insert posted content by user to DB
    public static boolean setPostedContent(PostContent postContent){
        
        try {
            Connection con=ConnectionProvider.getConnection();
            PreparedStatement  pstm=con.prepareStatement("insert into post_content(PostTitle,PostContent,CODE,Img,CatId,URL,UserId) values(?,?,?,?,?,?,?)");
            pstm.setString(1, postContent.getPostTitle());
            pstm.setString(2, postContent.getPostContent());
            pstm.setString(3, postContent.getPostCode());
            pstm.setString(4, postContent.getPostImg());
            pstm.setInt(5, postContent.getCatId());
            pstm.setString(6, postContent.getRefLink());
            pstm.setInt(7, postContent.getUserId());
            int rc=pstm.executeUpdate();
            if(rc>0)
            {
                return true;
            }
            pstm.close();
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return false;
    }
    //method to get all categories posted content
    public static List<PostContent> getAllContent(){
        List<PostContent> list=new ArrayList<>();
        try {
            PreparedStatement pstm=ConnectionProvider.getConnection().prepareStatement("select * from post_content order by PostId desc");
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                int postId=rs.getInt("PostId");
                String postTitle=rs.getString("postTitle");
                String postContent=rs.getString("postContent");
                String postCode=rs.getString("CODE");
                String postImg=rs.getString("Img");
                Timestamp postRegisterDate=rs.getTimestamp("RegisterDate");
                int CatId=rs.getInt("CatId");
                String URL=rs.getString("URL");
                int UserId=rs.getInt("UserId");
                PostContent post=new PostContent(postId, postTitle, postContent, postCode, postImg, postRegisterDate, CatId, URL, UserId);
                list.add(post);
            
            }   
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list; 
    }
    
    
    //method to get specific  category posted content by category ID
    public static List<PostContent> getContentByCatId(int catId){
        List<PostContent> list=new ArrayList<>();
        try {
            PreparedStatement pstm=ConnectionProvider.getConnection().prepareStatement("select * from post_content where CatId=?");
            pstm.setInt(1, catId);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                int postId=rs.getInt("PostId");
                String postTitle=rs.getString("postTitle");
                String postContent=rs.getString("postContent");
                String postCode=rs.getString("CODE");
                String postImg=rs.getString("Img");
                Timestamp postRegisterDate=rs.getTimestamp("RegisterDate");
                int CatId=rs.getInt("CatId");
                String URL=rs.getString("URL");
                int UserId=rs.getInt("UserId");
                PostContent post=new PostContent(postId, postTitle, postContent, postCode, postImg, postRegisterDate, CatId, URL, UserId);
                list.add(post);
            
            }   
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list; 
    }
    
    
    //method to get specific   post content by Post ID [postedcontent_readmore.jsp]
    public static PostContent getContentByPostId(int post_Id){
        PostContent post=new PostContent();
        try {
            PreparedStatement pstm=ConnectionProvider.getConnection().prepareStatement("select * from post_content where PostId=?");
            pstm.setInt(1, post_Id);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                int postId=rs.getInt("PostId");
                String postTitle=rs.getString("postTitle");
                String postContent=rs.getString("postContent");
                String postCode=rs.getString("CODE");
                String postImg=rs.getString("Img");
                Timestamp postRegisterDate=rs.getTimestamp("RegisterDate");
                int CatId=rs.getInt("CatId");
                String URL=rs.getString("URL");
                int UserId=rs.getInt("UserId");
                 post=new PostContent(postId, postTitle, postContent, postCode, postImg, postRegisterDate, CatId, URL, UserId);
               
            
            }   
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return post; 
    }
    
    
}
