package mantenimientoNoticias.model;

import java.util.Hashtable;
import java.util.Enumeration;
import java.sql.SQLException;
import java.sql.Statement;

import mantenimientoNoticias.beans.CartItem;


public class OrderDetailsPeer {

  public static void insertOrderDetails(Statement stmt, long orderId,
      Hashtable<String, CartItem> shoppingCart) throws SQLException {
    String sql;
    Enumeration<CartItem> enumList = shoppingCart.elements();
    while (enumList.hasMoreElements()) {
      CartItem item = enumList.nextElement();
      sql = "insert into order_details (book_id, cabecera, texto,"
          + " cantidad, precio, order_id) values ('" + item.getAgendaID() + "','"
          + item.getCabecera() + "','" + item.getTexto() + "','"
          + item.getQuantity() + "','" + item.getPrecio() + "','"
          + orderId + "')"
          ;
      stmt.executeUpdate(sql);
      }
    }
  }
