package datos.VO;

public class ContestarVO {

	private int idEntrada;
	private int tipo;
	private String correo;
	private int posPregunta;
	
	
	public int getIdEntrada() {
		return idEntrada;
	}


	public void setIdEntrada(int idEntrada) {
		this.idEntrada = idEntrada;
	}


	public int getTipo() {
		return tipo;
	}


	public void setTipo(int tipo) {
		this.tipo = tipo;
	}


	public String getCorreo() {
		return correo;
	}


	public void setCorreo(String correo) {
		this.correo = correo;
	}


	public int getPosPregunta() {
		return posPregunta;
	}


	public void setPosPregunta(int posPregunta) {
		this.posPregunta = posPregunta;
	}


	public ContestarVO(int idEntrada, int tipo, String correo, int posPregunta) {
		super();
		this.idEntrada = idEntrada;
		this.tipo = tipo;
		this.correo = correo;
		this.posPregunta = posPregunta;
	}
	
	
}
