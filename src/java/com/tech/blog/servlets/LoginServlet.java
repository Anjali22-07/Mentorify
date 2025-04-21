/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anjali Singh
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            //Login servlet
            
            //fetch username and password from request
            
            String userEmail=request.getParameter("email");
            String password=request.getParameter("pass_word");
            
            //we are checking if any user with this email exist or not.this we will find by userDao method
            //if userDao returns null it means any user with such email does not exists
            //else if userDao returns the email fetched....the login portal open
            
            
            //to call this we create object of userDao
            
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            
            User u=dao.getUserByEmailandPassword(userEmail, password);
            if(u==null){
                //login errorr.....
               // out.println("Invalid Details...try again");
               
               Message msg=new Message("Invalid Details! Try with Another","error","alert-danger") ; //message ka object create krenge
           //iss msg ko login page pe leke jaenge
           HttpSession s=request.getSession();   //message session me store krke login page pr send krenge
           s.setAttribute("msg", msg);
           
               response.sendRedirect("login.jsp");  //to stay on the login page
            
            }
            else{
                //....login success
                //in case login success hogya..yo session ka ek object create krenge..that session will stay jb tk user login hai
            
                HttpSession s=request.getSession();
                s.setAttribute("currentUser",u);
                response.sendRedirect("profile.jsp"); //if profile.jsp opens..that means the  value is sent to the session. user will be logged in jbtk session me value rhega
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
