package mail.service;

import javax.servlet.http.HttpSession;

public interface MailService {

	public void signMail(String to, int random, HttpSession session);
}
