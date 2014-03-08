package mantenimientoNoticias.beans;

public class Agenda {
	private String id;
	private int seccion;
	private String cabecera;
	private String texto;
	private String fecha;
	private double precio;
	private String foto;
 

	public String getFoto() {return foto;}
	public void setFoto(String foto) {this.foto = foto;}
	
	public double getPrecio() {	return precio;}
	public void setPrecio(double precio) {this.precio = precio;}
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }

	public int getSeccion() { return seccion; }
	public void setSeccion(int seccion) { this.seccion = seccion; }

	public String getCabecera() { return cabecera; }
	public void setCabecera(String cabecera) { this.cabecera = cabecera; }

	public String getTexto() { return texto; }
	public void setTexto(String texto) { this.texto = texto; }
	
	public String getFecha() { return fecha; }
	public void setFecha(String fecha) { this.fecha = fecha; }

  }
