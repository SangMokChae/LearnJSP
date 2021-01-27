package mailtest;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("chsm3285@gmail.com", "ucqugytdhfydszqm");
	}
	// 구글 2차 비번 사용해야됨
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
