package br.immunit.dao;

import br.immunit.model.VacinaModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VacinaDAO extends DAO {
    
    public void cadastraVacina(String nome)throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
       
        String sql = "INSERT INTO vacina (vac_Nome) VALUES ('" + nome + "')";

        stmt.execute(sql);
        stop();

    }
    
    public List<VacinaModel> preencheLista(String vacina) throws SQLException {
               
        start();
        Statement stmt = conn.createStatement();
        
        String sql;
        
        if(vacina.equals("*")){
        
            sql = "SELECT * FROM vacina";

        }else{
            
            sql = "SELECT * FROM vacina WHERE vac_Nome LIKE '%" + vacina + "%'";
            
        }
        
        ResultSet rs = stmt.executeQuery(sql);
        
        List<VacinaModel> lista = new ArrayList<VacinaModel>();

        while (rs.next()) {
            VacinaModel v = new VacinaModel();
            v.setCodigo(rs.getInt("vac_Cod"));
            v.setNome(rs.getString("vac_Nome"));
            lista.add(v);
        }
                
        stop();
        return lista;
    }
    
    public List<VacinaModel> preencheListaNome(int codigo) throws SQLException {
               
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM Vacina WHERE vac_Cod = " + codigo + ""; 
        
        ResultSet rs = stmt.executeQuery(sql);
        
        List<VacinaModel> lista = new ArrayList<VacinaModel>();

        while (rs.next()) {
            VacinaModel v = new VacinaModel();
            v.setCodigo(rs.getInt("vac_Cod"));
            v.setNome(rs.getString("vac_Nome"));
            lista.add(v);
        }

        stop();
        return lista;
    }
    
    public boolean pesquisaVacinaNome(String vacina) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement(); 
        
        String sql;
        
        if(vacina.equals("*")){
            
            sql = "SELECT COUNT(*) AS Quantidade FROM Vacina";
            
        }else{
        
            sql = "SELECT COUNT(*) AS Quantidade FROM Vacina "
                + "WHERE vac_Nome LIKE '%" + vacina + "%'"; 
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
    
    public void atualizaVacina(int codigo, String nome)throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "UPDATE Vacina SET vac_Nome = '" + nome + "' "
                + "WHERE vac_Cod = " + codigo + ""; 
        
        stmt.execute(sql);
        stop();
        
    }
    
    public int buscaVacina(String nomeVacina) throws SQLException {

        start();
               
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM Vacina WHERE vac_Nome = '" + nomeVacina + "'"; 

        ResultSet rs = stmt.executeQuery(sql);
        
        int cod = 0;
        
        if(rs.next()) {
            cod = Integer.parseInt(rs.getString("vac_Cod"));
        }

        stop();
        return cod;
    }
    
}