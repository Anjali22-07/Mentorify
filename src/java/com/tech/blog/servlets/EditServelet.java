/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Anjali Singh
 */
@MultipartConfig
public class EditServelet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServelet</title>");            
            out.println("</head>");
            out.println("<body>");
           
            //this updates the changes made in the profile of the user in the database of user table
            
            //fetch all data
            
            //new data by the user
              String useremail=request.getParameter("user_email");
              String password=request.getParameter("user_password");
              String About=request.getParameter("user_about");
              //for profile puicture we create part
              
              Part part=request.getPart("pf");
              
              //jo bhi photo select kiya uska name extract krna hoga
              
              String imageName=part.getSubmittedFileName();  //this method returns the image name with file extension
              
              //fetch the user from the session
              
              HttpSession s=request.getSession();
             User user=(User)s.getAttribute("currentUser");
             
             //the 'currentUser has puraani details which we have to replce with the new data
             
              user.setEmail(useremail);  //jo purani email hogi in user table wo replace ho jaegi is new email se
              user.setPassword(password);
              user.setAbout(About);
              String oldFile=user.getProfile();   //user se user.get profile nikaal lenge...uski puraani file is variable me rkhenge
              user.setProfile(imageName);
              
              
              //upadating the database
              
              //user object ko pass kar denge userDao me
              
              //userDao ke function non static function hai.isliye usko call krne ke liye userDao ka object bnana padega
              
                UserDao userDao=new UserDao(ConnectionProvider.getConnection());
                
                boolean ans= userDao.updateUser(user);
                
                if(ans){
                    out.println("update to db!");
                    
                     String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                    //getRealpath--hme webpages tk le aaega
                    //"pics"--is the folder name
                    //File.separator--ye slash lagaata hai
                    //user.getProfile--hmari file ka naam return krega
                    
                    String path1=request.getRealPath("/")+"pics"+File.separator+oldFile;
                    
                    if(!oldFile.equals("default.png")){   //whii photos delete hongi jo default.png  nhi hai
                    
                    Helper.deleteFile(path1);  //calling the method to delete file
                    }  
                      
                    
                    if( Helper.saveFile(part.getInputStream(), path)){
                           
                           out.println("profile Updated");
                       }
                       else
                       {
                           out.print("profile not updated");
                       }
                    }
                    
                    
                    
                    
                
                else
                {
                    out.println("Not Updated");
                }
            
            
            out.println("</body>");
            out.println("</html>");
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
