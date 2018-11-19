package datos.VO;

/* La clase UserVO representa el objeto usuario. El cual se conecta al sistema,
 * y realiza acciones.
 */
public class UsuarioVO {
	
	// Atributos privados de la clase
	private String email;
	private String password;
	private int rol;
	private String	name;
	private int year;
	private int puntuation;
	private int group;
	
	

	
	/**
	 * @param email
	 * @param password
	 * @param rol
	 * @param name
	 * @param year
	 * @param puntuation
	 * @param group
	 */
	public UsuarioVO(String email, String password, int rol, String name, int year, int puntuation, int group) {
		super();
		this.email = email;
		this.password = password;
		this.rol = rol;
		this.name = name;
		this.year = year;
		this.puntuation = puntuation;
		this.group = group;
	}




	public UsuarioVO() {
		super();
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRol() {
		return rol;
	}
	public void setRol(int rol) {
		this.rol = rol;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getPuntuation() {
		return puntuation;
	}
	public void setPuntuation(int puntuation) {
		this.puntuation = puntuation;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}

	@Override
	public String toString() {
		return "UserVO [email=" + email + ", password=" + password + ", rol=" + rol + ", name=" + name + ", year="
				+ year + ", puntuation=" + puntuation + ", group=" + group + "]";
	}
	
	

}
