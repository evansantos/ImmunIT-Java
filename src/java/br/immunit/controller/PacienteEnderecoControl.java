package br.immunit.controller;

import br.immunit.dao.EnderecoDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class PacienteEnderecoControl extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) 
            throws SQLException{

        EnderecoDAO endereco = new EnderecoDAO();
        HttpSession session = request.getSession();
 
        session.removeAttribute("cartaoSUS");
        session.removeAttribute("cpf");
        session.removeAttribute("rg");
        session.removeAttribute("nome");
        session.removeAttribute("sobrenome");
        session.removeAttribute("sexo");
        session.removeAttribute("datanascimento");
        session.removeAttribute("email");
        session.removeAttribute("responsavel");
        session.removeAttribute("cep");
        
        session.setAttribute("cartaoSUS", request.getParameter("cartaoSUS"));
        session.setAttribute("cpf", request.getParameter("cpf"));
        session.setAttribute("rg", request.getParameter("rg"));
        session.setAttribute("nome", request.getParameter("nome"));
        session.setAttribute("sobrenome", request.getParameter("sobrenome"));
        session.setAttribute("sexo", request.getParameter("sexo"));
        session.setAttribute("datanascimento", request.getParameter("datanascimento"));
        session.setAttribute("email", request.getParameter("email"));
        session.setAttribute("responsavel", request.getParameter("responsavel"));
        session.setAttribute("cep", request.getParameter("cep"));
        
        if(request.getParameter("cep").equals("")){
            return mapping.findForward(FAIL);
        }else{
            if(endereco.pesquisa(request.getParameter("cep"))){
                return mapping.findForward(SUCCESS);
            }else{
                return mapping.findForward(FAIL);
            } 
        }
    }    
}