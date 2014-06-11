package br.immunit.dao;

import java.sql.ResultSet;
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
        
        String sqlVacina = "SELECT MAX(apl_CodApl) AS Codigo FROM Aplicacao WHERE con_Lote = "+ lote +" AND ubs_Cnes = "+ cnes +" "
                + "AND pac_CartSUS = "+ cartaoSUS +" AND apl_DataApl = '"+ data +"'";
        ResultSet rs = stmt.executeQuery(sqlVacina);
        rs.next();
        
        int codAplicacao = rs.getInt("Codigo");
        
        String sqlCarteirinha = "INSERT INTO Carteirinha (pac_CartSus, apl_CodApl) VALUES "
                + "(" + cartaoSUS + "," + codAplicacao + ")"; 
        stmt.execute(sqlCarteirinha);
        
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