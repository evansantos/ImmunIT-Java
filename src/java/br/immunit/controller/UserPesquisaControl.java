package br.immunit.controller;

import br.immunit.dao.UserDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UserPesquisaControl extends org.apache.struts.action.Action{
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        HttpSession session = request.getSession();
        
        session.removeAttribute("pesquisaUser");        
        session.setAttribute("pesquisaUser", request.getParameter("pesquisaUser"));

        if(request.getParameter("pesquisaUser").equals(""))
        {
            JOptionPane.showMessageDialog(null, "Digite o nome do usuário que deseja pesquisar.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);
        }else{
            UserDAO u = new UserDAO();
            if(u.pesquisaUserNome(request.getParameter("pesquisaUser"))){
                return mapping.findForward(SUCCESS);
            }else{
                JOptionPane.showMessageDialog(null, "Usuário não encontrado.","ImmunIT",JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL);
            }
        }
    }
}
