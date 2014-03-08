package mantenimientoNoticias.beans;

public class CartItem {
  private String texto;
  private String cabecera;
  private String fecha;
  private String agendaID;
  private String quantity;
  public double getPrecio() {
	return precio;
}

public void setPrecio(double precio) {
	this.precio = precio;
}
private double precio;

	public CartItem(Agenda agenda, int quantity) {
		agendaID = agenda.getId();
		cabecera = agenda.getCabecera();
		texto = agenda.getTexto();
		fecha = agenda.getFecha();
		precio = agenda.getPrecio();
		this.quantity = new Integer(quantity).toString();
	  }

	public String getCabecera() { return cabecera; }
	public void setCabecera(String cabecera) { this.cabecera = cabecera; }

	public String getTexto() { return texto; }
	public void setTitle(String texto) { this.texto = texto; }

	public String getFecha() { return fecha; }
	public void setFecha(String fecha) { this.fecha = fecha; }

	public String getAgendaID() { return agendaID; }
	public void setBookId(String agendaID) { this.agendaID = agendaID; }

	public String getQuantity() { return quantity; }
	public void setQuantity(String quantity) { this.quantity = quantity; }
  }
