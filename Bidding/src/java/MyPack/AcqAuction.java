/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;


import BEntities.Winner;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "AcqAuction", urlPatterns = {"/AcqAuction"})
public class AcqAuction extends HttpServlet {

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
            out.println("<title>Servlet AcqAuction</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AcqAuction at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        
        ArrayList<Winner> bt = new ArrayList<Winner>();

        try {
            HttpSession session=request.getSession();
            int regid=(Integer)session.getAttribute("regid");
            DBConnection db = new DBConnection();

            String sql = "select * from tbl_winners a join tb_auction b on a.auction_id=b.auc_id join tb_auction_items c on  b.item_id= c.item_id join tb_register d on d.reg_id= c.reg_id where b.reg_id='"+regid+"'";
            System.out.println(sql);
            ResultSet rs = db.FetchData(sql);
            while (rs.next()) {
                 System.out.println("2");
                Winner b = new Winner();
               b.setAddress(rs.getString("address"));
               b.setBidDate(rs.getString("biddate"));
               b.setBidamount(rs.getString("bid_amount"));
               b.setFname(rs.getString("fname"));
               b.setLname(rs.getString("lname"));
               b.setPhno(rs.getString("phoneno"));
               b.setProduct_name(rs.getString("item_name"));
               b.setImg(rs.getString("itempic"));
                
                bt.add(b);
            }
            db.Close();
        }catch(Exception e){
            System.out.println(e);
        }
         request.setAttribute("bt", bt);
        request.getRequestDispatcher("acquired_auction.jsp").forward(request, response);
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
