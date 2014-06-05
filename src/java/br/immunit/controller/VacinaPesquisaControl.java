package br.immunit.controller;

import br.immunit.dao.VacinaDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Rafael
 */
public class VacinaPesquisaControl extends org.apache.struts.action.Action {
    
    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response) 
        throws SQLException{

        HttpSession session = request.getSession();
        
        session.removeAttribute("pesquisaVacina");        
        session.setAttribute("pesquisaVacina", request.getParameter("pesquisaVacina"));

        if(request.getParameter("pesquisaVacina").equals(""))
        {
            JOptionPane.showMessageDialog(null, "Digite o nome da vacina que deseja pesquisar.", "ImmunIT", JOptionPane.INFORMATION_MESSAGE);
            return mapping.findForward(FAIL);
        }else{
            VacinaDAO v = new VacinaDAO();
            if(v.pesquisaVacinaNome(request.getParameter("pesquisaVacina"))){
                return mapping.findForward(SUCCESS);
            }else{ 
                JOptionPane.showMessageDialog(null, "Vacina não encontrada.", "ImmunIT", JOptionPane.INFORMATION_MESSAGE);
                return mapping.findForward(FAIL);
            }
        }
    }
}
