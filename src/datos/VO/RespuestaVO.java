package datos.VO;

public class RespuestaVO {
	private int posicion;
	private String cuerpo;
	private int tipoCuestionario;
	private int idEntrada;
	
	
	public int getPosicion() {
		return posicion;
	}


	public void setPosicion(int posicion) {
		this.posicion = posicion;
	}


	public String getCuerpo() {
		return cuerpo;
	}


	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}


	public int getTipoCuestionario() {
		return tipoCuestionario;
	}


	public void setTipoCuestionario(int tipoCuestionario) {
		this.tipoCuestionario = tipoCuestionario;
	}


	public int getIdEntrada() {
		return idEntrada;
	}


	public void setIdEntrada(int idEntrada) {
		this.idEntrada = idEntrada;
	}


	public RespuestaVO(int posicion, String cuerpo, int tipoCuestionario, int idEntrada) {
		super();
		this.posicion = posicion;
		this.cuerpo = cuerpo;
		this.tipoCuestionario = tipoCuestionario;
		this.idEntrada = idEntrada;
	}


	@Override
	public String toString() {
		return "RespuestaVO [posicion=" + posicion + ", cuerpo=" + cuerpo + ", tipoCuestionario=" + tipoCuestionario
				+ ", idEntrada=" + idEntrada + "]";
	}
	
	
}
