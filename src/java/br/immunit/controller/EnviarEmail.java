package br.immunit.controller;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class EnviarEmail {
    
    public void criaEmail(String login, String senha, String nome, String sobrenome, String emails) throws EmailException{
    
        SimpleEmail email = new SimpleEmail();  
  
        try {  
            email.setDebug(true);  
            email.setHostName("smtp.gmail.com");  
            email.setAuthentication("immunitsystem","10TNA-ads");  
            email.setSSL(true);  
            email.addTo(emails); //pode ser qualquer um email  
            email.setFrom("immunitsystem@gmail.com"); //aqui necessita ser o email que voce fara a autenticacao  
            email.setSubject("ImmunIT - Senha");  
            email.setMsg("Olá " + nome + " " + sobrenome + ",\n\n"
                    + "Seu login de acesso é " + login + " sua senha atual é " + senha + "\n"
                    + "Por favor acesse o site www.immunit.com.br e altere sua senha.\n\n"
                    + "Atenciosamente,\n"
                    + "ImmunIT System");  
            email.send();  
  
        } catch (EmailException e) {  
  
            e.getMessage();
  
        }   
  
    }   
    
}