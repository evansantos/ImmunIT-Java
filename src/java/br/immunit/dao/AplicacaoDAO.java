package br.immunit.dao;

import java.sql.SQLException;
import java.sql.Statement;

public class AplicacaoDAO extends DAO{
    
    public void cadastraVacina(int lote, int cnes, long cartaoSUS, String data) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "INSERT INTO Aplicacao (con_Lote, ubs_Cnes, pac_CartSUS, apl_DataApl) VALUES "
                + "(" + lote + "," + cnes + "," + cartaoSUS + ",'" + data + "')"; 
 
        stmt.execute(sql);
        
        ControleVacinaDAO controle = new ControleVacinaDAO();
        controle.atualizaLote(lote);
        
        stop();
        
    }
    
    public boolean pesquisaVacina(int lote) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = ""; 
 
        stmt.execute(sql);
        stop();
        
        return true;
        
    }
    
}