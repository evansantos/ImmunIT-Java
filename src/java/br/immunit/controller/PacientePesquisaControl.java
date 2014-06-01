package br.immunit.controller;

import br.immunit.dao.PacienteDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class PacientePesquisaControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        HttpSession session = request.getSession();
        
        session.removeAttribute("pesquisaPaciente");        
        session.setAttribute("pesquisaPaciente", request.getParameter("pesquisaPaciente"));

        if(request.getParameter("pesquisaPaciente").equals(""))
        {
            return mapping.findForward(FAIL);
        }else{
            PacienteDAO p = new PacienteDAO();
            if(p.pesquisaPaciente(Long.parseLong(request.getParameter("pesquisaPaciente")))){
                return mapping.findForward(SUCCESS);
            }else{ 
                return mapping.findForward(FAIL);
            }
        }
    }
}
