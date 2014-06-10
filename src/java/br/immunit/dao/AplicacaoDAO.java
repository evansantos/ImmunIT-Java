package br.immunit.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AplicacaoDAO extends DAO{
    
    public void cadastraVacina(int lote, int vacina, String data, int quantidade, int cnes) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "INSERT INTO Controle (con_Lote, vac_Cod, con_Validade, con_Quantidade, ubs_Cnes) VALUES "
                     + "(" + lote + "," + vacina + ",'" + data + "'," + quantidade + "," + cnes + ")"; 
 
        stmt.execute(sql);
        stop();
        
    }    
    
}