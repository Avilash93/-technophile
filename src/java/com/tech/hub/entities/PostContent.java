/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.hub.entities;

import java.sql.Timestamp;

/**
 *
 * @author Avilash
 */
public class PostContent {
    private int postId; 
    private String postTitle; 
    private String postContent; 
    private String postCode; 
    private String postImg; 
    private Timestamp registerDate; 
    private int catId; 
    private int userId; 
    private String refLink;

    public PostContent() {
    }

    public PostContent(int postId, String postTitle, String postContent, String postCode, String postImg, Timestamp registerDate, int catId,String refLink,int userId) {
        this.postId = postId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postCode = postCode;
        this.postImg = postImg;
        this.registerDate = registerDate;
        this.catId = catId;
        this.refLink=refLink;
        this.userId = userId;
    }

    public PostContent(String postTitle, String postContent, String postCode, String postImg, int catId,String  refLink ,int userId) {
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postCode = postCode;
        this.postImg = postImg;
        
        this.catId = catId;
         this.refLink=refLink;
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode ;
    }

    public String getPostImg() {
        return postImg;
    }

    public void setPostImg(String postImg) {
        this.postImg = postImg;
    }

    public Timestamp getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Timestamp registerDate) {
        this.registerDate = registerDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRefLink() {
        return refLink;
    }

    public void setRefLink(String refLink) {
        this.refLink = refLink;
    }
    
}
