package br.immunit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    
    String driver = "com.mysql.jdbc.Driver"; //Classe do driver JDBC
    String banco = "db_immunit"; //Nome do Banco criado
    String host = "localhost"; //Maquina onde está o banco
    String str_conn = "jdbc:mysql://" + host + ":3307/" + banco; //URL de conexão
    String usuario = "root"; //Usuário do banco
    String senha = "root"; //Senha de conexão
    Connection conn = null;

    //Inicia a coneão com o banco de dados
    protected void start() {
        try {
            Class.forName(driver); //Carrega o driver

            //Obtém a conexão com o banco
            conn = DriverManager.getConnection(str_conn, usuario, senha);

        } catch (ClassNotFoundException ex) {
            System.out.println("Não foi possível carregar o driver: " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Problema com o SQL");
            System.out.println("SQLException: " + ex.getMessage());
        }
    }

    //Finaliza a conexão com o banco de dados
    protected void stop() throws SQLException {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            String errorMsg = "Nao foi possivel fechar a conexao com o banco";
            System.err.print(errorMsg + e.getMessage());
        }
    }
    
}