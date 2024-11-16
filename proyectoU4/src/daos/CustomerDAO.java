/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import jFrames.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.modCustomer;
import modelos.modEmployee;

/**
 *
 * @author jovan
 */
public class CustomerDAO {
    Conexion cx = new Conexion();
    public CustomerDAO(){}
    public String create(modCustomer customer){
        String errors = "";
        if (customer.getCustomerID() == null || customer.getCustomerID().length() > 10) 
            errors += "Customer ID must not be null and must be at most 10 characters long.\n";
        if (customer.getNam() == null || customer.getNam().isEmpty()) 
            errors += "Name must not be null or empty.\n";
        if (customer.getSurname() == null || customer.getSurname().isEmpty()) 
            errors += "Surname must not be null or empty.\n";
        if (customer.getEmail() == null || customer.getEmail().isEmpty()) 
            errors += "Email must not be null or empty.\n";
        if (!customer.getEmail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$") ) 
            errors += "Email format is invalid.\n";
        if (customer.getPhone() == null || customer.getPhone().length() > 12){
            errors += "Phone must not be null and must be at most 12 characters long.\n";
        }
        if (customer.getPostalCode() != null && !customer.getPostalCode().isEmpty() && customer.getPostalCode().length() != 5) 
            errors += "Postal code must be exactly 5 characters long if provided.\n";
        
        if(!errors.equals("")) return errors;
        try{
            String insert = "INSERT INTO customers (CustomerID, nam, surname, address, postalCode, city, phone, email) "
                  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement ps = cx.conectar().prepareStatement(insert);
            ps.setString(1, customer.getCustomerID());
            ps.setString(2, customer.getNam());
            ps.setString(3, customer.getSurname());
            ps.setString(4, customer.getAddress());
            ps.setString(5, customer.getPostalCode());
            ps.setString(6, customer.getCity());
            ps.setString(7, customer.getPhone());
            ps.setString(8, customer.getEmail());
            ps.execute();
            ps.close();
            ps = null;
            cx.desconectar();
            return "true";
        }
        catch(SQLException ex){
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
            return "An error occurred while saving to the database.";
        }
    }
    
    
    public ArrayList<modCustomer> read(){
        ArrayList<modCustomer> list = new ArrayList<modCustomer>();
        try{
            String select = "select * from customers;";
            PreparedStatement ps = cx.conectar().prepareCall(select);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                modCustomer customer = new modCustomer();
                customer.setCustomerID(rs.getString("customerID"));
                customer.setNam(rs.getString("nam"));
                customer.setSurname(rs.getString("Surname"));
                customer.setAddress(rs.getString("address"));
                customer.setPostalCode(rs.getString("postalCode"));
                customer.setCity(rs.getString("city"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));
                list.add(customer);

            }
            ps.close();
            ps = null;
            cx.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
