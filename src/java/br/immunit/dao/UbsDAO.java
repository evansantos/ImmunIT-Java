package br.immunit.dao;

import br.immunit.model.UbsModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UbsDAO extends DAO{
    
    public void cadastraUBS(int cnes, String nomeFantasia, String razaoSocial, String telefone, 
            boolean ativo, int numero, String cep, String endereco, String bairro, String cidade, 
            String estado, boolean cadastrarEndereco) 
            throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "INSERT INTO ubs (ubs_Cnes, ubs_NomeFantasia, ubs_RazaoSocial, ubs_Telefone, "
                     + "end_Cep, ubs_Numero, ubs_Ativo) VALUES "
                     + "(" + cnes + ",'" + nomeFantasia + "','" + razaoSocial + "','" + telefone + "',"
                     + "'" + cep + "'," + numero + "," + ativo + ")"; 
        
        stmt.execute(sql);
        stop();
        
        if(cadastrarEndereco != true){
            EnderecoDAO e = new EnderecoDAO();
            e.cadastraEndereco(cep, endereco, bairro, cidade, estado);
        }
        
    }
    
    public boolean pesquisaUBSNome(String ubs) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement(); 
        
        String sql;
        
        if(ubs.equals("*")){
            
            sql = "SELECT COUNT(*) AS Quantidade FROM ubs INNER JOIN "
                + "endereco ON ubs.end_Cep = endereco.end_Cep";
            
        }else{
        
            sql = "SELECT COUNT(*) AS Quantidade FROM ubs INNER JOIN "
                + "endereco ON ubs.end_Cep = endereco.end_Cep "
                + "WHERE ubs_NomeFantasia LIKE '%" + ubs + "%'"; 
        }

        ResultSet rs = stmt.executeQuery(sql);
        rs.next();

        boolean resultado = false;

        if (rs.getInt("Quantidade") > 0) {
            resultado = true;
        }

        stop();
        return resultado;
    }
    
    public boolean pesquisaUBS(int cnes) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT COUNT(*) AS Quantidade FROM ubs INNER JOIN endereco ON ubs.end_Cep = endereco.end_Cep "
                   + "WHERE ubs.ubs_Cnes = " + cnes + ""; 

        ResultSet rs = stmt.executeQuery(sql);
        rs.next();

        boolean resultado = false;

        if (rs.getInt("Quantidade") > 0) {
            resultado = true;
        }

        stop();
        return resultado;
    }
    
    public List<UbsModel> preencheLista(String ubs) throws SQLException {
               
        start();
        Statement stmt = conn.createStatement();

        String sql;
        
        if(ubs == null){
            ubs = "*";
        }
        
        if(ubs.equals("*")){
            
            sql = "SELECT Ubs.*, Endereco.* FROM Ubs INNER JOIN"
                + " Endereco ON Ubs.end_Cep = Endereco.end_Cep";
            
        }else{
        
            sql = "SELECT Ubs.*, Endereco.* FROM Ubs INNER JOIN"
                    + " Endereco ON Ubs.end_Cep = Endereco.end_Cep "
                    + "WHERE ubs_NomeFantasia LIKE '%" + ubs + "%'"; 
        }
        
        ResultSet rs = stmt.executeQuery(sql);
        
        List<UbsModel> lista = new ArrayList<UbsModel>();

        while (rs.next()) {
            
            UbsModel u = new UbsModel();
            
            u.setCnes(rs.getInt("Ubs.ubs_Cnes"));
            u.setNomeFantasia(rs.getString("Ubs.ubs_NomeFantasia"));
            u.setRazaoSocial(rs.getString("Ubs.ubs_RazaoSocial"));
            u.setTelefone(rs.getString("Ubs.ubs_Telefone"));
            u.setCep(rs.getString("Endereco.end_Cep"));
            u.setEndereco(rs.getString("Endereco.end_Endereco"));
            u.setNumero(rs.getInt("Ubs.ubs_Numero"));
            u.setBairro(rs.getString("Endereco.end_Bairro"));
            u.setCidade(rs.getString("Endereco.end_Cidade"));
            u.setEstado(rs.getString("Endereco.end_Estado"));
            u.setAtivo(rs.getBoolean("Ubs.ubs_Ativo"));
            
            lista.add(u);
            
        }

        stop();
        return lista;
        
    }

    public List<UbsModel> preencheListaNome(int cnes) throws SQLException {
               
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT Ubs.*, Endereco.* FROM Ubs INNER JOIN Endereco ON Ubs.end_Cep = Endereco.end_Cep "
                   + "WHERE Ubs.ubs_Cnes = " + cnes + ""; 
        
        ResultSet rs = stmt.executeQuery(sql);
        
        List<UbsModel> lista = new ArrayList<UbsModel>();

        while (rs.next()) {
            
            UbsModel ubs = new UbsModel();
            
            ubs.setCnes(rs.getInt("Ubs.ubs_Cnes"));
            ubs.setNomeFantasia(rs.getString("Ubs.ubs_NomeFantasia"));
            ubs.setRazaoSocial(rs.getString("Ubs.ubs_RazaoSocial"));
            ubs.setTelefone(rs.getString("Ubs.ubs_Telefone"));
            ubs.setCep(rs.getString("Endereco.end_Cep"));
            ubs.setEndereco(rs.getString("Endereco.end_Endereco"));
            ubs.setNumero(rs.getInt("Ubs.ubs_Numero"));
            ubs.setBairro(rs.getString("Endereco.end_Bairro"));
            ubs.setCidade(rs.getString("Endereco.end_Cidade"));
            ubs.setEstado(rs.getString("Endereco.end_Estado"));
            ubs.setAtivo(rs.getBoolean("Ubs.ubs_Ativo"));
            
            lista.add(ubs);
            
        }

        stop();
        return lista;
        
    }
    
    public void atualizaUBS(int cnes, String nomeFantasia, String razaoSocial, String telefone, boolean ativo) 
            throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "UPDATE ubs SET ubs_NomeFantasia = '" + nomeFantasia + "', "
                + "ubs_RazaoSocial = '" + razaoSocial + "', "
                + "ubs_telefone = '" + telefone + "', ubs_ativo = " + ativo + " "
                + "WHERE ubs_cnes = " + cnes + ""; 
        
        stmt.execute(sql);
        stop();
        
    }
    
    public List<UbsModel> listaUBS() throws SQLException {

        start();
               
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM ubs WHERE ubs_Ativo = " + true + ""; 

        ResultSet rs = stmt.executeQuery(sql);
        
        List<UbsModel> lista = new ArrayList<UbsModel>();

        while (rs.next()) {
            UbsModel ubs = new UbsModel();
            ubs.setNomeFantasia(rs.getString("ubs_NomeFantasia"));
            lista.add(ubs);
        }

        stop();
        return lista;
    }
    
    public int buscaUBS(String nomeFantasia) throws SQLException {

        start();
               
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM ubs WHERE ubs_NomeFantasia = '" + nomeFantasia + "'"; 

        ResultSet rs = stmt.executeQuery(sql);
        
        int cnes = 0;
        
        if(rs.next()) {
            cnes = Integer.parseInt(rs.getString("ubs_Cnes"));
        }

        stop();
        return cnes;
    }
    
    public void excluiUbs(int cnes) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "DELETE FROM Ubs WHERE ubs_Cnes = " + cnes  + "";
        stmt.execute(sql);
        
        stop();
       
    }
    
}