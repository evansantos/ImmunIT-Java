package br.immunit.controller;

import br.immunit.dao.LoginDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LoginSenhaControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        String login = request.getParameter("usuario");
        String senhaAtual = request.getParameter("senhaatual");
        String senhaNova = request.getParameter("novasenha");
        String senhaConfere = request.getParameter("novasenhaconfere");
        
        LoginDAO l = new LoginDAO();
        String senhaBD = l.pesquisaSenha(login);
        
        if(senhaAtual.equals(senhaBD)){
            if(senhaNova.equals(senhaConfere)){
                l.atualizaSenha(login, senhaNova);
                return mapping.findForward(SUCCESS);
            }else{
                return mapping.findForward(FAIL);
            }
        }else{
            return mapping.findForward(FAIL);
        }        
    }
    
}