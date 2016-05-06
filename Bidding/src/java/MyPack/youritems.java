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
public class youritems extends HttpServlet {

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
        ArrayList<Product> bt = new ArrayList<Product>();

        try {
            HttpSession session=request.getSession();
            int regid=(Integer)session.getAttribute("regid");
            DBConnection db = new DBConnection();

            String sql = "select * from tb_auction_items where reg_id='"+regid+"'";
            System.out.println(sql);
            ResultSet rs = db.FetchData(sql);
            while (rs.next()) {
                 System.out.println("2");
                Product b = new Product();
                b.setItem_id(rs.getInt("item_id"));
                b.setPname(rs.getString("item_name"));
                b.setDate(rs.getString("open_date"));
                b.setImg(rs.getString("itempic"));
                b.setTime((rs.getString("open_time")));
                b.setPrice(rs.getInt("min_price"));
               // b.setCatObj(rs.getInt(""));
                Category c= new Category();
                c.setId(rs.getInt("cat_id"));
                b.setCatObj( c);
                
                bt.add(b);
            }
            db.Close();
        }catch(Exception e){
            System.out.println(e);
        }
         request.setAttribute("bt", bt);
        request.getRequestDispatcher("yourAuc_items.jsp").forward(request, response);
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
