package mantenimientoNoticias.model;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import mantenimientoNoticias.beans.Agenda;
import mantenimientoNoticias.beans.Clientes;
import mantenimientoNoticias.beans.Login;


public class LoginPeer {
	
	
/*	public static boolean checkCredentialsBase(String usu, String pwd) {

		if ("pepe".equalsIgnoreCase(usu) && "elrincon".equalsIgnoreCase(pwd)) {
			return true;
		} else
			return false;
	}
	*/
	 public static boolean checkCredentialsBase(DataManager dataManager, String usu,
		      String pwd) {
		  ArrayList<Login> logins = new ArrayList<Login>();
		  Login login = new Login();
		  boolean acceso=false;
		    Connection connection = dataManager.getConnection();
		    if (connection != null) {
		      try {
		        Statement s = connection.createStatement();
		        String sql = "select usuario, clave from usuarios where usuario ='"+ usu + "' and clave= '"+ pwd +"'" ;
		        try {
		          ResultSet rs = s.executeQuery(sql);
		          try {
		            if (rs.next()) {
		              
		              acceso=true;
		              }else{
		            	 acceso=false;
		              }
		            }
		          finally { rs.close(); }
		          }
		        finally { s.close(); }
		        }
		      catch (SQLException e) {
		        System.out.println("Could not get users: " + e.getMessage());
		        }
		      finally {
		        dataManager.putConnection(connection);
		        }
		      }
		    //return logins;
		   return acceso;
		    	
		    }


	public static boolean checkCredentialsPro(String usr, String pwd) {
		return true;
	}
	
	
	/*  HttpSession session = request.getSession(true);
	    String usuario = request.getParameter("usu");   
	    String clave = request.getParameter("pwd");
	    System.out.println(usuario);
	    System.out.println(clave);
	    session.setAttribute("usuario", usuario);
	    session.setAttribute("clave", clave);
	    ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/noticias",
			        "root", "1234");
			Statement st = con.createStatement();
			rs = st.executeQuery("select * from usuarios where usuario='" + usuario + "' and clave='" + clave + "'");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    try {
			if (rs.next()) {

			    System.out.println("welcome " + usuario);
			    //out.println("<a href='logout.jsp'>Log out</a>");
			    response.sendRedirect("jsp/admin.jsp");
			} else {
				 response.sendRedirect("jsp/ErrorAutentificacion.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}


	public static Agenda getUsuarios(DataManager dataManager, String usu, String psw) {
    Login login = null;
    Connection connection = dataManager.getConnection();
    if (connection != null) {
      try {
        Statement s = connection.createStatement();
        String sql = "select * from usuarios where usuario='" + usu + "' and clave='" + psw + "'";
        try {
          ResultSet rs = s.executeQuery(sql);
          if (rs.next()) {
            login = new Login();
            login.setUsuario(rs.getString(1));
            login.setPassword(rs.getString(2));
            }
          }
        finally { s.close(); }
        }
      catch (SQLException e) {
        System.out.println("Could not get users: " + e.getMessage());
        }
      finally {
        dataManager.putConnection(connection);
        }
      }
    return login;
    }*/

}
