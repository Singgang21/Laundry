/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package laundryku.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import laundryku.helper.DBConnection;

/**
 *
 * @author Galiley dan Hafiz
 */
public class Login {
    private Connection con;
    DBConnection conn;
    
    public Login() {
        conn = new DBConnection();
        conn.connect();
    }
    
    public ResultSet login(String username,String password) {
        con = conn.getKoneksi();
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM tb_admin " + "WHERE username = '" + username + "' AND password = '" + password + "'";
            Statement s = con.createStatement();
            rs = s.executeQuery(query);
            return rs;
        } catch (SQLException e) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, e);
            return rs;
        }
    }
}
