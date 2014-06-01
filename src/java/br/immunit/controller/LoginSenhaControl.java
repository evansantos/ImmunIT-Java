package br.immunit.controller;

import br.immunit.dao.LoginDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import javax.swing.JOptionPane;

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
        int quantidade = senhaNova.length();
        
        LoginDAO l = new LoginDAO();
        String senhaBD = l.pesquisaSenha(login);
        
        if(senhaAtual.equals(senhaBD) && senhaNova.equals(senhaConfere) && (quantidade >= 8 && quantidade <= 16)){
            l.atualizaSenha(login, senhaNova);
            JOptionPane.showMessageDialog(null,"SENHA ALTERADA COM SUCESSO.");
            return mapping.findForward(SUCCESS);
        }else{
            JOptionPane.showMessageDialog(null,"ERRO AO ALTERAR A SENHA.","",JOptionPane.ERROR_MESSAGE);
            return mapping.findForward(FAIL);
        }        
    }
}