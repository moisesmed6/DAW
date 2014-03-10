package mantenimientoNoticias.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import mantenimientoNoticias.beans.Secciones;

public class SeccionesPeer {
  public static Secciones getSeccionById(DataManager dataManager,
      String seccionId) {
    Secciones seccion = null;
    Connection connection = dataManager.getConnection();
    if (connection != null) {
      try {
        Statement s = connection.createStatement();
        String sql = "select id, descripcion from"
          + " secciones where id=" + seccionId;
        try {
          ResultSet rs = s.executeQuery(sql);
          try {
            if (rs.next()) {
              seccion = new Secciones(rs.getInt(1), rs.getString(2));
              }
            }
          finally { rs.close(); }
          }
        finally { s.close(); }
        }
      catch (SQLException e) {
        System.out.println("Could not get categories: " + e.getMessage());
        }
      finally {
        dataManager.putConnection(connection);
        }
      }
    return seccion;
    }

  public static Hashtable<String, String>
      getTodasSecciones(DataManager dataManager) {
    Hashtable<String, String> secciones = new Hashtable<String, String>();
    Connection connection = dataManager.getConnection();
    if (connection != null) {
      try {
        Statement s = connection.createStatement();
        String sql = "select id, descripcion from secciones";
        try {
          ResultSet rs = s.executeQuery(sql);
          try {
            while (rs.next()) {
              secciones.put(rs.getString(1), rs.getString(2));
              }
            }
          finally { rs.close(); }
          }
        finally {s.close(); }
        }
      catch (SQLException e) {
        System.out.println("Could not get categories with getTodasSecciones: " + e.getMessage());
        }
      finally {
        dataManager.putConnection(connection);
        }
      }
    return secciones;
    }
  }
