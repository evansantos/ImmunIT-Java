package br.immunit.dao;

import br.immunit.model.FuncaoModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoginDAO extends DAO{
    
    public boolean autentica(String login, String senha) throws SQLException {
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT COUNT(*) AS Quantidade FROM login WHERE log_Login = '"
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
    
    public void cadastraLogin(String login) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "INSERT INTO login (log_Login, log_Senha) VALUES (" + login + ", 'Teste')";
       
        stmt.execute(sql);
        stop();
        
    }
    
    public String pesquisaSenha(String login) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM login WHERE log_Login = '"+ login + "'";
        
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        
        String senha = rs.getString("log_Senha");
  
        return senha;
        
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
        
        //Fecha a conexão do banco de dados
        stop();
        return lista;
        
    }
    
}