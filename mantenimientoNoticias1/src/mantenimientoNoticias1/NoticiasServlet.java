package mantenimientoNoticias1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mantenimientoNoticias.model.DataManager;


@WebServlet("/NoticiasServlet")
public class NoticiasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public NoticiasServlet() {
        super();
       
    }
    
    public void init(ServletConfig config) throws ServletException {
		System.out.println("*** initializing controller servlet.");
		super.init(config);

		DataManager dataManager = new DataManager();
		dataManager.setDbURL(config.getInitParameter("dbURL"));
		dataManager.setDbUserName(config.getInitParameter("dbUserName"));
		dataManager.setDbPassword(config.getInitParameter("dbPassword"));

		ServletContext context = config.getServletContext();
		context.setAttribute("base", config.getInitParameter("base"));
		context.setAttribute("imageURL", config.getInitParameter("imageURL"));
		context.setAttribute("dataManager", dataManager);

		try { // load the database JDBC driver
			Class.forName(config.getInitParameter("jdbcDriver"));
		} catch (ClassNotFoundException e) {
			System.out.println(e.toString());
		}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String base = "/jsp/";
		String url = base + "index.jsp";
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
			case "index":
				url = base + "index.jsp";
				break;
			case "alta":
				url = base + "alta.jsp";
				break;
			case "baja":
				url = base + "baja.jsp";
				break;
			case "modificacion":
				url = base + "modificacion.jsp";
				break;
			case "mostrarContenidoSeccion":
				url = base + "MostrarContenidoSeccion.jsp";
				break;
			case "verNoticia":
				url = base + "VerNoticia.jsp";
				break;
			case "loginar":
				url =  base + "login.jsp";
				System.out.println(url);
				break;
			case "comprar":
				url = base + "Comprar.jsp";
				break;
			case "orderConfirmation":
				url = base + "OrderConfirmation.jsp";
				break;
			default:
				//if (action.matches("(showCart|(add|update|delete)Item)"))
				if (action.matches("(showCart|(anadir|modificar|borrar)Item)"))
					url = base + "ShoppingCart.jsp";
				break;
				
			}
		}
		RequestDispatcher requestDispatcher = getServletContext()
				.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}

}
