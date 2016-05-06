/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class CustomerQuit extends HttpServlet {

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
            out.println("<title>Servlet CustomerQuit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerQuit at " + request.getContextPath() + "</h1>");
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
        //  processRequest(request, response);
        try {
            HttpSession session = request.getSession();
            int regid = (Integer) session.getAttribute("regid");

            String msg = "";
            DBConnection db = new DBConnection();
            String sql1 = "select * from tbl_winners where item_id in (select item_id from tb_auction where reg_id=" + regid + ")";
            System.out.println("inside quite" + sql1);
            ResultSet rs1 = db.FetchData(sql1);
            System.out.println("1");
            if (!rs1.next()) {
                 System.out.println("2");
                String sql2 = "select item_id from tb_auction_items where reg_id=" + regid + " and auction_status!=2";
                System.out.println("inside quite" + sql2);
                ResultSet rs2 = db.FetchData(sql2);
                
                if (!rs2.next()) {
                    System.out.println("inside quite .. inside if");
                    String sql = "update tb_login set status=2 where reg_id=" + regid;
                    int row = db.UpdateQuery(sql);
                    db.Close();
                    msg = "YOU LEFT YOUR ACCOUNT.";
                    response.sendRedirect("index.jsp?msg=" + msg);
                    //session.invalidate();
                } else {
                    msg = "CURRENTLY YOU CANT LEAVE BidNShop";
                    response.sendRedirect("home.jsp?msg=" + msg);
                }
                db.Close();
            } else {
                msg = "CURRENTLY YOU CANT LEAVE BidNShop";
                response.sendRedirect("home.jsp?msg=" + msg);
              
            } 
             db.Close();//  request.get
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Customerlogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Customerlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        // processRequest(request, response);

//        try {
//            HttpSession session = request.getSession();
//            int regid = (Integer) session.getAttribute("regid");
//
//            String msg = "";
//            DBConnection db = new DBConnection();
//            String sql1 = "select * from tbl_winners where item_id in (select item_id from tb_auction where reg_id="+regid+");";
//            System.out.println("inside quite: "+sql1);
//            ResultSet rs1 = db.FetchData(sql1);
//            boolean val1 = rs1.next();
//            db.Close();
//            String sql2 = "select item_id from tb_auction_items where regid="+regid+" and auction_status=0";
//            System.out.println("inside quite : "+sql2);
//            ResultSet rs2 = db.FetchData(sql2);
//            boolean val2 = rs2.next();
//            db.Close();
//            System.out.println("inside quite : "+val1+val2);
//            if (val1 == false && val2 == false) {
//                System.out.println("inside quite .. inside if");
//                String sql = "update tbl_login set status=2 where reg_id="+regid;
//                int row = db.UpdateQuery(sql);
//                db.Close();
//                msg = "now left from your account ";
//                 response.sendRedirect("home.jsp?"+msg); 
//                 session.invalidate();
//            } else {
//                msg = "you can't leave from BidNShop";
//                 response.sendRedirect("index.jsp?"+msg); 
//            }
//            response.sendRedirect(""); 
//          //  request.get
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(Customerlogin.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(Customerlogin.class.getName()).log(Level.SEVERE, null, ex);
//        }
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
