package br.immunit.controller;

import br.immunit.dao.EnderecoDAO;
import br.immunit.dao.PacienteDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.commons.mail.EmailException;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class PacienteCadastraControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException, EmailException{
        
        String cartaoSUS = request.getParameter("cartaoSUSOculto");
        String cpf = request.getParameter("cpfOculto");
        String rg = request.getParameter("rgOculto");
        String nome = request.getParameter("nomeOculto");
        String sobrenome = request.getParameter("sobrenomeOculto");
        String sexo = request.getParameter("sexoOculto");
        String dataNascimento = request.getParameter("datanascimentoOculto");
        String email = request.getParameter("emailOculto");
        String responsavel = request.getParameter("responsavelOculto");
        String cep = request.getParameter("cepOculto");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String telefone = request.getParameter("telefone");
        
        int dia;
        int mes;
        int ano;
        String anoAtual;
        
        if(dataNascimento.isEmpty()){
            JOptionPane.showMessageDialog(null, "Campo data de nascimento vazio, por favor preencher.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);
        }else{        
            dia = Integer.parseInt(dataNascimento.substring(0,2));
            mes = Integer.parseInt(dataNascimento.substring(3,5));
            ano = Integer.parseInt(dataNascimento.substring(6,10));
            
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");    
            Calendar c = Calendar.getInstance();
            anoAtual = df.format(c.getTime()).substring(6, 10);
            
            if((ano < 1900 || ano > Integer.parseInt(anoAtual)) || 
                (mes < 1 || mes > 12) || (dia < 1 || dia > 31)){
                
                JOptionPane.showMessageDialog(null, "Data de nascimento inválido.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL); 
                
            }
        }

        if(cartaoSUS.equals("") || cpf.equals("") || nome.equals("") || sobrenome.equals("") || 
                cep.equals("") || endereco.equals("") || numero.equals("") ||  
                bairro.equals("") || cidade.equals("") || estado.equals(""))
        {
            JOptionPane.showMessageDialog(null, "Preencha todos os campos.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);
        }else{
            
            String p_cartaoSUS1 = cartaoSUS.replace(".", "");
            long p_cartaoSUS = Long.parseLong(p_cartaoSUS1);
            
            String cpf1 = cpf.replace(".", "");
            String cpf2 = cpf1.replace("-", "");
            
            long u_Cpf = Long.parseLong(cpf2);
            
            PacienteDAO paciente = new PacienteDAO();
            
            if(paciente.pesquisaPaciente(u_Cpf, p_cartaoSUS)){
                
                JOptionPane.showMessageDialog(null,"Paciente já está cadastrada.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL);
                
            }else{   
                
                int u_Numero = Integer.parseInt(numero);

                boolean e_Cadastrado;
                EnderecoDAO e = new EnderecoDAO();                
                e_Cadastrado = e.pesquisa(cep);

                paciente.cadastraPaciente(p_cartaoSUS, u_Cpf, nome, sobrenome, sexo, dataNascimento, rg, 
                                          email, responsavel, cep, u_Numero, complemento, telefone, endereco, 
                                          bairro, cidade, estado, e_Cadastrado);

                JOptionPane.showMessageDialog(null, "Usuário cadastrado com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(SUCCESS);
                
            }
        }
    }
}
