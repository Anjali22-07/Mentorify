/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
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

//servlet to fetch data and store it in db
@MultipartConfig    //servlet ko extra information de di hai with the help of annotations
public class AddPostServlet extends HttpServlet {

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
           
            int cid=Integer.parseInt(request.getParameter("cid"));
            String Ptitle=request.getParameter("PTitle");
            String Desc=request.getParameter("des");
            String Code=request.getParameter("code1");
            //user id fetch krenge session ki help se
            
                HttpSession s=request.getSession();
                 User user=(User)s.getAttribute("currentUser");
                    Part part=request.getPart("pic");
                    
                //ek object create krenge post ka 
                //isme--
                
                
                Posts p=new Posts(Ptitle, Desc, Code,part.getSubmittedFileName(),null,cid, user.getId());
                //is post ke paas saara data hai which will be saved in database
                
                    PostDao pd=new PostDao(ConnectionProvider.getConnection());
                    if(pd.savePost(p)){
                        
            
                 //to save photos
                 
                  String path1=request.getRealPath("/")+"blog"+File.separator+part.getSubmittedFileName();
                    Helper.saveFile(part.getInputStream(), path1);
                    out.println("done");
                    }
                    else{
                        out.println("Error!!");
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
