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
        String u_Cnes = "";
        
        if(!login.equals("Admin")){
            UserDAO u = new UserDAO();
            u_Cnes = u.buscaUbsUser(login, 0);  
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
                + "WHERE Controle.ubs_Cnes = " + Integer.parseInt(u_Cnes) + "";
        }else{
            sql = "SELECT Controle.*, Vacina.* FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Controle.ubs_Cnes = " + Integer.parseInt(u_Cnes) + " AND "
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
        String u_Cnes = "";
        
        if(!login.equals("Admin")){
            UserDAO u = new UserDAO();
            u_Cnes = u.buscaUbsUser(login, 0);
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
                + "WHERE Controle.ubs_Cnes = " + Integer.parseInt(u_Cnes) + "";            
        }else{        
            sql = "SELECT COUNT(*) AS Quantidade FROM Controle "
                + "INNER JOIN Vacina ON Controle.vac_Cod = Vacina.vac_Cod "
                + "WHERE Controle.ubs_Cnes = " + Integer.parseInt(u_Cnes) + " AND "
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
    
    public List<ControleVacinaModel> preencheRelatorio(String ubs, String vacina, String lote, 
            String validade, String login)throws SQLException {

        start();
        Statement stmt = conn.createStatement();
        
        String sqlUbs;
        String sqlVac;
        String sqlLot;
        String sqlVal;
        
        int u_Cnes = 0;
        int v_Cod = 0;
        int c_Lote = 0;
        String c_Validade;
        
        String sql = "SELECT Controle.*, Vacina.* FROM Controle INNER JOIN Vacina ON "
                + "Controle.vac_Cod = Vacina.vac_Cod";
        
        if(!ubs.equals("Todos")){
            UbsDAO u = new UbsDAO();
            u_Cnes = u.buscaUBS(ubs);
            sqlUbs = " WHERE Controle.ubs_Cnes = " +  u_Cnes + "";
            sql += sqlUbs;
        }
        
        if(!vacina.equals("*")){
            VacinaDAO v = new VacinaDAO();
            v_Cod = v.buscaVacina(vacina);
            if(u_Cnes == 0){
                sqlVac = " WHERE Controle.vac_Cod = " +  v_Cod + "";
            }else{
                sqlVac = " AND Controle.vac_Cod = " +  v_Cod + "";
            }
            sql += sqlVac;
        }
        
        if(!lote.equals("")){
            if(u_Cnes == 0 && v_Cod == 0){
                sqlLot = " WHERE Controle.con_Lote = " +  lote + ""; 
            }else{
                sqlLot = " AND Controle.con_Lote = " +  lote + "";
            }
            sql += sqlLot;
        }
        
        if(!validade.isEmpty()){
            
            String dia = validade.substring(0,2);
            String mes = validade.substring(3,5);
            String ano = validade.substring(6,10);
            
            c_Validade = ano + "-" + mes + "-" + dia;

            
            if(u_Cnes == 0 && v_Cod == 0 && c_Lote == 0){           
                sqlVal = " WHERE Controle.con_Validade = '" + c_Validade + "'";
            }else{
                sqlVal = " AND Controle.con_Validade = '" + c_Validade + "'";
            }
            sql += sqlVal;
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
            
            String val = dia + "/" + mes + "/" + ano;
            c.setValidade(val);
            
            c.setQuantidade(rs.getInt("Controle.con_Quantidade"));
            
            lista.add(c);            
        }

        stop();
        return lista;    
    }
    
    public List<ControleVacinaModel> preencheLote(int codigo) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "SELECT * FROM controle WHERE vac_Cod = " + codigo + " AND con_Quantidade > 0";
        ResultSet rs = stmt.executeQuery(sql);
        
        List<ControleVacinaModel> lista = new ArrayList<ControleVacinaModel>();

        while (rs.next()) {
            ControleVacinaModel c = new ControleVacinaModel();
            c.setCodigo(rs.getInt("con_Lote"));
            lista.add(c);
        }
                
        stop();
        return lista;
        
    }
    
}