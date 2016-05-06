/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class biddata extends HttpServlet {

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
        HttpSession session = request.getSession();
        // System.out.println( session.getAttribute("Done"));
        PrintWriter out1 = response.getWriter();
        System.out.println("inside biddata");
        //System.out.println( session.getAttribute("Done"));
        int regid = (int) session.getAttribute("regid");
        //System.out.println("+++++++++"+regid);
        int itemid = Integer.parseInt(request.getParameter("itemid"));
        //System.out.println("============"+itemid);
        int bidamount = Integer.parseInt(request.getParameter("bidamount"));
        //System.out.println("============"+bidamount);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now = new Date();
        String strDate = sdf.format(now);
        System.out.println(strDate);
     
        try {
            DBConnection db = new DBConnection();
            String s = "select min_price from tb_auction_items where item_id='" + itemid + "'";
            ResultSet res = db.FetchData(s);
            if (res.next()) {
                System.out.println("1 "+bidamount+res.getFloat("min_price"));
                       
                if (bidamount < res.getFloat("min_price")) {
                    //System.out.println("2");
                session.setAttribute("amt_status", "no");        
                } else {
                    String sql = "insert into tb_auction values(null,'" + itemid + "','" + regid + "','" + bidamount + "','" + strDate + "')";
                    System.out.println(sql);
                    db.UpdateQuery(sql);
                    // session.setAttribute("Done", "yes");
                    String sql1 = "update tb_auction_items set auction_status=1 where item_id='" + itemid + "'";
                    db.UpdateQuery(sql1);
                    db.Close();
                  session.removeAttribute("amt_status");
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        request.getRequestDispatcher("individualItems").include(request, response);
        //response.sendRedirect("individualItemDisplay.jsp");

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
