package br.immunit.controller;

import br.immunit.dao.UbsDAO;
import br.immunit.dao.UserDAO;
import br.immunit.dao.FuncaoDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UserCadastraControl extends org.apache.struts.action.Action {
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String sexo = request.getParameter("sexo");
        String dataNascimento = request.getParameter("datanascimento");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String ramal = request.getParameter("ramal");
        String funcao = request.getParameter("funcao");
        String ubs = request.getParameter("ubs");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("endereco");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String enderecoExiste = request.getParameter("enderecoExiste");

        if(cpf.equals("") || nome.equals("") || sobrenome.equals("") || 
                cep.equals("") || endereco.equals("") || numero.equals("") ||  
                bairro.equals("") || cidade.equals("") || estado.equals(""))
        {
            return mapping.findForward(FAIL);
        }else{
            
            long u_Cpf = Long.parseLong(cpf);
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
            
            UserDAO user = new UserDAO();
            user.cadastraUser(u_Cpf, nome, sobrenome, sexo, dataNascimento, rg, 
                    email, cep, u_Numero, complemento, telefone, u_Ramal, u_Funcao, 
                    u_Ubs, login, endereco, bairro, cidade, estado, e_Cadastrado);
            
            return mapping.findForward(SUCCESS);
        }
    }
}