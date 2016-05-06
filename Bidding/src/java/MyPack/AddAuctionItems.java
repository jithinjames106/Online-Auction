/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author User
 */
public class AddAuctionItems extends HttpServlet {

    ServletConfig config;
    HttpSession session;

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
        config = getServletConfig();
        System.out.println("Inside insert code");
        try {

            session = request.getSession();
            int regid = (Integer) session.getAttribute("regid");
            String itemname = "";
            int itemprice = 0;
            String date = "";
            String time = "";
            int catid = 0;
            String itempic = "";

            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (!isMultipart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException ex) {
                    Logger.getLogger(AddAuctionItems.class.getName()).log(Level.SEVERE, null, ex);
                }
                Iterator itr = items.iterator();
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        if (name.equals("itemname")) {
                            itemname = value;
//            		 	count1=1;
                            System.out.println("name = " + itemname);
                        }
                        if (name.equals("itemprice")) {
                            itemprice = Integer.parseInt(value);
//                         count2=2;
                            System.out.println("price = " + itemprice);
                        }
                        if (name.equals("itemdate")) {
                            date = value;
//                         count5=5;
                            System.out.println("date = " + date);
                        }
                        if (name.equals("itemtime")) {
                            time = value;
                            // count3=3;
                            System.out.println("time = " + time);
                        }

                        if (name.equals("selectedRecord")) {
//			      		count4=4;
                            catid = Integer.parseInt(value);
                            System.out.println("emp_emailid = " + catid);
                        }

                    } else {
                        try {

                            itempic = item.getName();
                            System.out.println("itemName============" + itempic);
                            File savedFile = new File(config.getServletContext().getRealPath("/") + "../../web/upimage\\" + itempic);
//                            System.out.println(config.getServletContext().getRealPath("/") + "upimage\\" + itempic);
                            item.write(savedFile);

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

            PrintWriter out = response.getWriter();
            DBConnection Db = new DBConnection();
            String sql = "insert into tb_auction_items values(null,'" + itemname + "','" + itemprice + "','" + date + "','" + time + "','0','" + catid + "','" + regid + "','" + itempic + "')";
            System.out.println(sql);
            int row = Db.UpdateQuery(sql);
            if (row > 0) {
                out.print("<script>alert('Successulyy added');</script>");
                response.sendRedirect("viewitems");
               // request.getRequestDispatcher("viewitems").include(request, response);

            } else {
                request.getRequestDispatcher("AddAuctionItemss.jsp").forward(request, response);
                out.print("<script>alert('Failed to Update');</script>");
            }
            Db.Close();
        } catch (Exception ex) {
            Logger.getLogger(AddAuctionItems.class.getName()).log(Level.SEVERE, null, ex);
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
        System.out.println("inside doget");
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
        System.out.println("inside !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!dopost");
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
