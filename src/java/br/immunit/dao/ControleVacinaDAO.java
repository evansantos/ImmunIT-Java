package br.immunit.dao;

import br.immunit.model.UbsModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ControleVacinaDAO extends DAO{
    
    public void cadastraVacina(int vacina, int lote, String data, int quantidade) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "INSERT INTO Controle (con_Lote, vac_Cod, con_Validade, con_Quantidade) VALUES "
                     + "(" + vacina + "," + lote + ",'" + data + "'," + quantidade + ")"; 
        
        stmt.execute(sql);
        stop();
                
    }
    
}
