package br.immunit.dao;

import br.immunit.model.PacienteModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.mail.EmailException;

public class PacienteDAO extends DAO{
    
    public void cadastraPaciente(long cartaoSUS, long cpf, String nome, String sobrenome, String sexo, String dataNascimento,
                             String rg, String email, String responsavel, String cep, int numero, String complemento, String telefone,
                             String endereco, String bairro, String cidade, String estado, boolean cadastrarEndereco) 
            throws SQLException, EmailException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String dia = dataNascimento.substring(0,2);
        String mes = dataNascimento.substring(3,5);
        String ano = dataNascimento.substring(6,10);
        
        dataNascimento = ano + "-" + mes + "-" + dia;
        
        String login = String.valueOf(cartaoSUS).toString();
        
        String sql = "INSERT INTO Paciente (pac_CartSus, pac_Cpf, pac_Nome, pac_Sobrenome, pac_Sexo, "
                   + "pac_DataNascimento, pac_Rg, pac_Email, pac_Responsavel, end_Cep, pac_NumeroRes, "
                   + "pac_Complemento, pac_Telefone, log_Login) VALUES "
                   + "(" + cartaoSUS + "," + cpf + ",'" + nome + "','" + sobrenome + "','" + sexo + "', "
                   + "'" + dataNascimento + "','" + rg + "','" + email + "','" + responsavel + "','" + cep + "', "
                   + " " + numero + ",'" + complemento + "','" + telefone + "','" + login + "')";

        stmt.execute(sql);
        stop();

        LoginDAO l = new LoginDAO();
        l.cadastraLogin(login, nome, sobrenome, email);
        
        if(cadastrarEndereco != true){
            EnderecoDAO e = new EnderecoDAO();
            e.cadastraEndereco(cep, endereco, bairro, cidade, estado);
        }
    }
    
    public boolean pesquisaPaciente(long cpf) throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();

        String sql = "SELECT COUNT(*) AS Quantidade FROM paciente WHERE pac_Cpf = " + cpf + "";

        ResultSet rs = stmt.executeQuery(sql);
        rs.next();

        boolean resultado = false;

        if (rs.getInt("Quantidade") > 0) {
            resultado = true;
        }

        stop();
        return resultado;
    }
    
    public List<PacienteModel> preencheLista(long cpf) throws SQLException {
               
        //Conexão com banco de dados
        start();
               
        //Cria um statement para podermos mandar um SQL para o banco
        Statement stmt = conn.createStatement();

        //Mandamos o SQL para o banco e obtemos um ResultSet
        String sql = "SELECT paciente.*, endereco.* FROM paciente "
                   + "INNER JOIN endereco ON paciente.end_Cep = endereco.end_Cep "
                   + "WHERE paciente.pac_Cpf = " + cpf + "";

        //Executa o comando SQL
        ResultSet rs = stmt.executeQuery(sql);
        
        List<PacienteModel> lista = new ArrayList<PacienteModel>();

        while (rs.next()) {
            PacienteModel paciente = new PacienteModel();
            
            paciente.setCartaoSUS(rs.getLong("paciente.pac_CartSus"));
            paciente.setCpf(rs.getLong("paciente.pac_Cpf"));
            paciente.setNome(rs.getString("paciente.pac_Nome"));
            paciente.setSobrenome(rs.getString("paciente.pac_Sobrenome"));
            paciente.setSexo(rs.getString("paciente.pac_Sexo"));

            String dia = rs.getString("paciente.pac_DataNascimento").substring(8,10);
            String mes = rs.getString("paciente.pac_DataNascimento").substring(5,7);
            String ano = rs.getString("paciente.pac_DataNascimento").substring(0,4);
            
            String dataNascimento = dia + "/" + mes + "/" + ano;
            
            paciente.setDataNascimento(dataNascimento);
            paciente.setRg(rs.getString("paciente.pac_Rg"));
            paciente.setEmail(rs.getString("paciente.pac_Email"));
            paciente.setResponsavel(rs.getString("paciente.pac_Responsavel"));
            paciente.setCep(rs.getString("endereco.end_Cep"));
            paciente.setNumero(rs.getInt("paciente.pac_NumeroRes"));
            paciente.setComplemento(rs.getString("paciente.pac_Complemento"));
            paciente.setTelefone(rs.getString("paciente.pac_Telefone"));
            paciente.setEndereco(rs.getString("endereco.end_Endereco"));
            paciente.setBairro(rs.getString("endereco.end_Bairro"));
            paciente.setCidade(rs.getString("endereco.end_Cidade"));
            paciente.setEstado(rs.getString("endereco.end_Estado"));
            paciente.setLogin(rs.getString("paciente.log_Login"));
            lista.add(paciente);
        }
        
        //Fecha a conexão do banco de dados
        stop();
        return lista;
    }
    
    public void atualizaPaciente(long cpf, String email, String responsavel, String cep, String endereco, int numero, 
                             String complemento, String bairro, String cidade, String estado, 
                             String telefone,boolean cadastrarEndereco) 
            throws SQLException{        
        
        start();
        Statement stmt = conn.createStatement();
        
        String sqlPaciente = "UPDATE paciente SET pac_Email = '" + email + "', pac_Responsavel = '" + responsavel + "' ,end_Cep = '" + cep + "', "
                   + "pac_NumeroRes = " + numero + ", pac_Complemento = '" + complemento + "', pac_Telefone = '" + telefone + "' "
                   + "WHERE pac_Cpf =" + cpf  +"";
   
        stmt.execute(sqlPaciente);
        
        stop();
        
        if(cadastrarEndereco != true){
            EnderecoDAO e = new EnderecoDAO();
            e.cadastraEndereco(cep, endereco, bairro, cidade, estado);
        }        
    }
    
}
