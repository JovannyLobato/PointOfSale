package jFrames;

import daos.SalesDao;
import java.util.ArrayList;
import javax.swing.JFrame;
import javax.swing.table.DefaultTableModel;
import modelos.modSales;
import javax.swing.*;                    
import java.text.SimpleDateFormat;                    
import java.util.Date;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;                    
import modelos.modUser;
                    

/**
 *
 * @author jovan
 */
public class jfrmSales extends javax.swing.JFrame {
    private jfrmMenu menuFrame;
    DefaultTableModel model = new DefaultTableModel();
    SalesDao SalesDAO = new SalesDao();
    ArrayList<modSales> lista;
    Conexion cx;
    
    // Este metodo no sirve de nada, lo puso mane
    public jfrmSales(){
        setTitle("Sales");
        setUndecorated(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        initComponents();
        
        lblUser.setText(modUser.getInstance().getUsername() + modUser.getInstance().getLastName());
        
        Timer timer = new Timer(1000, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String currentDateTime = getCurrentDateTime();
                lblTime.setText(currentDateTime);
            }
        });
        timer.start();
        
        
        jfrmLogin empleado = new jfrmLogin();
        txtCliente.setEnabled(false);
        this.setLocationRelativeTo(null);
        model.addColumn("No.Orden");
        model.addColumn("Producto");
        model.addColumn("Precio");
        model.addColumn("Cantidad");
        model.addColumn("Descuento");
        model.addColumn("Cliente");
        cx = new Conexion();
        actualizarTabla(0);
    }
    
    public jfrmSales(jfrmMenu menuFrame) {
        this.menuFrame = menuFrame;
        setTitle("Ventas");
        setUndecorated(true);
        initComponents();
        
        lblUser.setText(modUser.getInstance().getUsername() + " " + modUser.getInstance().getLastName());
        
        Timer timer = new Timer(1000, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String currentDateTime = getCurrentDateTime();
                lblTime.setText(currentDateTime);
            }
        });
        timer.start();
        
        jfrmLogin empleado = new jfrmLogin();
        txtCliente.setEnabled(false);
        this.setLocationRelativeTo(null);
        model.addColumn("No.Orden");
        model.addColumn("Producto");
        model.addColumn("Precio");
        model.addColumn("Cantidad");
        model.addColumn("Descuento");
        model.addColumn("Cliente");
        cx = new Conexion();
        actualizarTabla(0);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        btnExit = new javax.swing.JButton();
        btnBackToMenu = new javax.swing.JButton();
        lblUser = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblCompras = new javax.swing.JTable();
        btnAgregar = new javax.swing.JButton();
        btnBorrar = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        btnCobrar = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txtTotal = new javax.swing.JTextField();
        txtSutotal = new javax.swing.JTextField();
        txtDescuento = new javax.swing.JTextField();
        txtCliente = new javax.swing.JTextField();
        lblTime = new javax.swing.JLabel();
        tfProductCode = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(660, 540));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, -1));

        btnExit.setBackground(new java.awt.Color(153, 0, 0));
        btnExit.setText("X");
        btnExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnExitActionPerformed(evt);
            }
        });
        getContentPane().add(btnExit, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 10, 40, 30));

        btnBackToMenu.setText("Back to menu");
        btnBackToMenu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBackToMenuActionPerformed(evt);
            }
        });
        getContentPane().add(btnBackToMenu, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 480, -1, -1));

        lblUser.setText("Vendedor:");
        getContentPane().add(lblUser, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 30, 190, -1));

        jLabel2.setText("Cliente:");
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 70, -1, -1));

        tblCompras.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null},
                {null, null, null},
                {null, null, null},
                {null, null, null}
            },
            new String [] {
                "Producto", "Cantidad", "Precio"
            }
        ));
        jScrollPane1.setViewportView(tblCompras);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 100, 440, 250));

        btnAgregar.setText("Agregar");
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarActionPerformed(evt);
            }
        });
        getContentPane().add(btnAgregar, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 380, -1, -1));

        btnBorrar.setText("Borrar");
        getContentPane().add(btnBorrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(160, 380, -1, -1));

        btnCancelar.setText("Cancelar");
        btnCancelar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCancelarActionPerformed(evt);
            }
        });
        getContentPane().add(btnCancelar, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 420, -1, -1));

        btnCobrar.setText("Cobrar");
        getContentPane().add(btnCobrar, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 380, -1, -1));

        jLabel4.setText("Subtotal:");
        getContentPane().add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 380, 50, -1));

        jLabel5.setText("Total:");
        getContentPane().add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(380, 440, -1, -1));

        jLabel6.setText("Descuento:");
        getContentPane().add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(350, 410, -1, -1));
        getContentPane().add(txtTotal, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 440, 80, -1));
        getContentPane().add(txtSutotal, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 380, 80, -1));
        getContentPane().add(txtDescuento, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 410, 80, -1));
        getContentPane().add(txtCliente, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 70, 160, -1));

        lblTime.setText("date and hour");
        getContentPane().add(lblTime, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 30, -1, -1));

        tfProductCode.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tfProductCodeActionPerformed(evt);
            }
        });
        getContentPane().add(tfProductCode, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 440, 70, -1));

        jLabel1.setText("Product Code");
        getContentPane().add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(170, 420, -1, -1));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnExitActionPerformed
        this.dispose();
        System.exit(0);
    }//GEN-LAST:event_btnExitActionPerformed

    private void btnBackToMenuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBackToMenuActionPerformed
        jfrmMenu menuFrame = new jfrmMenu();
        menuFrame.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnBackToMenuActionPerformed

    private void btnAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarActionPerformed
        jfrmAddSale nueva = new jfrmAddSale();
        nueva.setVisible(true);
    }//GEN-LAST:event_btnAgregarActionPerformed

    private void btnCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCancelarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnCancelarActionPerformed

    private void tfProductCodeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tfProductCodeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_tfProductCodeActionPerformed
    
    public void actualizarTabla(int numOrden) {
        while (model.getRowCount() > 0) {
            model.removeRow(0);
        }
        lista = SalesDAO.read(numOrden);
        for (modSales sales : lista) {
            Object fila[] = new Object[6];
            fila[0] = sales.getNumOrden();
            fila[1] = sales.getNombreProducto();
            fila[2] = sales.getPrecio();
            fila[3] = sales.getCantidad();
            fila[4] = sales.getDescuento();
            fila[5] = sales.getIdCliente();
            model.addRow(fila);
        }
        tblCompras.setModel(model);
    }
    
    private String getCurrentDateTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(new Date());
    }
    
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(jfrmSales.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(jfrmSales.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(jfrmSales.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(jfrmSales.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new jfrmSales().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnBackToMenu;
    private javax.swing.JButton btnBorrar;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnCobrar;
    private javax.swing.JButton btnExit;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblTime;
    private javax.swing.JLabel lblUser;
    private javax.swing.JTable tblCompras;
    private javax.swing.JTextField tfProductCode;
    private javax.swing.JTextField txtCliente;
    private javax.swing.JTextField txtDescuento;
    private javax.swing.JTextField txtSutotal;
    private javax.swing.JTextField txtTotal;
    // End of variables declaration//GEN-END:variables
}
