package mantenimientoNoticias.beans;

public class Secciones {
  private int id;
  private String descripcion;

  public Secciones(int id, String name) {
    this.id = id;
    this.descripcion = name;
    }

  public int getId() { return id; }
  public void setId(int id) { this.id = id; }

  public String getDescripcion() { return descripcion; }
  public void setName(String descripcion) { this.descripcion = descripcion; }
  }
