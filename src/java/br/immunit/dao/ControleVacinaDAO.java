package br.immunit.dao;

import br.immunit.model.ControleVacinaModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ControleVacinaDAO extends DAO{
    
    public void cadastraVacina(int lote, int vacina, String data, int quantidade, int cnes) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "INSERT INTO Controle (con_Lote, vac_Cod, con_Validade, con_Quantidade, ubs_Cnes) VALUES "
                     + "(" + lote + "," + vacina + ",'" + data + "'," + quantidade + "," + cnes + ")"; 
 
        stmt.execute(sql);
        stop();
        
    }
    
    public List<ControleVacinaModel> preencheLista(String login, String vacina) throws SQLException {
        
        start();
        Statement stmt = conn.createStatement();

        String sql;
        int u_Cnes = 0;
        
        if(!login.equals("Admin")){
            UserDAO u = new UserDAO();
            u_Cnes = u.buscaUbsUser(login);  
        }
        
        if(vacina == null){
            vacina = "*";
        }
        
        if(login.equals("Admin") && vacina.equals("*")){
            sql = "SELECT Controle.*, Vacina.* FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod";
        }else if(login.equals("Admin")){
            sql = "SELECT Controle.*, Vacina.* FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Vacina.vac_Nome LIKE '%" + vacina + "%'"; 
        }else if(vacina.equals("*")){  
            sql = "SELECT Controle.*, Vacina.* FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Controle.ubs_Cnes = " + u_Cnes + "";
        }else{
            sql = "SELECT Controle.*, Vacina.* FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Controle.ubs_Cnes = " + u_Cnes + " AND "
                + "Vacina.vac_Nome LIKE '%" + vacina + "%'";
        }    
                
        ResultSet rs = stmt.executeQuery(sql);        
        List<ControleVacinaModel> lista = new ArrayList<ControleVacinaModel>();

        while (rs.next()) {            
            ControleVacinaModel c = new ControleVacinaModel();
            
            c.setCodigo(rs.getInt("Controle.con_Lote"));
            c.setNomeVacina(rs.getString("Vacina.vac_Nome"));
            
            String dia = rs.getString("Controle.con_Validade").substring(8,10);
            String mes = rs.getString("Controle.con_Validade").substring(5,7);
            String ano = rs.getString("Controle.con_Validade").substring(0,4);
            
            String validade = dia + "/" + mes + "/" + ano;
            c.setValidade(validade);
            
            c.setQuantidade(rs.getInt("Controle.con_Quantidade"));
            
            lista.add(c);            
        }

        stop();
        return lista;
        
    }
    
    public boolean pesquisaControlVacina(String login, String vacina) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();

        String sql;
        int u_Cnes = 0;
        
        if(!login.equals("Admin")){
            UserDAO u = new UserDAO();
            u_Cnes = u.buscaUbsUser(login);
        }
        
        if(vacina == null){
            vacina = "*";
        }
        
        if(login.equals("Admin") && vacina.equals("*")){
            sql = "SELECT COUNT(*) AS Quantidade FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod";  
        }else if(login.equals("Admin")){
            sql = "SELECT COUNT(*) AS Quantidade FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Vacina.vac_Nome LIKE '%" + vacina + "%'"; 
        }else if(vacina.equals("*")){            
            sql = "SELECT COUNT(*) AS Quantidade FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Controle.ubs_Cnes = " + u_Cnes + "";            
        }else{        
            sql = "SELECT COUNT(*) AS Quantidade FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Controle.ubs_Cnes = " + u_Cnes + " AND "
                + "Vacina.vac_Nome LIKE '%" + vacina + "%'"; 
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
    
    public boolean pesquisaLote(int lote) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "SELECT * FROM controle WHERE con_Lote = " + lote + "";
        ResultSet rs = stmt.executeQuery(sql);
        
        boolean resultado = false;
        
        if(rs.next()){
            resultado = true;
        }
        
        stop();
        return resultado;
        
    }    
}
