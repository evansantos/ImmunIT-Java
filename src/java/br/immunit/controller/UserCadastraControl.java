package br.immunit.controller;

import br.immunit.dao.UbsDAO;
import br.immunit.dao.UserDAO;
import br.immunit.dao.FuncaoDAO;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        String enderecoExiste = request.getParameter("enderecoExiste");

        int dia = Integer.parseInt(dataNascimento.substring(0,2));
        int mes = Integer.parseInt(dataNascimento.substring(3,5));
        int ano = Integer.parseInt(dataNascimento.substring(6,10));

        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");    
        Calendar c = Calendar.getInstance();
        String anoAtual = df.format(c.getTime()).substring(6, 10);
        
        if(cpf.equals("") || nome.equals("") || sobrenome.equals("") || 
                cep.equals("") || endereco.equals("") || numero.equals("") ||  
                bairro.equals("") || cidade.equals("") || estado.equals("") || 
                (ano < 1900 || ano > Integer.parseInt(anoAtual)) || 
                (mes < 1 || mes > 12) || (dia < 1 || dia > 31))
        {
            return mapping.findForward(FAIL);
        }else{
            
            String cpf1 = cpf.replace(".", "");
            String cpf2 = cpf1.replace("-", "");
            
            long u_Cpf = Long.parseLong(cpf2);
            int u_Numero = Integer.parseInt(numero);
            int u_Ramal = Integer.parseInt(ramal);
            
            UbsDAO u = new UbsDAO();
            int u_Ubs = u.buscaUBS(ubs);
            
            FuncaoDAO f = new FuncaoDAO();
            int u_Funcao = f.buscaFuncao(funcao);
            
            String login = "";
            
            boolean e_Cadastrado;
            if(enderecoExiste.equals("1")){
                e_Cadastrado = true;
            }else{
                e_Cadastrado = false;
            }
        
            dataNascimento = ano + "-" + mes + "-" + dia;
            
            UserDAO user = new UserDAO();
            user.cadastraUser(u_Cpf, nome, sobrenome, sexo, dataNascimento, rg, 
                    email, cep, u_Numero, complemento, telefone, u_Ramal, u_Funcao, 
                    u_Ubs, login, endereco, bairro, cidade, estado, e_Cadastrado);
            
            return mapping.findForward(SUCCESS);
        }
    }
}