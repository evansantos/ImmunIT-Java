package br.immunit.controller;

import br.immunit.dao.PacienteDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        
        String cartaoSUS = request.getParameter("cartaoSUS");
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String sexo = request.getParameter("sexo");
        String dataNascimento = request.getParameter("datanascimento");
        String email = request.getParameter("email");
        String responsavel = request.getParameter("responsavel");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String telefone = request.getParameter("telefone");
        String enderecoExiste = request.getParameter("enderecoExiste");

        if(cartaoSUS.equals("") || cpf.equals("") || nome.equals("") || sobrenome.equals("") || 
                cep.equals("") || endereco.equals("") || numero.equals("") ||  
                bairro.equals("") || cidade.equals("") || estado.equals(""))
        {
            return mapping.findForward(FAIL);
        }else{
            
            String p_cartaoSUS1 = cartaoSUS.replace(".", "");
            long p_cartaoSUS = Long.parseLong(p_cartaoSUS1);
            
            String cpf1 = cpf.replace(".", "");
            String cpf2 = cpf1.replace("-", "");
            
            long u_Cpf = Long.parseLong(cpf2);
            int u_Numero = Integer.parseInt(numero);
            
            boolean e_Cadastrado;
            if(enderecoExiste.equals("1")){
                e_Cadastrado = true;
            }else{
                e_Cadastrado = false;
            }
            
            PacienteDAO paciente = new PacienteDAO();
            paciente.cadastraPaciente(p_cartaoSUS, u_Cpf, nome, sobrenome, sexo, dataNascimento, rg, 
                                      email, responsavel, cep, u_Numero, complemento, telefone, endereco, 
                                      bairro, cidade, estado, e_Cadastrado);

            return mapping.findForward(SUCCESS);
        }
    }
}
