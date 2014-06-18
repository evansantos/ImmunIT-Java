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

        if (JOptionPane.showConfirmDialog(null, "Tem certeza que deseja excluir esse usuário?", "WARNING",JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
            UserDAO u = new UserDAO();
            u.excluiUser(Long.parseLong(request.getParameter("cpf")));
            JOptionPane.showMessageDialog(null, "Usuário excluído com sucesso.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(SUCCESS);
        }else{
            JOptionPane.showMessageDialog(null, "Operação cancelada.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(SUCCESS);
        }
    }
}
