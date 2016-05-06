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
import java.sql.SQLException;
import java.util.ArrayList;
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
public class FirstServlet extends HttpServlet {

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
        System.out.println("Inside first()!");
        HttpSession session = request.getSession();
        //session.removeAttribute("Done");
        ArrayList<Product> bt = new ArrayList<Product>();
        ArrayList<Product> bt1 = new ArrayList<Product>();
        java.io.PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        try {
            DBConnection db = new DBConnection();

            String sql = "select * from tb_auction_items where auction_status!=2 limit 4 ";
            ResultSet rs = db.FetchData(sql);
            while (rs.next()) {
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
                bt.add(b);
            }
            
            System.out.println("Inside first()22!");
            //session.removeAttribute("Done");
            String sql1 = "select * from tb_auction_items where auction_status=2 limit 4";
            ResultSet rs1 = db.FetchData(sql1);
            while (rs1.next()) {
                Product b1 = new Product();
                b1.setItem_id(rs1.getInt("item_id"));
                b1.setPname(rs1.getString("item_name"));
                b1.setDate(rs1.getString("open_date"));
                b1.setImg(rs1.getString("itempic"));
                b1.setTime((rs1.getString("open_time")));
                b1.setPrice(rs1.getInt("min_price"));
                // b.setCatObj(rs.getInt(""));
                Category c1 = new Category();
                c1.setId(rs1.getInt("cat_id"));
                b1.setCatObj(c1);
                bt1.add(b1);
            }

//db.Close();
        } catch (Exception e) {
            out.println("Failed!" + e);
        }
//Iterator i=bt.iterator() ;
//while(i.hasNext())
//{
//    out.print(i.next());
//}
        request.setAttribute("bt", bt);
        request.setAttribute("bt1", bt1);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
