/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daos;

import jFrames.Conexion;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelos.modReporteTrimestral;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author jovan
 */
public class salesReportDAO {
    Conexion cx = new Conexion();
    public salesReportDAO(){
        
    }
    public ArrayList<modReporteTrimestral> read(){
        ArrayList<modReporteTrimestral> list = new ArrayList<modReporteTrimestral>();
        try{
            //aqui defino la consulta
            String select = "SELECT * FROM reporte_ventas_trimestrales";
            PreparedStatement ps = cx.conectar().prepareCall(select);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                modReporteTrimestral reporte = new modReporteTrimestral();
                reporte.setProducto(rs.getString("producto"));
                reporte.setTrim1(rs.getDouble("trim 1"));
                reporte.setTrim2(rs.getDouble("trim 2"));
                reporte.setTrim3(rs.getDouble("trim 3"));
                reporte.setTrim4(rs.getDouble("trim 4"));
                list.add(reporte);
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
