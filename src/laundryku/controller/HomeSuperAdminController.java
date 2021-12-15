/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package laundryku.controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import laundryku.model.Admin;
import laundryku.model.HomeSuperAdminModel;
import laundryku.model.Person;
import laundryku.model.Transaksi;
import laundryku.view.AddAdminView;
import laundryku.view.EditAdminView;
import laundryku.view.HomeSuperAdminView;

/**
 *
 * @author Galiley dan Hafiz
 */
public class HomeSuperAdminController extends MouseAdapter implements ActionListener {
    HomeSuperAdminView view;
    HomeSuperAdminModel model;
    AddAdminView addView;
    EditAdminView editView;
    ArrayList<Transaksi> dafTransaksi = new ArrayList();
    
    public HomeSuperAdminController(String nama) {
        view = new HomeSuperAdminView();
        model = new HomeSuperAdminModel();
        showDataAdmin();
        showDataPelanggan();
        showDataTransaksi();
        view.addActionListener(this);
        view.setVisible(true);
        view.setLabelHi(nama);
    }
    
    public void addAdmin() {
        String username = addView.getTfUsername();
        String password = addView.getTfPassword();
        String role = Integer.toString(addView.getCbRole().getSelectedIndex());
        String nama = addView.getTfNama();
        String alamat = addView.getTfAlamat();
        String noTelp = addView.getTfNoTelp();
        boolean bgNotNull = addView.getRadioLk().isSelected() || 
            addView.getRadioPr().isSelected();
        boolean userExist = false;
        try {
            userExist = model.usernameExist(username).next();
        } catch (SQLException ex) {
            Logger.getLogger(HomeSuperAdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (username.equals("") || password.equals("") || nama.equals("")
            || alamat.equals("") || noTelp.equals("") || !bgNotNull)
            JOptionPane.showMessageDialog(addView, "Lengkapi data",
                "Error", JOptionPane.WARNING_MESSAGE);
        else {
            if (username.length() < 5 || password.length() < 5)
                JOptionPane.showMessageDialog(addView, "Username atau password invalid! (min. 5)", 
                    "Error", JOptionPane.WARNING_MESSAGE);
            else if (nama.length() < 3)
                JOptionPane.showMessageDialog(addView, "Nama invalid!", 
                    "Error", JOptionPane.WARNING_MESSAGE);
            else if (alamat.length() < 3)
                JOptionPane.showMessageDialog(addView, "Alamat invalid!", 
                    "Error", JOptionPane.WARNING_MESSAGE);
            else if (noTelp.length() < 12)
                JOptionPane.showMessageDialog(addView, "No. Telp. invalid!", 
                    "Error", JOptionPane.WARNING_MESSAGE);
            else {
                if (userExist)
                    JOptionPane.showMessageDialog(addView, "Username sudah ada!", 
                    "Error", JOptionPane.WARNING_MESSAGE);
                else {
                    String jk = addView.getJK();
                    Admin a = new Admin(nama,alamat,noTelp,jk,username,password,role,dafTransaksi);
                    model.insertAdmin(a);
                    JOptionPane.showMessageDialog(addView, "Berhasil menambahkan " + nama, 
                        "Sukses", JOptionPane.INFORMATION_MESSAGE);
                    addView.dispose();
                    resetForm();
                    showDataAdmin();
                }
            }
        }
    }
    
    public void showDataAdmin() {
        ArrayList<Admin> dafAdmin = model.loadDataAdmin();
        String kolom[] = {"No.", "Username", "Nama", "Alamat", 
            "No. Telp", "Jenis Kelamin", "Role"};
        DefaultTableModel dtm = new DefaultTableModel(null, kolom) {
            @Override
            public boolean isCellEditable(int rowIndex, int mColIndex) {
                return false;
              }
        };
        for (int i = 0; i < dafAdmin.size(); i++) {
            String no = Integer.toString((i+1));
            String username = dafAdmin.get(i).getUsername();
            String nama = dafAdmin.get(i).getNama();
            String alamat = dafAdmin.get(i).getAlamat();
            String noTelp = dafAdmin.get(i).getNoTelp();
            String jk = dafAdmin.get(i).getJenisKelamin();
            String role;
            if (dafAdmin.get(i).getRole().equals("1"))
                role = "Super Admin";
            else
                role = "Admin";
            String data[] = {no,username,nama,alamat,noTelp,jk,role};
            dtm.addRow(data);
        }
        view.getTableAdmin().setModel(dtm);
    }
    
    private void showDataPelanggan() {
        ResultSet rs = model.loadDataPelanggan();
        String kolom[] = {"Nama", "Alamat", "No Telp", "Jenis Kelamin", 
            "Total Transaksi"};
        DefaultTableModel dtm = new DefaultTableModel(null, kolom) {
            @Override
            public boolean isCellEditable(int rowIndex, int mColIndex) {
                return false;
              }
        };
        try {
            while (rs.next()) {
                String nama = rs.getString(1);
                String alamat = rs.getString(2);
                String no = rs.getString(3);
                String jk = rs.getString(4);
                String total = rs.getString(5);
                
                String data[] = {nama,alamat,no,jk,total};
                dtm.addRow(data);
            }
            view.getTablePelanggan().setModel(dtm);
        } catch (SQLException ex) {
            Logger.getLogger(HomeSuperAdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateDataAdmin() {
//        int selectedData = view.getTableAdmin().getSelectedRow();
//        System.out.println(selectedData);
//        
//        if (selectedData == -1) {
//            JOptionPane.showMessageDialog(view, "Silahkan pilih admin yang akan di edit",
//                "Error", JOptionPane.WARNING_MESSAGE);
//        } else {
//            
//        }
//        String username = editView.getTfUsername();
//        String password = editView.getTfPassword();
//        String role = Integer.toString(addView.getCbRole().getSelectedIndex());
//        String nama = editView.getTfNama();
//        String alamat = editView.getTfAlamat();
//        String noTelp = editView.getTfNoTelp();
//        boolean bgNotNull = editView.getRadioLk().isSelected() || 
//            editView.getRadioPr().isSelected();
//        boolean userExist = false;
//        try {
//            userExist = model.usernameExist(username).next();
//        } catch (SQLException ex) {
//            Logger.getLogger(HomeSuperAdminController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        if (username.equals("") || password.equals("") || nama.equals("")
//            || alamat.equals("") || noTelp.equals("") || !bgNotNull)
//            JOptionPane.showMessageDialog(editView, "Lengkapi data",
//                "Error", JOptionPane.WARNING_MESSAGE);
//        else {
//            if (username.length() < 5 || password.length() < 5)
//                JOptionPane.showMessageDialog(editView, "Username atau password invalid! (min. 5)", 
//                    "Error", JOptionPane.WARNING_MESSAGE);
//            else if (nama.length() < 3)
//                JOptionPane.showMessageDialog(editView, "Nama invalid!", 
//                    "Error", JOptionPane.WARNING_MESSAGE);
//            else if (alamat.length() < 3)
//                JOptionPane.showMessageDialog(editView, "Alamat invalid!", 
//                    "Error", JOptionPane.WARNING_MESSAGE);
//            else if (noTelp.length() < 12)
//                JOptionPane.showMessageDialog(editView, "No. Telp. invalid!", 
//                    "Error", JOptionPane.WARNING_MESSAGE);
//            else {
//                if (userExist){
////                    JOptionPane.showMessageDialog(editView, "Username sudah ada!", 
////                    "Error", JOptionPane.WARNING_MESSAGE);
//                    String jk = editView.getJK();
//                    Admin a = new Admin(nama,alamat,noTelp,jk,username,password,role,dafTransaksi);
//                    model.insertAdmin(a);
//                    JOptionPane.showMessageDialog(editView, "Berhasil mengubah " + nama, 
//                        "Sukses", JOptionPane.INFORMATION_MESSAGE);
//                    editView.dispose();
//                    resetForm();
//                    showDataAdmin();
//                } else {
//                    JOptionPane.showMessageDialog(editView, "Admin tidak ditemukan");
//                }
//            }
//        }
    }
    
    private void showDataTransaksi() {
        ArrayList result = model.loadDataTransaksi();
        String kolom[] = {"No Transaksi", "Nama", "Alamat", "No Telp", 
            "Jenis Kelamin", "Layanan", "Status", "Tanggal", "Berat", "Total"};
        DefaultTableModel dtm = new DefaultTableModel(null, kolom) {
            @Override
            public boolean isCellEditable(int rowIndex, int mColIndex) {
                return false;
              }
        };
        ArrayList<Transaksi> transaksi = (ArrayList<Transaksi>) result.get(0);
        ArrayList<Person> person = (ArrayList<Person>) result.get(1);
        for (int i = 0; i < transaksi.size(); i++) {
            String no = Integer.toString((i+1));
            String noTransaksi = transaksi.get(i).getNoTransaksi();
            String nama = person.get(i).getNama();
            String alamat = person.get(i).getAlamat();
            String noTelp = person.get(i).getNoTelp();
            String JenisKelamin = person.get(i).getJenisKelamin();
            String Layanan = transaksi.get(i).getLayanan();
            String Status = transaksi.get(i).getStatus();
            String Tanggal = transaksi.get(i).getTanggal();
            String Berat = Double.toString(transaksi.get(i).getBerat()) + " Kg";
            String Total = Double.toString(transaksi.get(i).getTotal());
            
            String data[] = {noTransaksi,nama,alamat,noTelp,JenisKelamin,
                Layanan,Status,Tanggal,Berat,Total};
            dtm.addRow(data);
        }
        view.getTableTransaksi().setModel(dtm);
    }

    public void resetForm() {
        addView.getBgJK().clearSelection();
        addView.getCbRole().setSelectedIndex(0);
        addView.setTfNama("");
        addView.setTfAlamat("");
        addView.setTfNoTelp("");
        addView.setTfUsername("");
        addView.setTfPassword("");
    }
    
    @Override
    public void actionPerformed(ActionEvent ae) {
        Object source = ae.getSource();
        
        if (source.equals(view.getBtnTambah())) {
            addView = new AddAdminView();
            addView.addActionListener(this);
            addView.setVisible(true);
        } else if (source.equals(view.getBtnLogout())) {
            view.dispose();
            new LoginController();
        } else if (source.equals(addView.getBtnSimpanAdmin())) {
            addAdmin();
        } else if (source.equals(addView.getBtnResetAdmin())) {
            resetForm();
        } else if (source.equals(addView.getBtnBack())) {
            addView.dispose();
        } 
//        
//          if (source.equals(view.getBtnEdit())) {
//            if (view.getTableAdmin().getSelectedRow() == -1) {
//                JOptionPane.showMessageDialog(view, "Silahkan pilih admin yang akan di edit",
//                "Error", JOptionPane.WARNING_MESSAGE);
//            } else if (view.getTableAdmin().getSelectedRow() != -1) {
//                editView = new EditAdminView();
//                editView.addActionListener(this);
//                editView.setVisible(true);
//            }
//        }  else if (source.equals(editView.getBtnSimpanAdmin())) {
//            updateDataAdmin();
//        } else if (source.equals(editView.getBtnResetAdmin())) {
//            resetForm();
//        } else if (source.equals(editView.getBtnBack())) {
//            editView.dispose();
//        }
//        
//        
//        if (source.equals(view.getBtnEdit())) {
//            editView = new EditAdminView();
//            editView.addActionListener(this);
//            editView.setVisible(true);
//        }  else if (source.equals(editView.getBtnSimpanAdmin())) {
//            updateDataAdmin();
//        } else if (source.equals(editView.getBtnResetAdmin())) {
//            resetForm();
//        } else if (source.equals(editView.getBtnBack())) {
//            editView.dispose();
//        }       
    }  
}
