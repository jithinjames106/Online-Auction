/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class DBConnection {

    Connection con;
    ResultSet rs;
    Statement st;

    public DBConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3307/as", "root", "root");
    }

    public int UpdateQuery(String sql) throws SQLException {

        st = con.createStatement();
        int r = st.executeUpdate(sql);
        return r;
    }

    public ResultSet FetchData(String sql) throws ClassNotFoundException, SQLException {
        st = con.createStatement();
        rs = st.executeQuery(sql);
        return rs;
    }
    public void Close() throws SQLException
    {
        con.close();
    }
}
