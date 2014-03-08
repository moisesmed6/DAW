package mantenimientoNoticias.model;

import java.util.Hashtable;

import java.util.ArrayList;
import java.util.Enumeration;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



import mantenimientoNoticias.beans.CartItem;
import mantenimientoNoticias.beans.Login;
import mantenimientoNoticias.beans.Secciones;
import mantenimientoNoticias.beans.Agenda;
import mantenimientoNoticias.beans.Clientes;


public class DataManager {
  private String dbURL = "";
  private String dbUserName = "";
  private String dbPassword = "";

  public void setDbURL(String dbURL) {
    this.dbURL = dbURL;
    }
  public String getDbURL() {
    return dbURL;
    }

  public void setDbUserName(String dbUserName) {
    this.dbUserName = dbUserName;
    }
  public String getDbUserName() {
    return dbUserName;
    }

  public void setDbPassword(String dbPassword) {
    this.dbPassword = dbPassword;
    }
  public String getDbPassword() {
    return dbPassword;
    }

  public Connection getConnection() {
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(getDbURL(), getDbUserName(),
          getDbPassword());
      }
    catch (SQLException e) {
      System.out.println("Could not connect to DB in DataManager: " + e.getMessage());
      }
    return conn;
    }
  public void putConnection(Connection conn) {
    if (conn != null) {
      try { conn.close(); }
      catch (SQLException e) { }
      }
    }

  //---------- Login operations ----------------
  public boolean getUserAccess(String usu, String pwd){
	  return LoginPeer.checkCredentialsBase(this, usu, pwd);
  }
  
  
  
  //---------- Category operations ----------
  public String getDescripcionSeccion(String seccionID) {
    Secciones seccion = SeccionesPeer.getSeccionById(this, seccionID);
    return (seccion == null) ? null : seccion.getDescripcion();
    }

  public Hashtable<String, String> getSecciones() {
    return SeccionesPeer.getTodasSecciones(this);
    }

   public Enumeration<String> getCatIDs() {
    return SeccionesPeer.getTodasSecciones(this).keys();
    }
   
   public Hashtable<String, String> getAgenda(){
	 return   AgendaPeer.getAgendaCompleta(this);
   }
   public Hashtable<String, String> getAgenda(int min, int max){
		 return   AgendaPeer.getAgendaCompleta(this, min, max);
	   }
   
   public Agenda getAgendaDetalles(String agendaID) {
	    return AgendaPeer.getAgendaPorId(this, agendaID);
	    }

  //---------- Book operations ----------
   /* public ArrayList<Book> getSearchResults(String keyword) {
    return Agenda.searchBooks(this, keyword);
    }
	*/
  public ArrayList<Agenda> getNoticiasEnSeccion(String seccionID) {
    return AgendaPeer.getContenidoSeccion(this, seccionID);
    }

  public Agenda getDetallesNoticia(String agendaID) {
    return AgendaPeer.getNoticiaPorId(this, agendaID);
    }
  
  public void borrarNoticia(String agendaID) {
	  Connection connection = getConnection();
	    if (connection != null) {
	      Statement stmt = null;
	      try {
	        connection.setAutoCommit(false);
	        stmt = connection.createStatement();
	        try {
	          AgendaPeer.borrarNoticiaBaseDatos(stmt, agendaID);
	          try { stmt.close(); }
	          finally { stmt = null; }
	          connection.commit();
	          }
	        catch (SQLException e) {
	          System.out.println("Could not delete notice: " + e.getMessage());
	          try { connection.rollback(); }
	          catch (SQLException ee) { }
	          }
	        }
	      catch (SQLException e) {
	        System.out.println("Could not delete notice: " + e.getMessage());
	        }
	      finally {
	        if (stmt != null) {
	          try { stmt.close(); }
	          catch (SQLException e) { }
	          }
	        putConnection(connection);
	        }
	      }
	}
  
 // public void actualizarNoticia(String agendaID) {
  public int actualizarNoticia(ArrayList <String> datos) {
	  int resultado=0;
	  Connection connection = getConnection();
	    if (connection != null) {
	      Statement stmt = null;
	      try {
	        connection.setAutoCommit(false);
	        stmt = connection.createStatement();
	        try {
	         resultado= AgendaPeer.actualizarNoticiaBaseDatos(stmt, datos);
	          try { stmt.close(); }
	          finally { stmt = null; }
	          connection.commit();
	          }
	        catch (SQLException e) {
	          System.out.println("Could not update notice in Datamanager: " + e.getMessage());
	          try { connection.rollback(); }
	          catch (SQLException ee) { }
	          }
	        }
	      catch (SQLException e) {
	        System.out.println("Could not update notice in Datamanager: " + e.getMessage());
	        }
	      finally {
	        if (stmt != null) {
	          try { stmt.close(); }
	          catch (SQLException e) { }
	          }
	        putConnection(connection);
	        }
	      }

	      return resultado;
	}
  
  public int anadirNoticia(ArrayList <String> datos) {
	  int resultado=0;
	  Connection connection = getConnection();
	    if (connection != null) {
	      Statement stmt = null;
	      try {
	        connection.setAutoCommit(false);
	        stmt = connection.createStatement();
	        try {
	         resultado= AgendaPeer.anadirNoticiaBaseDatos(stmt, datos);
	          try { stmt.close(); }
	          finally { stmt = null; }
	          connection.commit();
	          }
	        catch (SQLException e) {
	          System.out.println("Could not add notice in Datamanager: " + e.getMessage());
	          try { connection.rollback(); }
	          catch (SQLException ee) { }
	          }
	        }
	      catch (SQLException e) {
	        System.out.println("Could not add notice in Datamanager: " + e.getMessage());
	        }
	      finally {
	        if (stmt != null) {
	          try { stmt.close(); }
	          catch (SQLException e) { }
	          }
	        putConnection(connection);
	        }
	      }

	      return resultado;
	}


  //---------- Order operations ----------
 public long insertOrder(Clientes cliente,
		    Hashtable<String, CartItem> shoppingCart) {
    long returnValue = 0L;
    long orderId = System.currentTimeMillis();
    //System.out.println(orderId);
    Connection connection = getConnection();
    if (connection != null) {
      Statement stmt = null;
      try {
        connection.setAutoCommit(false);
        stmt = connection.createStatement();
        try {
          OrderPeer.insertOrder(stmt, orderId, cliente);
          OrderDetailsPeer.insertOrderDetails(stmt, orderId, shoppingCart);
          try { stmt.close(); }
          finally { stmt = null; }
          connection.commit();
          returnValue = orderId;
          }
        catch (SQLException e) {
          System.out.println("Could not insert order: " + e.getMessage());
          try { connection.rollback(); }
          catch (SQLException ee) { }
          }
        }
      catch (SQLException e) {
        System.out.println("Could not insert order: " + e.getMessage());
        }
      finally {
        if (stmt != null) {
          try { stmt.close(); }
          catch (SQLException e) { }
          }
        putConnection(connection);
        }
      }
    return returnValue;
    }
 
 	//-------------User operations ----------------
 
 
 
 
  }
