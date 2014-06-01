package br.immunit.controller;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class EnviarEmail {
    
    public void criaEmail(String senha, String nome, String sobrenome, String emails) throws EmailException{
    
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
                    + "Sua senha atual é " + senha + " por favor acesse o site do ImmuIT e altere.\n\n"
                    + "Atenciosamente,\n"
                    + "ImmunIT System");  
            email.send();  
  
        } catch (EmailException e) {  
  
            e.getMessage();
  
        }   
  
    }   
    
}