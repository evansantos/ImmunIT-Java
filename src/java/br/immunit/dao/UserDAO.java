package br.immunit.dao;

import br.immunit.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DAO{
    
    public void cadastraUser(long cpf, String nome, String sobrenome, String sexo, String dataNascimento,
                             String rg, String email, String cep, int numero, String complemento, String telefone,
                             int ramal, int funcao, int cnes, String login, String endereco, String bairro,
                             String cidade, String estado, boolean cadastrarEndereco) 
            throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String dia = dataNascimento.substring(0,2);
        String mes = dataNascimento.substring(3,5);
        String ano = dataNascimento.substring(6,10);
        
        dataNascimento = ano + "-" + mes + "-" + dia;
        
        String sql = "INSERT INTO usuario (usu_Cpf, usu_Nome, usu_Sobrenome, usu_Sexo, usu_DataNascimento, "
                + "usu_Rg, usu_Email, end_Cep, usu_numeroRes, usu_Complemento, usu_Telefone, "
                + "usu_Ramal, fun_CodFuncao, ubs_Cnes, log_Login) VALUES "
                + "("+ cpf +",'" + nome + "','" + sobrenome + "','" + sexo + "','" + dataNascimento + "', "
                + "'" + rg + "','" + email + "','" + cep + "'," + numero + ",'" + complemento + "', "
                + "'" + telefone + "'," + ramal + "," + funcao + "," + cnes + ",'" + login + "')";

        stmt.execute(sql);
        stop();
        
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
    
    public List<UserModel> preencheLista(long cpf) throws SQLException {
               
        //Conexão com banco de dados
        start();
               
        //Cria um statement para podermos mandar um SQL para o banco
        Statement stmt = conn.createStatement();

        //Mandamos o SQL para o banco e obtemos um ResultSet
        String sql = "SELECT usuario.*, funcao.*, ubs.*, endereco.* FROM usuario "
                   + "INNER JOIN funcao ON usuario.fun_CodFuncao = funcao.fun_CodFun INNER JOIN ubs " 
                   + "ON usuario.ubs_Cnes = ubs.ubs_Cnes INNER JOIN endereco ON usuario.end_Cep = endereco.end_Cep "
                   + "WHERE usuario.usu_Cpf = " + cpf + "";

        //Executa o comando SQL
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
            lista.add(user);
        }
        
        //Fecha a conexão do banco de dados
        stop();
        return lista;
    }
    
    public void atualizaUser(long cpf, String email, String cep, String endereco, int numero, 
                             String complemento, String bairro, String cidade, String estado, 
                             String telefone, int ramal, String funcao, String ubs) throws SQLException{        
        
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
        
        //Se não existir o CEP é necessário cadastrar, caso exista ele atualiza no UPDATE acima
        /*String sqlEndereco = "UPDATE endereco SET end_Endereco = '" + endereco + "', end_Bairro = '" + bairro + "', "
                   + "end_Cidade = '" + cidade + "', end_Estado = '" + estado + "' "
                   + "WHERE end_Cep = '" + cep + "'";
   
        stmt.execute(sqlEndereco);*/
        
        
        stop();
        
    }
    
}