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
    
    public List<VacinaModel> preencheLista() throws SQLException {
               
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM vacina";

        ResultSet rs = stmt.executeQuery(sql);
        
        List<VacinaModel> lista = new ArrayList<VacinaModel>();

        while (rs.next()) {
            VacinaModel vacina = new VacinaModel();
            vacina.setCodigo(rs.getInt("vac_Cod"));
            vacina.setNome(rs.getString("vac_Nome"));
            lista.add(vacina);
        }
                
        stop();
        return lista;
    }
    
}