package mail.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender javaMailSender;

	@Override
	public String signMail(String to) {
		MimeMessage message = javaMailSender.createMimeMessage();

		int random = new Random().nextInt(10000) + 1000;
		String code = random+"";
		System.out.println("service = " + random);
		String subject = "[dogiver] 인증 메일";
		String from = "dogiver503@gmail.com";

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText("이메일 인증 번호는 " + random + " 입니다." + "\n감사합니다!");
			messageHelper.setFrom(from);

			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return code;

	}

}
