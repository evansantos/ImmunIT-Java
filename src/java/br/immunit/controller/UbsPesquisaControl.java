package br.immunit.controller;

import br.immunit.dao.UbsDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UbsPesquisaControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        HttpSession session = request.getSession();
        
        session.removeAttribute("pesquisaUBS");        
        session.setAttribute("pesquisaUBS", request.getParameter("pesquisaUBS"));

        if(request.getParameter("pesquisaUBS").equals(""))
        {
            return mapping.findForward(FAIL);
        }else{
            UbsDAO u = new UbsDAO();
            if(u.pesquisaUBS(Integer.parseInt(request.getParameter("pesquisaUBS")))){
                return mapping.findForward(SUCCESS);
            }else{ 
                return mapping.findForward(FAIL);
            }
        }
    }
}
