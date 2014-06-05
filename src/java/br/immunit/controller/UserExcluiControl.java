package br.immunit.controller;

import br.immunit.dao.UserDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UserExcluiControl extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        UserDAO u = new UserDAO();
        u.excluiUser(Long.parseLong(request.getParameter("cpf")));
        
        JOptionPane.showMessageDialog(null, "Usuário excluído com sucesso.");
        return mapping.findForward(SUCCESS);
    }
}
