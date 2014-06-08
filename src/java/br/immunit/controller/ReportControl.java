package br.immunit.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ReportControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        HttpSession session = request.getSession();
        
        session.removeAttribute("ubs");
        session.removeAttribute("vacina");
        session.removeAttribute("lote");
        session.removeAttribute("data");
               
        session.setAttribute("ubs", request.getParameter("ubs"));
        session.setAttribute("vacina", request.getParameter("vacina"));
        session.setAttribute("lote", request.getParameter("lote"));
        session.setAttribute("validade", request.getParameter("validade"));

        return mapping.findForward(SUCCESS);
    }
}
