/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import BEntities.Category;
import BEntities.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class individualItems extends HttpServlet {

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
        int itemid = Integer.parseInt(request.getParameter("itemid"));
        System.out.println("============" + itemid);
        //response.sendRedirect("individualItemDisplay.jsp");

        System.out.println("Inside individualitems()!");
        HttpSession session = request.getSession();
        // String s = (String) session.getAttribute("Done");
        //System.out.println("+++++++++++++++++++++++++++++++" + s);
        //session.removeAttribute("Done");
        //String s1 = (String) session.getAttribute("Done");
        //System.out.println("+++++++++++++++++++++++++++++++" + s1);
        ArrayList<Product> bt = new ArrayList<Product>();

        java.io.PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        try {
            DBConnection db = new DBConnection();

            String sql = "select * from tb_auction_items where item_id='" + itemid + "' and (auction_status=0 or auction_status=1) ";
            ResultSet rs = db.FetchData(sql);
//            String sql1= "select max(bid_amount) from tb_auction where item_id='"+itemid+"'";
//            ResultSet rs1=db.FetchData(sql1);
            if (rs.next()) {
                Product b = new Product();
                b.setItem_id(rs.getInt("item_id"));
                b.setPname(rs.getString("item_name"));
                b.setDate(rs.getString("open_date"));
                b.setImg(rs.getString("itempic"));
                b.setTime((rs.getString("open_time")));
                b.setPrice(rs.getInt("min_price"));
                // b.setCatObj(rs.getInt(""));
                Category c = new Category();
                c.setId(rs.getInt("cat_id"));
                b.setCatObj(c);
                String sql1 = "select bid_amount from tb_auction where item_id='" + itemid + "' and bid_amount=(select max(bid_amount) from tb_auction where item_id='" + itemid + "')";
                ResultSet rs1 = db.FetchData(sql1);
                if (rs1.next()) {

                    b.setMaxamount(rs1.getFloat("bid_amount"));
                } else {
                    b.setMaxamount(0.0F);
                }
                bt.add(b);
                db.Close();
            }
            request.setAttribute("msg111", "");

            db.Close();
        } catch (Exception e) {
            out.println("Failed!" + e);

        }
        if(session.getAttribute("amt_status")=="no" || session.getAttribute("amt_status")!=null)          
        {
            System.out.println("inside sesionnnnnn");
           PrintWriter out1= response.getWriter();
           out1.print("<script>document.getElementById('msg111').innerHTML='invalid';<script>");
        }
        request.setAttribute("bt", bt);
        request.getRequestDispatcher("individualItemDisplay.jsp").include(request, response);

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
