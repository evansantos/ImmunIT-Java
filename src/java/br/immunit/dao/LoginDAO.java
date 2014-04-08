package br.immunit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDAO extends DAO{
    
    public boolean autentica(String login, String senha) throws SQLException {

        //Conexão com banco de dados
        start();

        //Cria um statement para podermos mandar um SQL para o banco
        Statement stmt = conn.createStatement();

        //Mandamos o SQL para o banco e obtemos um ResultSet
        String sql = "SELECT COUNT(*) AS Quantidade FROM login WHERE log_Login = '"
                + login + "' AND log_Senha COLLATE utf8_bin = '" + senha + "'";
        
        //Executa o comando SQL
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();

        //Inicia a várial como falso
        boolean resultado = false;
        
        //Verifica se existe o usuário no banco de dados
        if (rs.getInt("Quantidade") > 0) {
            resultado = true;
        }

        //Fecha a conexão do banco de dados
        stop();
        return resultado;
    }
    
}