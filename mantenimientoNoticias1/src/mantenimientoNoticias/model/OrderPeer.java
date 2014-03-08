package mantenimientoNoticias.model;

import java.sql.SQLException;
import java.sql.Statement;

import mantenimientoNoticias.beans.Clientes;

public class OrderPeer {

  public static void insertOrder(Statement stmt, long orderId,
      Clientes cliente) throws SQLException {
    String sql = "insert into orders (order_id, delivery_name,"
        + " delivery_address, cc_name, cc_number, cc_expiry) values ('"
        + orderId + "','" + cliente.getContactName() + "','"
        + cliente.getDeliveryAddress() + "','"
        + cliente.getCcName() + "','" + cliente.getCcNumber()
        + "','" + cliente.getCcExpiryDate() + "')"
        ;
    stmt.executeUpdate(sql);
    }
  }
