import java.io.Serializable;

public class Usuario implements Serializable {
	
	String sLogin;
	String sPassword;
		
	Usuario(String l, String p) {
		this.sLogin = l;
		this.sPassword = p;
	}
	
	public String getLogin() {
		return this.sLogin;
	}
	
	public String getPassword() {
		return this.sPassword;
	}
	
	
}


/*
Nota: Estas clases necesitan implements Serializable
para que se puedan serializar
*/