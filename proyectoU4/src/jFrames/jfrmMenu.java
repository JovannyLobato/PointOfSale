/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package jFrames;

import modelos.modUser;

/**
 *
 * @author jovan
 */
public class jfrmMenu extends javax.swing.JFrame {

    /**
     * Creates new form jfrmMenu
     */
    public jfrmMenu() {
        setTitle("Menu");
        setUndecorated(true);
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        btnLogin = new javax.swing.JButton();
        btnExit = new javax.swing.JButton();
        btnSales = new javax.swing.JButton();
        btnProductInventory = new javax.swing.JButton();
        btnEmployeeCRUD = new javax.swing.JButton();
        btnCustomerCRUD = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 153));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnLogin.setBackground(new java.awt.Color(102, 51, 0));
        btnLogin.setText("Cerrar Sesion");
        btnLogin.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLoginActionPerformed(evt);
            }
        });
        jPanel1.add(btnLogin, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 450, 150, 30));

        btnExit.setBackground(new java.awt.Color(153, 0, 0));
        btnExit.setText("X");
        btnExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnExitActionPerformed(evt);
            }
        });
        jPanel1.add(btnExit, new org.netbeans.lib.awtextra.AbsoluteConstraints(560, 10, 40, 30));

        btnSales.setBackground(new java.awt.Color(102, 51, 0));
        btnSales.setText("Venta");
        btnSales.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalesActionPerformed(evt);
            }
        });
        jPanel1.add(btnSales, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 460, 160, 30));

        btnProductInventory.setBackground(new java.awt.Color(102, 51, 0));
        btnProductInventory.setText("Productos");
        btnProductInventory.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnProductInventoryActionPerformed(evt);
            }
        });
        jPanel1.add(btnProductInventory, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 260, 150, 30));

        btnEmployeeCRUD.setBackground(new java.awt.Color(102, 51, 0));
        btnEmployeeCRUD.setText("Empleados");
        btnEmployeeCRUD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEmployeeCRUDActionPerformed(evt);
            }
        });
        jPanel1.add(btnEmployeeCRUD, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 260, 150, 30));

        btnCustomerCRUD.setBackground(new java.awt.Color(102, 51, 0));
        btnCustomerCRUD.setText("Clientes");
        btnCustomerCRUD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCustomerCRUDActionPerformed(evt);
            }
        });
        jPanel1.add(btnCustomerCRUD, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 260, 150, 30));

        jLabel1.setFont(new java.awt.Font("Rockwell", 0, 48)); // NOI18N
        jLabel1.setText("Menú");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 40, 130, 40));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Imagenes/Proveedor.png"))); // NOI18N
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 120, 150, 140));

        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Imagenes/productos.png"))); // NOI18N
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(470, 120, 150, 140));

        jLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Imagenes/Empleado.png"))); // NOI18N
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 120, 150, 140));

        jLabel5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Imagenes/venta.png"))); // NOI18N
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(390, 310, 160, 160));

        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/Imagenes/regresar.png"))); // NOI18N
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 310, 150, 150));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 660, 540));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnLoginActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLoginActionPerformed
        modUser.getInstance().clearSession();
        jfrmLogin loginFrame = new jfrmLogin();
        loginFrame.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnLoginActionPerformed

    private void btnExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnExitActionPerformed
        this.dispose();
    }//GEN-LAST:event_btnExitActionPerformed

    private void btnSalesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalesActionPerformed
        jfrmSales salesFrame = new jfrmSales(this);
        salesFrame.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnSalesActionPerformed

    private void btnProductInventoryActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnProductInventoryActionPerformed
        jfrmProductInventory productInventoryFrame = new jfrmProductInventory(this);
        productInventoryFrame.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnProductInventoryActionPerformed

    private void btnEmployeeCRUDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEmployeeCRUDActionPerformed
        jfrmEmployeeCRUD employeeCRUDFrame = new jfrmEmployeeCRUD(this);
        employeeCRUDFrame.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnEmployeeCRUDActionPerformed

    private void btnCustomerCRUDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCustomerCRUDActionPerformed
        jfrmCustomerCRUD customerCRUDFrame = new jfrmCustomerCRUD(this);
        customerCRUDFrame.setVisible(true);
        this.dispose();
    }//GEN-LAST:event_btnCustomerCRUDActionPerformed

    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(jfrmMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(jfrmMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(jfrmMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(jfrmMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new jfrmMenu().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCustomerCRUD;
    private javax.swing.JButton btnEmployeeCRUD;
    private javax.swing.JButton btnExit;
    private javax.swing.JButton btnLogin;
    private javax.swing.JButton btnProductInventory;
    private javax.swing.JButton btnSales;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
