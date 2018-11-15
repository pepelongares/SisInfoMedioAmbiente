package datos.VO;

import java.util.List;

public class CuestionarioVO {

	public CuestionarioVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	private int tipo;
	private String pregunta;
	private int numFallos;
	private int numAciertos;
	private int posCorrecta;
	private int idEntrada;
	
	private List<RespuestaVO> respuestas;

	public CuestionarioVO(int tipo, String pregunta, int numFallos, int numAciertos, int posCorrecta, int idEntrada,
			List<RespuestaVO> respuestas) {
		super();
		this.tipo = tipo;
		this.pregunta = pregunta;
		this.numFallos = numFallos;
		this.numAciertos = numAciertos;
		this.posCorrecta = posCorrecta;
		this.idEntrada = idEntrada;
		this.respuestas = respuestas;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public String getPregunta() {
		return pregunta;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}

	public int getNumFallos() {
		return numFallos;
	}

	public void setNumFallos(int numFallos) {
		this.numFallos = numFallos;
	}

	public int getNumAciertos() {
		return numAciertos;
	}

	public void setNumAciertos(int numAciertos) {
		this.numAciertos = numAciertos;
	}

	public int getPosCorrecta() {
		return posCorrecta;
	}

	public void setPosCorrecta(int posCorrecta) {
		this.posCorrecta = posCorrecta;
	}

	public int getIdEntrada() {
		return idEntrada;
	}

	public void setIdEntrada(int idEntrada) {
		this.idEntrada = idEntrada;
	}

	public List<RespuestaVO> getRespuestas() {
		return respuestas;
	}

	public void setRespuestas(List<RespuestaVO> respuestas) {
		this.respuestas = respuestas;
	}

	@Override
	public String toString() {
		return "CuestionarioVO [tipo=" + tipo + ", pregunta=" + pregunta + ", numFallos=" + numFallos + ", numAciertos="
				+ numAciertos + ", posCorrecta=" + posCorrecta + ", idEntrada=" + idEntrada + ", respuestas="
				+ respuestas + "]";
	}
	
	
}


