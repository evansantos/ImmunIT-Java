package br.immunit.controller;

import br.immunit.dao.LoginDAO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LoginControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        LoginDAO loginUsuario = new LoginDAO();
        
        if (loginUsuario.autentica(request.getParameter("login"), request.getParameter("senha"))) {            
            Cookie logado = new Cookie("Acesso",request.getParameter("login"));
            response.addCookie(logado);
            return mapping.findForward(SUCCESS);
        } else {
            return mapping.findForward(FAIL);   
        }
    }
}