package br.immunit.dao;

import br.immunit.model.FuncaoModel;
import br.immunit.controller.EnviarEmail;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.mail.EmailException;

public class LoginDAO extends DAO{
    
    public boolean autentica(String login, String senha) throws SQLException {
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT COUNT(*) AS Quantidade FROM login WHERE log_Login COLLATE utf8_bin = '"
                + login + "' AND log_Senha COLLATE utf8_bin = '" + senha + "'";
        
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();

        boolean resultado = false;

        if (rs.getInt("Quantidade") > 0) {
            resultado = true;
        }

        stop();
        return resultado;
    }
    
    public String pesquisaLogin(String login) throws SQLException {
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM Login WHERE log_Login LIKE '" + login + "%'";
        
        ResultSet rs = stmt.executeQuery(sql);
        String l = "";
        
        while(rs.next()){
            l = rs.getString("log_Login");
        }
        
        return l;
        
    }
    
    public void cadastraLogin(String login, String nome, String sobrenome, String email) throws SQLException, EmailException {
        
        start();
        Statement stmt = conn.createStatement();

        String senhaLogin = geraSenha();
        
        String sql = "INSERT INTO login (log_Login, log_Senha) VALUES ('" + login + "','" + senhaLogin + "')";
       
        stmt.execute(sql);
        stop();
        
        EnviarEmail e = new EnviarEmail();
        e.criaEmail(login, senhaLogin, nome, sobrenome, email);
        
    }
    
    public String pesquisaSenha(String login) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM login WHERE log_Login = '"+ login + "'";
        
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        
        String senhaCadastrada = rs.getString("log_Senha");
  
        return senhaCadastrada;
        
    }
    
    public void atualizaSenha(String login, String senha) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "UPDATE login SET log_Senha = '" + senha + "' WHERE log_Login = '" + login + "'";
       
        stmt.execute(sql);
        stop();
        
    }
    
    public List<FuncaoModel> perfilUser(String login) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT funcao.fun_Funcao FROM funcao INNER JOIN usuario ON  "
                   + "usuario.fun_CodFuncao = funcao.fun_CodFun INNER JOIN "
                   + "login ON login.log_Login = usuario.log_Login "
                   + "WHERE usuario.log_Login = '" + login + "'";
       
        ResultSet rs = stmt.executeQuery(sql);
        
        List<FuncaoModel> lista = new ArrayList<FuncaoModel>();

        while (rs.next()) {
            FuncaoModel funcao = new FuncaoModel();
            funcao.setFuncao(rs.getString("funcao.fun_Funcao"));
            lista.add(funcao);
        }
        
        stop();
        return lista;
        
    }
    
    public boolean enviaSenha(String cpf) throws SQLException, EmailException {
        
        start();
        Statement stmt = conn.createStatement();
        
        String sqlPac = "SELECT Login.*, Paciente.* FROM Login INNER JOIN Paciente ON "
                + "Paciente.log_Login = Login.log_Login "
                + "WHERE Paciente.pac_Cpf = " + cpf + "";
        
        ResultSet rsPac = stmt.executeQuery(sqlPac);    

        boolean resultado = false;
        EnviarEmail e = new EnviarEmail();

        if (rsPac.next()) {            
            resultado = true;

            String login = rsPac.getString("Login.log_Login");
            String senhaLogin = rsPac.getString("Login.log_Senha");
            String nome = rsPac.getString("Paciente.pac_Nome");
            String sobrenome = rsPac.getString("Paciente.pac_Sobrenome");
            String email = rsPac.getString("Paciente.pac_Email");
            
            e.criaEmail(login, senhaLogin, nome, sobrenome, email);
        }
        
        String sqlUser = "SELECT Login.*, Usuario.* FROM Login INNER JOIN Usuario ON "
                + "Usuario.log_Login = Login.log_Login "
                + "WHERE Usuario.usu_Cpf = " + cpf + "";
        
        ResultSet rsUser = stmt.executeQuery(sqlUser);    

        if (rsUser.next()) {            
            resultado = true;

            String login = rsUser.getString("Login.log_Login");
            String senhaLogin = rsUser.getString("Login.log_Senha");
            String nome = rsUser.getString("Usuario.usu_Nome");
            String sobrenome = rsUser.getString("Usuario.usu_Sobrenome");
            String email = rsUser.getString("Usuario.usu_Email");
            
            e.criaEmail(login, senhaLogin, nome, sobrenome, email);
        }

        stop();
        return resultado;
    }
    
   //CRIPTOGRAFIA USANDO SHA2 (SHA-224, SHA-256, SHA-384, e SHA-512)
   /*public String criptografa(String senha) throws UnsupportedEncodingException{  

       try{  
         
            MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
            byte messageDigest[];
            messageDigest = algorithm.digest(senha.getBytes("UTF-8"));

            StringBuilder hexString = new StringBuilder();

            for (byte b : messageDigest) {
              hexString.append(String.format("%02X", 0xFF & b));
            }

            senha = hexString.toString();
        
        }catch(NoSuchAlgorithmException ns){  
            ns.getMessage();
        }  
        
        return senha;  

    }*/ 
    
    public String geraSenha(){  
  
        String criaSenha = "";
        
        for(int i=0; i<2; i++){
            int n = 65 + (int)(Math.random() * 25);  
            char s = (char)n; 
            criaSenha = criaSenha + s;        
        }
                
        for(int i=0; i<1; i++){
            int n = 48 + (int)(Math.random() * 9);  
            char s = (char)n; 
            criaSenha = criaSenha + s;        
        }
        
        for(int i=0; i<6; i++){
            int n = 97 + (int)(Math.random() * 25);  
            char s = (char)n; 
            criaSenha = criaSenha + s;        
        }

        return criaSenha;
    }  
    
}