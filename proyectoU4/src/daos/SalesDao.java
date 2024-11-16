/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import jFrames.Conexion;
import java.util.ArrayList;
import modelos.modSales;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Fatima Lizbeth
 */
public class SalesDao {
    Conexion cx=new Conexion();

    public SalesDao() {
    }
    
    public boolean create(){
        return true;
    }
    
    public ArrayList<modSales> read(int orderNumber) {
    ArrayList<modSales> list = new ArrayList<modSales>();
    try {
        String select = "select * from orders where orderNumber = ?;";
        PreparedStatement ps = cx.conectar().prepareStatement(select);
        ps.setInt(1, orderNumber);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            modSales sales = new modSales();
            sales.setOrderID(rs.getInt("OrderID"));
            sales.setOrderNumber(rs.getInt("orderNumber"));
            sales.setProductName(rs.getString("productName"));
            sales.setPrice(rs.getDouble("price"));
            sales.setQuantity(rs.getInt("quantity"));
            sales.setTotal(rs.getDouble("total"));
            sales.setDate(rs.getString("date"));
            sales.setEmployeeID(rs.getString("EmployeeID"));
            sales.setCustomerID(rs.getString("CustomerID"));
            sales.setProductCode(rs.getString("ProductCode"));
            list.add(sales);
        }
        ps.close();
        ps = null;
        cx.desconectar();
        
    } catch (SQLException ex) {
        Logger.getLogger(SalesDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return list;
}
    
    public modSales read1(int idOrdenes){
        modSales sale=new modSales();
        return sale;
    }
    
    public boolean delete(int idOrdenes){
        return true;
    }
    /*
    public ArrayList<modMensajes> read() {
        ArrayList<modMensajes> lista = new ArrayList<modMensajes>();
        try {
            String select = "select * from mensaje;";
            PreparedStatement ps = cx.conectar().prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                modMensajes mensajes = new modMensajes();
                mensajes.setIdMensaje(rs.getInt("id_mensaje"));
                mensajes.setMensaje(rs.getString("mensaje"));
                mensajes.setAutor(rs.getString("autor"));
                mensajes.setDestinatario(rs.getString("destinatario"));
                lista.add(mensajes);
            }
            ps.close();
            ps = null;
            cx.desconectar();
        } catch (SQLException ex) {
            Logger.getLogger(daoMensajes.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }*/
}
