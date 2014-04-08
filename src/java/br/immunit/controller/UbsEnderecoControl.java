package br.immunit.controller;

import br.immunit.dao.EnderecoDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UbsEnderecoControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) 
            throws SQLException{

        EnderecoDAO endereco = new EnderecoDAO();
        HttpSession session = request.getSession();
        
        session.removeAttribute("cnes");
        session.removeAttribute("nomeFantasia");
        session.removeAttribute("razaoSocial");
        session.removeAttribute("telefone");
        session.removeAttribute("cep");
        
        session.setAttribute("cnes", request.getParameter("cnes"));
        session.setAttribute("nomeFantasia", request.getParameter("nomefantasia"));
        session.setAttribute("razaoSocial", request.getParameter("razaosocial"));
        session.setAttribute("telefone", request.getParameter("telefone"));
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