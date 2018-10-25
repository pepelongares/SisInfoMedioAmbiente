package datos.VO;

/* La clase GrupoVO representa un grupo de realizar entradas al blog
 */
public class GrupoVO {
	
	// Atributos privados de la clase
	private int id;
	private String nombre;
	
	public GrupoVO() {
		super();
	}
	
	@Override
	public String toString() {
		return "GrupoVO [id=" + id + ", nombre=" + nombre + "]";
	}

	public GrupoVO(int id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	
	
	
	
	
	
}
