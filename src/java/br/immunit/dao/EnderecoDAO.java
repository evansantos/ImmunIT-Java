package br.immunit.dao;

import br.immunit.model.EnderecoModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EnderecoDAO extends DAO{
    
    public List<EnderecoModel> preencheLista(String cep) throws SQLException {
               
        //Conexão com banco de dados
        start();
               
        //Cria um statement para podermos mandar um SQL para o banco
        Statement stmt = conn.createStatement();

        //Mandamos o SQL para o banco e obtemos um ResultSet
        String sql = "SELECT * FROM endereco WHERE end_Cep = '" + cep + "'";
        
        //Executa o comando SQL
        ResultSet rs = stmt.executeQuery(sql);
        
        List<EnderecoModel> lista = new ArrayList<EnderecoModel>();

        while (rs.next()) {
            EnderecoModel endereco = new EnderecoModel();
            endereco.setCep(rs.getString("end_Cep"));
            endereco.setEndereco(rs.getString("end_Endereco"));
            endereco.setBairro(rs.getString("end_Bairro"));
            endereco.setCidade(rs.getString("end_Cidade"));
            endereco.setEstado(rs.getString("end_Estado"));
            lista.add(endereco);
        }
        
        //Fecha a conexão do banco de dados
        stop();
        return lista;
    }
    
    public boolean pesquisa(String cep) throws SQLException {
               
        //Conexão com banco de dados
        start();
               
        //Cria um statement para podermos mandar um SQL para o banco
        Statement stmt = conn.createStatement();

        //Mandamos o SQL para o banco e obtemos um ResultSet
        String sql = "SELECT COUNT(*) AS Quantidade FROM endereco WHERE end_Cep = '" + cep + "'";
        
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
    
    public void cadastraEndereco(String cep, String endereco, String bairro, String cidade, String estado) 
            throws SQLException{

        start();
        Statement stmt = conn.createStatement();
        
        String sql = "INSERT INTO endereco (end_Cep, end_Endereco, end_Bairro, end_Cidade, end_Estado) VALUES "
                   + "('" + cep + "','" + endereco + "','" + bairro + "','" + cidade + "','" + estado + "')"; 
        
        stmt.execute(sql);
        stop();
    }

}