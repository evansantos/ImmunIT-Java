package br.immunit.controller;

import br.immunit.dao.LoginDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class LoginEnviaSenhaControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        String cpfCompleto = request.getParameter("cpf");
        String cpfTiraPonto = cpfCompleto.replace(".", "");
        String cpfTiraTraco = cpfTiraPonto.replace("-", "");
        String cpf = cpfTiraTraco;
        
        LoginDAO l = new LoginDAO();
                
        if(l.enviaSenha(cpf)){
            JOptionPane.showMessageDialog(null,"Senha enviada para seu e-mail.", "ImmunIT", JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(SUCCESS);
        }else{
            JOptionPane.showMessageDialog(null,"Usuário não encontrado, por favor procurar a UBS mais próxima.","ImmunIT", JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);
        }        
    }
}