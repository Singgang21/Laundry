/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package laundryku.model;

/**
 *
 * @author Galiley dan Hafiz
 */
import laundryku.model.Person;

public class Customer extends Person {
        
    private String idCust;
    
    public Customer(String nama, String alamat, String noTelp, String jenisKelamin,String idCust) {
        super(nama, alamat, noTelp, jenisKelamin);
        this.idCust = idCust;
    }

    public String getIdCust() {
        return idCust;
    }

    public void setIdCust(String idCust) {
        this.idCust = idCust;
    }
}
