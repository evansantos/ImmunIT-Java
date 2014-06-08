package br.immunit.controller;

import br.immunit.dao.PacienteDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class PacienteEditaControl extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{
            
            HttpSession session = request.getSession();
            String cpf = request.getParameter("cpf");
            session.setAttribute("cpf", cpf);
            
            return mapping.findForward(SUCCESS);
    }
}
