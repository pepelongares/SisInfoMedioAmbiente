package datos.VO;

import java.sql.Date;

public class EntradaVO {
	
	private int id;
	private String urlImagen;
	private String titulo;
	private Date fecha;
	private String noticia;
	private String reto;
	private String consejo;
	private int estado;
	private int idGrupo;
	
	//Cuestionarios
	private CuestionarioVO preguntas;
	private CuestionarioVO opinion;
	
	
	
	
	public EntradaVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EntradaVO(Date fecha, int estado, int idGrupo, String titulo, String urlImagen, String reto, String consejo,
			int id, String noticia, CuestionarioVO preguntas, CuestionarioVO opinion) {
		super();
		this.fecha = fecha;
		this.estado = estado;
		this.idGrupo = idGrupo;
		this.titulo = titulo;
		this.urlImagen = urlImagen;
		this.reto = reto;
		this.consejo = consejo;
		this.id = id;
		this.noticia = noticia;
		this.preguntas = preguntas;
		this.opinion = opinion;
	}

	@Override
	public String toString() {
		return "EntradaVO [fecha=" + fecha + ", estado=" + estado + ", idGrupo=" + idGrupo + ", titulo=" + titulo
				+ ", urlImagen=" + urlImagen + ", reto=" + reto + ", consejo=" + consejo + ", id=" + id + ", noticia="
				+ noticia + ", preguntas=" + preguntas + ", opinion=" + opinion + "]";
	}
	
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getUrlImagen() {
		return urlImagen;
	}
	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}
	public String getReto() {
		return reto;
	}
	public void setReto(String reto) {
		this.reto = reto;
	}
	public String getConsejo() {
		return consejo;
	}
	public void setConsejo(String consejo) {
		this.consejo = consejo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNoticia() {
		return noticia;
	}
	public void setNoticia(String noticia) {
		this.noticia = noticia;
	}
	public CuestionarioVO getPreguntas() {
		return preguntas;
	}
	public void setPreguntas(CuestionarioVO preguntas) {
		this.preguntas = preguntas;
	}
	public CuestionarioVO getOpinion() {
		return opinion;
	}
	public void setOpinion(CuestionarioVO opinion) {
		this.opinion = opinion;
	}
}
