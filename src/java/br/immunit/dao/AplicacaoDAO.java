package br.immunit.dao;

import br.immunit.model.CarteirinhaModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AplicacaoDAO extends DAO{
    
    public void cadastraVacina(int lote, int cnes, long cartaoSUS, String data, String login) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "INSERT INTO Aplicacao (con_Lote, ubs_Cnes, pac_CartSUS, apl_DataApl, log_Login) VALUES "
                + "(" + lote + "," + cnes + "," + cartaoSUS + ",'" + data + "','" + login + "')"; 
        stmt.execute(sql);
        
        ControleVacinaDAO controle = new ControleVacinaDAO();
        controle.atualizaLote(lote);        
        
        String sqlVacina = "SELECT MAX(apl_CodApl) AS Codigo FROM Aplicacao WHERE con_Lote = "+ lote +" AND ubs_Cnes = "+ cnes +" "
                + "AND pac_CartSUS = "+ cartaoSUS +" AND apl_DataApl = '"+ data +"' AND log_Login = '" + login + "'";
        ResultSet rs = stmt.executeQuery(sqlVacina);
        rs.next();
        
        int codAplicacao = rs.getInt("Codigo");
        
        String sqlCarteirinha = "INSERT INTO Carteirinha (pac_CartSus, apl_CodApl) VALUES "
                + "(" + cartaoSUS + "," + codAplicacao + ")"; 
        stmt.execute(sqlCarteirinha);
        
        stop();
        
    }
   
    public List<CarteirinhaModel> preencheCarteirinha(String cartaoSUS, String vacina) throws SQLException{
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql = "SELECT DISTINCT aplicacao.apl_DataApl, aplicacao.con_Lote, aplicacao.log_Login, "
                + "vacina.vac_Nome FROM paciente LEFT JOIN carteirinha ON "
                + "paciente.pac_CartSus = carteirinha.pac_CartSus INNER JOIN aplicacao ON "
                + "carteirinha.apl_CodApl = aplicacao.apl_CodApl INNER JOIN controle ON "
                + "aplicacao.con_Lote = controle.con_Lote INNER JOIN vacina ON "
                + "controle.vac_Cod = vacina.vac_Cod WHERE paciente.pac_CartSus = " + cartaoSUS + " "
                + "AND vacina.vac_Nome LIKE '%" + vacina + "%'";
        
        ResultSet rs = stmt.executeQuery(sql);
        
        List<CarteirinhaModel> lista = new ArrayList<CarteirinhaModel>();
        
        while(rs.next()){
            
            CarteirinhaModel c = new CarteirinhaModel();
            
            c.setNomeVacina(rs.getString("vacina.vac_Nome"));
            c.setCodigoLote(rs.getInt("aplicacao.con_Lote"));
            
            String dia = rs.getString("aplicacao.apl_DataApl").substring(8,10);
            String mes = rs.getString("aplicacao.apl_DataApl").substring(5,7);
            String ano = rs.getString("aplicacao.apl_DataApl").substring(0,4);
            String dataAplicacao = dia + "/" + mes + "/" + ano;
            c.setDataVacinacao(dataAplicacao);
            
            String loginUser = rs.getString("aplicacao.log_Login");
            
            Statement stmt1 = conn.createStatement();
            String sqlUser = "SELECT usu_Nome, usu_Sobrenome, usu_Rg FROM Usuario WHERE log_Login = '" + loginUser + "'";
            ResultSet rsUser = stmt1.executeQuery(sqlUser);
            rsUser.next();
            
            String nome = rsUser.getString("usu_Nome");
            String sobrenome = rsUser.getString("usu_Sobrenome");
            
            String nCompleto = nome.replace(" ", ";") + ";" + sobrenome.replace(" ", ";");
            String [] vNome = nCompleto.split(";");
            int qtdNome = vNome.length;
            
            String pNome = vNome[0].toString();
            String uNome = vNome[qtdNome-1].toString();
            String nomeUsuario = pNome + " " + uNome;
            String rg = rsUser.getString("usu_Rg");
            
            rsUser.close();
            
            c.setNomeUsuario(nomeUsuario);
            c.setRgUsuario(rg);
            
            lista.add(c);
        }

        return lista;
    }    
    
}