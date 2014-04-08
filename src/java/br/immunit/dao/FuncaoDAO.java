package br.immunit.dao;

import br.immunit.model.FuncaoModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FuncaoDAO extends DAO{
    
    public List<FuncaoModel> preencheLista() throws SQLException {
               
        start();

        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM funcao";
        
        ResultSet rs = stmt.executeQuery(sql);
        
        List<FuncaoModel> lista = new ArrayList<FuncaoModel>();

        while (rs.next()) {
            FuncaoModel funcao = new FuncaoModel();
            funcao.setFuncao(rs.getString("fun_Funcao"));
            lista.add(funcao);
        }
        stop();
        return lista;
    }
    
    public int buscaFuncao(String nomeFuncao) throws SQLException {

        start();
               
        Statement stmt = conn.createStatement();

        String sql = "SELECT * FROM funcao WHERE fun_Funcao = '" + nomeFuncao + "'"; 

        ResultSet rs = stmt.executeQuery(sql);
        
        int codigo = 0;
        
        if(rs.next()) {
            codigo = Integer.parseInt(rs.getString("fun_CodFun"));
        }

        stop();
        return codigo;
    }
    
}