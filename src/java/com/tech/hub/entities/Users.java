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
public class Users {
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp dateAndTime;
    private String profile;

    public Users(String name, String email, String passsword, String gender, String about) {
        this.name = name;
        this.email = email;
        this.password = passsword;
        this.gender = gender;
        this.about = about;
    }

    public Users(int id, String name, String email, String password, String gender, String about, String profile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    
        this.profile = profile;
    }

 

    public Users() {
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPasssword(String passsword) {
        this.password = passsword;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getDateAndTime() {
        return dateAndTime;
    }

    public void setDateAndTime(Timestamp dateAndTime) {
        this.dateAndTime = dateAndTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    @Override
    public String toString() {
        return "Users{" + "id=" + id + ", name=" + name + ", email=" + email + ", passsword=" + password + ", gender=" + gender + ", about=" + about + ", dateAndTime=" + dateAndTime + ", profile=" + profile + '}';
    }

   
    
}
