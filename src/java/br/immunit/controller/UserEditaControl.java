package br.immunit.controller;

import br.immunit.dao.UserDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UserEditaControl extends org.apache.struts.action.Action{
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{
      
            long cpf = Long.parseLong(request.getParameter("cpf"));
            String email = request.getParameter("email");
            String cep = request.getParameter("cep");
            String endereco = request.getParameter("endereco");
            int numero = Integer.parseInt(request.getParameter("numero"));
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String telefone = request.getParameter("telefone");
            int ramal = Integer.parseInt(request.getParameter("ramal"));
            String funcao = request.getParameter("funcao");
            String ubs = request.getParameter("ubs");
            
            UserDAO u = new UserDAO();
            u.atualizaUser(cpf, email, cep, endereco, numero, complemento,bairro, 
                           cidade, estado, telefone, ramal, funcao, ubs);
            return mapping.findForward(SUCCESS);
    }
}
