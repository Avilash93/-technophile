/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.hub.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 *
 * @author Avilash
 */
public class Helper {

    //method to delete profile image before updating
   // Method to delete image from disk 
    public static void deleteProfileImg(String oldPath, String oldFile) {

        try {
             System.out.println("Old path:" + oldPath);
             System.out.println("Old File:" + oldFile);
            if (!  oldFile.equals("default.png")) {   //Important to validate this to avoid being deleted [default.png]
                File file = new File(oldPath);
                if (file.exists()) { //if file is not presnet than
                    file.delete();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //Method to update profile image
    //Method to save image on disk 
    public static void saveImage(InputStream is, String newPath, String oldPath, String oldFile) throws IOException {
        try {
           
            System.out.println("New path:" + newPath);
            File file = new File(newPath);
            //updatre if file is not present already in this path

            if (!file.exists() && !file.isDirectory()) {
                byte[] buffer = new byte[is.available()];
                //The java.io.InputStream.read(byte[] b) method reads b.length number of bytes from the input stream to the buffer array b.
                is.read(buffer); //buffer   the buffer into which the data is read.
                FileOutputStream fos = new FileOutputStream(newPath);
//            After new file is cereated delete old file 
                deleteProfileImg(oldPath, oldFile);
                fos.write(buffer);

                fos.flush();
                fos.close();

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // releases system resources associated with this stream
            if (is != null) {
                is.close();
            }
        }
    }
    
     // Method to delete image from disk 
    public static void deleteImg(String path) {

        try {
            File file = new File(path);
                if( ! file.isDirectory()){
                    
                    file.delete();
                }
                
                
                
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //Method to save image on disk 
    public static void saveImageToDisk(InputStream is, String path) throws IOException {
        try {
           
            
            File file = new File(path);
            //updatre if file is not present already in this path

            if (! file.isDirectory() &&! file.exists()) {
                byte[] buffer = new byte[is.available()];
                //The java.io.InputStream.read(byte[] b) method reads b.length number of bytes from the input stream to the buffer array b.
                is.read(buffer); //buffer   the buffer into which the data is read.
                FileOutputStream fos = new FileOutputStream(path);
//            After new file is cereated delete old file 
              
                fos.write(buffer);

                fos.flush();
                fos.close();

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // releases system resources associated with this stream
            if (is != null) {
                is.close();
            }
        }
    }
}
