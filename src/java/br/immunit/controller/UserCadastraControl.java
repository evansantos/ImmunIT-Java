package br.immunit.controller;

import br.immunit.dao.EnderecoDAO;
import br.immunit.dao.UbsDAO;
import br.immunit.dao.UserDAO;
import br.immunit.dao.FuncaoDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.commons.mail.EmailException;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UserCadastraControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException, EmailException{

        String cpf = request.getParameter("cpfOculto");
        String rg = request.getParameter("rgOculto");
        String nome = request.getParameter("nomeOculto");
        String sobrenome = request.getParameter("sobrenomeOculto");
        String sexo = request.getParameter("sexoOculto");
        String dataNascimento = request.getParameter("datanascimentoOculto");
        String email = request.getParameter("emailOculto");
        String telefone = request.getParameter("telefone");
        String ramal = request.getParameter("ramal");
        String funcao = request.getParameter("funcao");
        String ubs = request.getParameter("ubs");
        String cep = request.getParameter("cepOculto");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        
        HttpSession session = request.getSession();

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

        if(cpf.equals("") || nome.equals("") || sobrenome.equals("") || 
                cep.equals("") || endereco.equals("") || numero.equals("") ||  
                bairro.equals("") || cidade.equals("") || estado.equals(""))
        {
        
            JOptionPane.showMessageDialog(null, "Preencha todos os campos.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);
        
        }else{
            
            String cpf1 = cpf.replace(".", "");
            String cpf2 = cpf1.replace("-", "");
            long u_Cpf = Long.parseLong(cpf2);
            
            UserDAO user = new UserDAO();
                        
            if(user.pesquisaUser(u_Cpf)){
                
                JOptionPane.showMessageDialog(null,"CPF " + u_Cpf + " já está cadastrada.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL);
            
            }else{
            
                int u_Numero = Integer.parseInt(numero);

                int u_Ramal;

                if(ramal.isEmpty()){
                    u_Ramal = 0;
                }else{
                    u_Ramal = Integer.parseInt(ramal);
                }

                UbsDAO u = new UbsDAO();
                int u_Ubs = u.buscaUBS(ubs);

                FuncaoDAO f = new FuncaoDAO();
                int u_Funcao = f.buscaFuncao(funcao);

                String login = "";

                boolean e_Cadastrado;
                EnderecoDAO e = new EnderecoDAO();                
                e_Cadastrado = e.pesquisa(cep);

                dataNascimento = ano + "-" + mes + "-" + dia;

                user.cadastraUser(u_Cpf, nome, sobrenome, sexo, dataNascimento, rg, 
                        email, cep, u_Numero, complemento, telefone, u_Ramal, u_Funcao, 
                        u_Ubs, login, endereco, bairro, cidade, estado, e_Cadastrado);

                JOptionPane.showMessageDialog(null, "Usuário cadastrado com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(SUCCESS);
            }
        }
    }
}