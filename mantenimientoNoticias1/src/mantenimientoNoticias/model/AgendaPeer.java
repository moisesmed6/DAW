package mantenimientoNoticias.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

import mantenimientoNoticias.beans.Agenda;
import mantenimientoNoticias.beans.CartItem;

/**
 * @author moises
 *
 */
public class AgendaPeer {
 /* public static ArrayList<Book> searchBooks(DataManager dataManager,
      String keyword) {
    ArrayList<Book> books = new ArrayList<Book>();
    Connection connection = dataManager.getConnection();
    if (connection != null) {
      try {
        Statement s = connection.createStatement();
        String sql = "select book_id, title, author, price from books"
            + " where title like '%" + keyword.trim() + "%'"
            + " or author like '%" + keyword.trim() + "%'";
        try {
          ResultSet rs = s.executeQuery(sql);
          try {
            while (rs.next()) {
              Book book = new Book();
              book.setId(rs.getString(1));
              book.setTitle(rs.getString(2));
              book.setAuthor(rs.getString(3));
              book.setPrice(rs.getDouble(4));
              books.add(book);
              }
            }
          finally { rs.close(); }
          }
        finally { s.close(); }
        }
      catch (SQLException e) {
        System.out.println("Could not search for books:" + e.getMessage());
        }
      finally {
        dataManager.putConnection(connection);
        }
      }
    return books;
    }
  */
  public static ArrayList<Agenda> getContenidoSeccion(DataManager dataManager,
      String seccionId) {
    ArrayList<Agenda> agendas = new ArrayList<Agenda>();
    Connection connection = dataManager.getConnection();
    if (connection != null) {
      try {
        Statement s = connection.createStatement();
        String sql = "select id, cabecera, texto, fecha, seccion, precio from agenda"
            + " where seccion=" + seccionId;
        try {
          ResultSet rs = s.executeQuery(sql);
          try {
            while (rs.next()) {
              Agenda agenda = new Agenda();
              agenda.setId(rs.getString(1));
              agenda.setCabecera(rs.getString(2));
              agenda.setTexto(rs.getString(3));
              agenda.setFecha(rs.getString(4));
              agenda.setSeccion(rs.getInt(5));
              agenda.setPrecio(rs.getDouble(6));
              agendas.add(agenda);
              }
            }
          finally { rs.close(); }
          }
        finally { s.close(); }
        }
      catch (SQLException e) {
        System.out.println("Could not get books: " + e.getMessage());
        }
      finally {
        dataManager.putConnection(connection);
        }
      }
    return agendas;
    }

  public static Agenda getNoticiaPorId(DataManager dataManager, String agendaID) {
    Agenda agenda = null;
    Connection connection = dataManager.getConnection();
    if (connection != null) {
      try {
        Statement s = connection.createStatement();
        String sql = "select id, cabecera, texto, fecha, foto, precio, seccion from agenda"
            + " where id=" + agendaID;
        try {
          ResultSet rs = s.executeQuery(sql);
          if (rs.next()) {
            agenda = new Agenda();
            agenda.setId(rs.getString(1));
            agenda.setCabecera(rs.getString(2));
            agenda.setTexto(rs.getString(3));
            agenda.setFecha(rs.getString(4));
            agenda.setFoto(rs.getString(5));
            agenda.setPrecio(rs.getDouble(6));
            agenda.setSeccion(rs.getInt(7));
            }
          }
        finally { s.close(); }
        }
      catch (SQLException e) {
        System.out.println("Could not get book: " + e.getMessage());
        }
      finally {
        dataManager.putConnection(connection);
        }
      }
    return agenda;
    }
  
  public static Hashtable<String, String>
  getAgendaCompleta(DataManager dataManager) {
Hashtable<String, String> secciones = new Hashtable<String, String>();
Connection connection = dataManager.getConnection();
if (connection != null) {
  try {
    Statement s = connection.createStatement();
    String sql = "select id, cabecera from agenda";
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
    System.out.println("Could not get agenda with getAgendaCompleta: " + e.getMessage());
    }
  finally {
    dataManager.putConnection(connection);
    }
  }
return secciones;
}
  
  public static Hashtable<String, String>
  getAgendaCompleta(DataManager dataManager, int min, int max) {
Hashtable<String, String> secciones = new Hashtable<String, String>();
Connection connection = dataManager.getConnection();
if (connection != null) {
  try {
    Statement s = connection.createStatement();
    String sql = "select id, cabecera from agenda limit "+min+", "+max;
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
    System.out.println("Could not get agenda with getAgendaCompleta: " + e.getMessage());
    }
  finally {
    dataManager.putConnection(connection);
    }
  }
return secciones;
}
  public static Agenda getAgendaPorId(DataManager dataManager, String agendaID) {
	    Agenda agenda = null;
	    Connection connection = dataManager.getConnection();
	    if (connection != null) {
	      try {
	        Statement s = connection.createStatement();
	        String sql = "select id, seccion, cabecera, texto, fecha, foto, precio from agenda"
	            + " where id=" + agendaID;
	        try {
	          ResultSet rs = s.executeQuery(sql);
	          if (rs.next()) {
	            agenda = new Agenda();
	            agenda.setId(rs.getString(1));
	            agenda.setSeccion(rs.getInt(2));
	            agenda.setCabecera(rs.getString(3));
	            agenda.setTexto(rs.getString(4));
	            agenda.setFecha(rs.getString(5));
	            agenda.setFoto(rs.getString(6));
	            agenda.setPrecio(rs.getDouble(7));	            
	            }
	          }
	        finally { s.close(); }
	        }
	      catch (SQLException e) {
	        System.out.println("Could not get agenda: " + e.getMessage());
	        }
	      finally {
	        dataManager.putConnection(connection);
	        }
	      }
	    return agenda;
	    }
  

  public static void borrarNoticiaBaseDatos(Statement stmt, String agendaId) throws SQLException {
	    String sql;
	    
	      sql = "delete from agenda where id="+agendaId;
	      stmt.executeUpdate(sql);
	     
	    }

  public static int actualizarNoticiaBaseDatos(Statement stmt, ArrayList <String> datos) throws SQLException {
	    String sql;
	   
	  //    System.out.println(datos.get(0));
	//	  System.out.println(datos.get(1));
	//	  System.out.println(datos.get(2));
	//	  System.out.println(datos.get(3));
	//	  System.out.println(datos.get(4));
	//	  System.out.println(datos.get(5));
	//	  System.out.println("quien soy yo:"+datos.get(6));
	  
	      sql = "UPDATE `agenda` SET seccion='"+datos.get(0)+"', cabecera='"+datos.get(1)+"', " +
	      		"texto='"+datos.get(2)+"', fecha='"+datos.get(3)+"', foto='"+datos.get(4)+"', precio='"+datos.get(5)+"' where id="+datos.get(6)+"";
	      
	     /* UPDATE  `noticias`.`agenda` SET  `cabecera` =  'prueba2asdasdasd',
	    		  `texto` =  'españa cañíasdf',
	    		  `precio` =  '12.24' WHERE  `agenda`.`id` =85;*/
	      
	      
	     int resultado=stmt.executeUpdate(sql);
	   //  System.out.println("resultado"+resultado);
	     
	     return resultado;
	     /* UPDATE `agenda` SET `id`=[value-1],`seccion`=[value-2],`cabecera`=[value-3],
	    		  `texto`=[value-4],`fecha`=[value-5],`foto`=[value-6],`precio`=[value-7] WHERE 1
	    
	      datos.add(seccion);
	      datos.add(cabecera);
	      datos.add(texto);
	      datos.add(fecha);
	      datos.add(precio);
	      datos.add(agendaId);*/
  
  }
  public static int anadirNoticiaBaseDatos(Statement stmt, ArrayList <String> datos) throws SQLException {
	    String sql;
	   
	//  System.out.println(datos.get(0));
	//  System.out.println(datos.get(1));
	//  System.out.println(datos.get(2));
	//  System.out.println(datos.get(3));
	//  System.out.println(datos.get(4));
	//  System.out.println(datos.get(5));
	//  System.out.println(datos.get(6));
	  
	      sql = "INSERT INTO `agenda` ( `seccion`, `cabecera`, `texto`,`fecha`, `foto`, `precio`) VALUES"+
	      "("+datos.get(0)+",'"+datos.get(1)+"','"+datos.get(2)+"','"+datos.get(3)+"','"+datos.get(4)+"',"+datos.get(5)+")";
	      
	 //  System.out.println(sql);
	      
	     /* UPDATE  `noticias`.`agenda` SET  `cabecera` =  'prueba2asdasdasd',
	    		  `texto` =  'españa cañíasdf',
	    		  `precio` =  '12.24' WHERE  `agenda`.`id` =85;*/
	      
	      
	     int resultado=stmt.executeUpdate(sql);
	  //   System.out.println("resultado"+resultado);
	     
	     return resultado;
	     /* UPDATE `agenda` SET `id`=[value-1],`seccion`=[value-2],`cabecera`=[value-3],
	    		  `texto`=[value-4],`fecha`=[value-5],`foto`=[value-6],`precio`=[value-7] WHERE 1
	    
	      datos.add(seccion);
	      datos.add(cabecera);
	      datos.add(texto);
	      datos.add(fecha);
	      datos.add(precio);
	      datos.add(agendaId);*/

}
}

