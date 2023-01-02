/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.hub.dao;

import com.tech.hub.helper.ConnectionProvider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Avilash
 */
public class LikedDao {
//    Method to keep record of total like.
    public static boolean doLike(int pid,int uid){
        try {
            PreparedStatement pstm=ConnectionProvider.getConnection().prepareStatement("insert into liked(pid,uid)values (?,?)");
            pstm.setInt(1, pid);
            pstm.setInt(2, uid);
            if(pstm.executeUpdate() >0){
                return true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    } 
    
    
//    Method to keep record of total like on a single post by post Id.
    public static int countLike(int pid){
        int count=0;
        try {
            PreparedStatement pstm=ConnectionProvider.getConnection().prepareStatement("select count(*) from liked where pid=?");
            pstm.setInt(1, pid);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
                count=rs.getInt(1);
                return count;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    } 
    
    
//    Method to check if user has already like a post or not.
    public static boolean isLikedByUser(int pid,int uid){
        int count=0;
        try {
            PreparedStatement pstm=ConnectionProvider.getConnection().prepareStatement("select * from liked where pid=? and uid=?");
            pstm.setInt(1, uid);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    } 
    
    
//    Method to delete like from [liked] table --Just like dislike function.
    public static boolean deleteLike(int pid,int uid){
        int count=0;
        try {
            PreparedStatement pstm=ConnectionProvider.getConnection().prepareStatement("delete from liked where pid=? and uid=?");
            pstm.setInt(1, pid);
            pstm.setInt(2, uid);
            ResultSet rs=pstm.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    } 
    
    
}
