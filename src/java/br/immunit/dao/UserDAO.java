package br.immunit.dao;

import br.immunit.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.mail.EmailException;

public class UserDAO extends DAO{
    
    public void cadastraUser(long cpf, String nome, String sobrenome, String sexo, String dataNascimento,
                             String rg, String email, String cep, int numero, String complemento, String telefone,
                             int ramal, int funcao, int cnes, String login, String endereco, String bairro,
                             String cidade, String estado, boolean cadastrarEndereco) 
            throws SQLException, EmailException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String criaLogin = nome.replace(" ", ";") + ";" + sobrenome.replace(" ", ";");
        String [] vlog = criaLogin.split(";");
        int qtdNome = vlog.length;
        String pLetra = vlog[0].substring(0, 1);
        String uPalavra = vlog[qtdNome-1].toString();
        login = pLetra + uPalavra;
        
        LoginDAO l = new LoginDAO();
        
        String lCad = l.pesquisaLogin(login);
        int uCaracter = 1; 
        
        if(lCad.isEmpty()){
            login = login + uCaracter;
        }else{
            uCaracter = Integer.parseInt(lCad.substring(lCad.length() - 1 , lCad.length()));
            uCaracter += 1;
            login = login + uCaracter;
        }
        
        String sql = "INSERT INTO usuario (usu_Cpf, usu_Nome, usu_Sobrenome, usu_Sexo, usu_DataNascimento, "
                + "usu_Rg, usu_Email, end_Cep, usu_numeroRes, usu_Complemento, usu_Telefone, "
                + "usu_Ramal, fun_CodFuncao, ubs_Cnes, log_Login) VALUES "
                + "("+ cpf +",'" + nome + "','" + sobrenome + "','" + sexo + "','" + dataNascimento + "', "
                + "'" + rg + "','" + email + "','" + cep + "'," + numero + ",'" + complemento + "', "
                + "'" + telefone + "'," + ramal + "," + funcao + "," + cnes + ",'" + login + "')";

        stmt.execute(sql);
        stop();

        l.cadastraLogin(login, nome, sobrenome, email);
        
        if(cadastrarEndereco != true){
            EnderecoDAO e = new EnderecoDAO();
            e.cadastraEndereco(cep, endereco, bairro, cidade, estado);
        }
    }
    
    public boolean pesquisaUser(long cpf) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT COUNT(*) AS Quantidade FROM usuario WHERE usu_Cpf = " + cpf + "";

        ResultSet rs = stmt.executeQuery(sql);
        rs.next();

        boolean resultado = false;

        if (rs.getInt("Quantidade") > 0) {
            resultado = true;
        }

        stop();
        return resultado;
    }
    
    public boolean pesquisaUserNome(String nome) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sql;
        
        if(nome.equals("*")){
            sql = "SELECT COUNT(*) AS Quantidade FROM usuario";
        }else{
            sql = "SELECT COUNT(*) AS Quantidade FROM usuario WHERE usu_Nome LIKE '%" + nome + "%' "
                + "OR usu_Sobrenome LIKE '%" + nome + "%'";
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
    
    public List<UserModel> preencheListaNome(String nome) throws SQLException {

        start();

        Statement stmt = conn.createStatement();

        String sql;
        
        if(nome == null){
            nome = "*";
        }
        
        if(nome.equals("*")){            
            sql = "SELECT usuario.*, funcao.*, ubs.*, endereco.* FROM usuario "
                + "INNER JOIN funcao ON usuario.fun_CodFuncao = funcao.fun_CodFun INNER JOIN ubs " 
                + "ON usuario.ubs_Cnes = ubs.ubs_Cnes INNER JOIN endereco ON usuario.end_Cep = endereco.end_Cep";            
        }else{        
            sql = "SELECT usuario.*, funcao.*, ubs.*, endereco.* FROM usuario "
                + "INNER JOIN funcao ON usuario.fun_CodFuncao = funcao.fun_CodFun INNER JOIN ubs " 
                + "ON usuario.ubs_Cnes = ubs.ubs_Cnes INNER JOIN endereco ON usuario.end_Cep = endereco.end_Cep "
                + "WHERE usu_Nome LIKE '%" + nome + "%' OR usu_Sobrenome LIKE '%" +  nome + "%'";
        }
        
        ResultSet rs = stmt.executeQuery(sql);
        
        List<UserModel> lista = new ArrayList<UserModel>();

        while (rs.next()) {
            
            UserModel user = new UserModel();
            
            user.setCpf(rs.getLong("usuario.usu_Cpf"));
            user.setNome(rs.getString("usuario.usu_Nome"));
            user.setSobrenome(rs.getString("usuario.usu_Sobrenome"));
            user.setSexo(rs.getString("usuario.usu_Sexo"));

            String dia = rs.getString("usuario.usu_DataNascimento").substring(8,10);
            String mes = rs.getString("usuario.usu_DataNascimento").substring(5,7);
            String ano = rs.getString("usuario.usu_DataNascimento").substring(0,4);
            
            String dataNascimento = dia + "/" + mes + "/" + ano;
            
            user.setDataNascimento(dataNascimento);
            user.setRg(rs.getString("usuario.usu_Rg"));
            user.setEmail(rs.getString("usuario.usu_Email"));
            user.setCep(rs.getString("endereco.end_Cep"));
            user.setNumero(rs.getInt("usuario.usu_NumeroRes"));
            user.setComplemento(rs.getString("usuario.usu_Complemento"));
            user.setTelefone(rs.getString("usuario.usu_Telefone"));
            user.setRamal(rs.getInt("usuario.usu_Ramal"));
            user.setEndereco(rs.getString("endereco.end_Endereco"));
            user.setFuncao(rs.getString("funcao.fun_Funcao"));
            user.setUbs(rs.getString("ubs.ubs_NomeFantasia"));
            user.setBairro(rs.getString("endereco.end_Bairro"));
            user.setCidade(rs.getString("endereco.end_Cidade"));
            user.setEstado(rs.getString("endereco.end_Estado"));
            user.setLogin(rs.getString("usuario.log_Login"));
            lista.add(user);
        }

        stop();
        return lista;
    }
    
    public List<UserModel> preencheLista(long cpf) throws SQLException {
               
        start();
              
        Statement stmt = conn.createStatement();

        String sql = "SELECT usuario.*, funcao.*, ubs.*, endereco.* FROM usuario "
                   + "INNER JOIN funcao ON usuario.fun_CodFuncao = funcao.fun_CodFun INNER JOIN ubs " 
                   + "ON usuario.ubs_Cnes = ubs.ubs_Cnes INNER JOIN endereco ON usuario.end_Cep = endereco.end_Cep "
                   + "WHERE usuario.usu_Cpf = " + cpf + "";

        ResultSet rs = stmt.executeQuery(sql);
        
        List<UserModel> lista = new ArrayList<UserModel>();

        while (rs.next()) {
            UserModel user = new UserModel();
            user.setCpf(rs.getLong("usuario.usu_Cpf"));
            user.setNome(rs.getString("usuario.usu_Nome"));
            user.setSobrenome(rs.getString("usuario.usu_Sobrenome"));
            user.setSexo(rs.getString("usuario.usu_Sexo"));

            String dia = rs.getString("usuario.usu_DataNascimento").substring(8,10);
            String mes = rs.getString("usuario.usu_DataNascimento").substring(5,7);
            String ano = rs.getString("usuario.usu_DataNascimento").substring(0,4);
            
            String dataNascimento = dia + "/" + mes + "/" + ano;
            
            user.setDataNascimento(dataNascimento);
            user.setRg(rs.getString("usuario.usu_Rg"));
            user.setEmail(rs.getString("usuario.usu_Email"));
            user.setCep(rs.getString("endereco.end_Cep"));
            user.setNumero(rs.getInt("usuario.usu_NumeroRes"));
            user.setComplemento(rs.getString("usuario.usu_Complemento"));
            user.setTelefone(rs.getString("usuario.usu_Telefone"));
            user.setRamal(rs.getInt("usuario.usu_Ramal"));
            user.setEndereco(rs.getString("endereco.end_Endereco"));
            user.setFuncao(rs.getString("funcao.fun_Funcao"));
            user.setUbs(rs.getString("ubs.ubs_NomeFantasia"));
            user.setBairro(rs.getString("endereco.end_Bairro"));
            user.setCidade(rs.getString("endereco.end_Cidade"));
            user.setEstado(rs.getString("endereco.end_Estado"));
            user.setLogin(rs.getString("usuario.log_Login"));
            lista.add(user);
        }

        stop();
        return lista;
    }
    
    public void atualizaUser(long cpf, String email, String cep, String endereco, int numero, 
                             String complemento, String bairro, String cidade, String estado, 
                             String telefone, int ramal, String funcao, String ubs, boolean cadastrarEndereco) 
            throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        int codFuncao;
        int codCnes;
        
        UbsDAO u = new UbsDAO();
        codCnes = u.buscaUBS(ubs);
        
        FuncaoDAO f = new FuncaoDAO();
        codFuncao = f.buscaFuncao(funcao);
        
        String sqlUser = "UPDATE usuario SET usu_email = '" + email + "', end_Cep = '" + cep + "', "
                   + "usu_NumeroRes = " + numero + ", usu_Complemento = '" + complemento + "', "
                   + "usu_Telefone = '" + telefone + "', usu_Ramal = " + ramal + ", "
                   + "fun_CodFuncao = " + codFuncao + ", ubs_Cnes = " + codCnes + " "
                   + "WHERE usu_Cpf =" + cpf  +"";
   
        stmt.execute(sqlUser);
        
        stop();
        
        if(cadastrarEndereco != true){
            EnderecoDAO e = new EnderecoDAO();
            e.cadastraEndereco(cep, endereco, bairro, cidade, estado);
        }        
    }
    
    public void excluiUser(long cpf) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sqlSELECT = "SELECT * FROM usuario WHERE usu_Cpf = " + cpf + "";
        ResultSet rs = stmt.executeQuery(sqlSELECT);
        rs.next();
        
        String login = rs.getString("log_Login");
        
        String sqlDelUser = "DELETE FROM usuario WHERE usu_Cpf = " + cpf  + "";
        stmt.execute(sqlDelUser);
        
        String sqlDelLogin = "DELETE FROM login WHERE log_Login = '" + login  + "'";
        stmt.execute(sqlDelLogin);
        
        stop();
       
    }
    
    public String buscaUbsUser(String login, int tipo) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sqlSELECT = "SELECT Usuario.*, Ubs.* FROM Usuario INNER JOIN Ubs ON "
                + "Usuario.ubs_Cnes = Ubs.ubs_Cnes "
                + "WHERE log_Login = '" + login + "'";
        ResultSet rs = stmt.executeQuery(sqlSELECT);
        rs.next();
        
        String codNome;
        
        if(tipo == 1){
         codNome = rs.getString("ubs_NomeFantasia");
        }else{
         codNome = rs.getString("ubs_Cnes");
        }
        
        stop();
        return codNome;
       
    }
    
}