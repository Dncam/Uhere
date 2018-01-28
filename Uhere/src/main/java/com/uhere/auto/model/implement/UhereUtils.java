package com.uhere.auto.model.implement;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import com.uhere.auto.entity.TblUsuario;

public class UhereUtils {

    @Autowired
    private JavaMailSender mailSender;
    
	@Autowired
	private Environment environment;
	
	public static boolean isBase64(byte[] byteArray) {
		if(byteArray == null)
			return true;
		try {
			Base64.getDecoder().decode(byteArray);
			return true;
		}catch(IllegalArgumentException ie) {}
		return false;
	}
	
	public static byte[] redimensionaImage(byte[] byteArrayImage) {
		ByteArrayOutputStream writedImage = null ;
		try {
			BufferedImage originalImage = ImageIO.read(new ByteArrayInputStream(byteArrayImage));
			BufferedImage resizedImage = new BufferedImage(700, 483, BufferedImage.TYPE_INT_RGB);
	        Graphics2D g = resizedImage.createGraphics();
	        g.drawImage(originalImage, 0, 0, 700, 483, null);
	        writedImage = new ByteArrayOutputStream();            
			ImageIO.write(resizedImage,"jpeg", writedImage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writedImage.toByteArray() ;
	}
	
	public void sendEmail(String url,String msg,String subject,TblUsuario tblUsuario) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(tblUsuario.getEmail());
        email.setFrom(environment.getRequiredProperty("mail.user"));
        email.setSubject(subject);
        email.setText(msg + " " + (url == null ? "" : url));
        mailSender.send(email);
	}
}




