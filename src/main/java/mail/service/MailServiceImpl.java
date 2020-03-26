package mail.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender javaMailSender;

	@Override
	public void signMail(String to, int random,HttpSession session) {
		MimeMessage message = javaMailSender.createMimeMessage();

		int ran = new Random().nextInt(900000) + 100000;
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		System.out.println("랜덤 "+random);
		System.out.println("어스코드 "+authCode);
		String subject = "[dogiver] 인증 메일";
		String from = "dogiver503@gmail.com";

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText("귀하의 이메일 인증 번호는 " + authCode + " 입니다." + "\n감사합니다!");
			messageHelper.setFrom(from);

			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
